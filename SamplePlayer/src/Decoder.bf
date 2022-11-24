using System;
using System.IO;
using System.Threading;
using System.Collections;
using FFmpeg;

namespace SamplePlayer;

class Decoder
{
	private const ffmpeg.AVPixelFormat PIXEL_FORMAT = .AV_PIX_FMT_ABGR;

	private FileStream mFileStream = new .() ~ delete _;

	public int Width { get; private set; }
	public int Height { get; private set; }
	public double FrameRate { get; private set; }

	private Monitor mLock = new .() ~ delete _;
	private Thread mThread ~ delete _;
	private bool mKillThread;

	private ffmpeg.AVFormatContext* mFormatContext;
	private void* mContextBuffer;
	private uint8[] mContextBufferArray ~ delete _;

	private ffmpeg.AVCodecContext* mVideoCodecContext;
	private ffmpeg.SwsContext* mSwsContext;
	private ffmpeg.AVStream* mVideoStream;
	private ffmpeg.AVFrame* mFrame;
	private ffmpeg.AVFrame* mFrameRGB;
	private Queue<uint8[]> mVideoFrames = new .() ~ { while (!_.IsEmpty) delete _.PopFront(); delete _; }

	public this()
	{
	}

	public ~this()
	{
		Stop();

		if (mFrame != null)
			ffmpeg.av_frame_free(&mFrame);

		if (mFrameRGB != null)
			ffmpeg.av_frame_free(&mFrameRGB);

		if (mVideoCodecContext != null)
			ffmpeg.avcodec_close(mVideoCodecContext);

		if (mFormatContext != null)
			ffmpeg.avformat_close_input(&mFormatContext);

		if (mSwsContext != null)
			ffmpeg.sws_freeContext(mSwsContext);
	}

	public Result<void> Open(String filename)
	{
		if (mFormatContext != null)
			return .Ok;

		Try!(mFileStream.Open(filename, .Read, .Read));

		const int bufferSize = 4096;

		mFormatContext = ffmpeg.avformat_alloc_context();
		mContextBuffer = ffmpeg.av_malloc(bufferSize);
		mContextBufferArray = new uint8[bufferSize];
		mFormatContext.pb = ffmpeg.avio_alloc_context((.)mContextBuffer, bufferSize, 0, Internal.UnsafeCastToPtr(this), => readPacket, null, => streamSeek);

		if (ffmpeg.avformat_open_input(&mFormatContext, "dummy", null, null) < 0)
			return .Err;

		if (ffmpeg.avformat_find_stream_info(mFormatContext, null) < 0)
			return .Err;

		for (int i < mFormatContext.nb_streams)
		{
			let stream = mFormatContext.streams[i];

			if (stream.codecpar.codec_type == ffmpeg.AVMediaType.AVMEDIA_TYPE_VIDEO)
			{
				mVideoStream = stream;
				break;
			}
		}

		var codecPtr = ffmpeg.avcodec_find_decoder(mVideoStream.codecpar.codec_id);
		if (codecPtr == null)
			return .Err;

		int32 openCodecResult = ffmpeg.avcodec_open2(mVideoStream.codec, codecPtr, null);
		if (openCodecResult < 0)
			return .Err;

		Width = mVideoStream.codecpar.width;
		Height = mVideoStream.codecpar.height;
		FrameRate = mVideoStream.avg_frame_rate.Value;

		mFrame = ffmpeg.av_frame_alloc();
		mFrameRGB = ffmpeg.av_frame_alloc();
		if (mFrameRGB == null)
			return .Err;

		mFrameRGB.format = (.)PIXEL_FORMAT;
		mFrameRGB.width = mVideoStream.codec.width;
		mFrameRGB.height = mVideoStream.codec.height;

		var ret = ffmpeg.av_frame_get_buffer(mFrameRGB, 32);
		if (ret < 0)
			return .Err;

		mSwsContext = ffmpeg.sws_getContext(mVideoStream.codec.width, mVideoStream.codec.height,
			mVideoStream.codec.pix_fmt, mVideoStream.codec.width,
			mVideoStream.codec.height, PIXEL_FORMAT, ffmpeg.SWS_FAST_BILINEAR,
			null, null, null);

		return .Ok;
	}

	public void Start()
	{
		if (mThread != null)
			return;
		mThread = new .(new => runLoop);
		mThread.Start(false);
	}

	public void Stop()
	{
		if (mThread == null)
			return;
		mKillThread = true;
		mThread.Join();
		DeleteAndNullify!(mThread);
	}

	public uint8[] GetVideoFrame()
	{
		using (mLock.Enter())
			return mVideoFrames.IsEmpty ? null : mVideoFrames.PopFront();
	}

	private const int32 AVERROR_EOF = -541478725;

	private void runLoop()
	{
		var packet = ffmpeg.av_packet_alloc();
		defer ffmpeg.av_packet_free(&packet);

		while (!mKillThread)
		{
			if (mVideoFrames.Count >= 2)
			{
				Thread.Sleep(1);
				continue;
			}

			int32 result = ffmpeg.av_read_frame(mFormatContext, packet);
			if (result < 0)
			{
				Thread.Sleep(1);
				continue;
			}

			if (packet.stream_index == mVideoStream.index)
			{
				if (ffmpeg.avcodec_send_packet(mVideoStream.codec, packet) == 0)
				{
					if (ffmpeg.avcodec_receive_frame(mVideoStream.codec, mFrame) == 0)
					{
						// Convert the image from its native format to RGB
						ffmpeg.sws_scale(mSwsContext, (.)&mFrame._data[0],
							(.)&mFrame._linesize[0], 0, mVideoStream.codec.height,
							(.)&mFrameRGB._data[0], (.)&mFrameRGB._linesize[0]);

						var data = new uint8[mFrameRGB.linesize[0] * mFrameRGB.height];
						Internal.MemCpy(data.Ptr, (void*)mFrameRGB.data[0], data.Count);

						using (mLock.Enter())
							mVideoFrames.Add(data);
					}
				}
			}

			ffmpeg.av_packet_unref(packet);
		}
	}

	[CallingConvention(.Cdecl)]
	private static int32 readPacket(void* opaque, uint8* buf, int32 buflen)
	{
		var decoder = (Self)Internal.UnsafeCastToObject(opaque);

		if (buflen != decoder.mContextBufferArray.Count)
		{
			delete decoder.mContextBufferArray;
			decoder.mContextBufferArray = new uint8[buflen];
		}

		int bytesRead = decoder.mFileStream.TryRead(.(decoder.mContextBufferArray, 0, buflen));
		Internal.MemCpy(buf, decoder.mContextBufferArray.Ptr, bytesRead);

		return bytesRead != 0 ? (.)bytesRead : AVERROR_EOF;
	}

	private const int SEEK_SET = 0;
	private const int SEEK_CUR = 1;
	private const int SEEK_END = 2;

	[CallingConvention(.Cdecl)]
	private static int64 streamSeek(void* opaque, int64 offset, int32 whence)
	{
		var decoder = (Self)Internal.UnsafeCastToObject(opaque);

		switch (whence)
		{
		case SEEK_SET:
			decoder.mFileStream.Seek(offset, .Absolute);
			break;

		case SEEK_CUR:
			decoder.mFileStream.Seek(offset, .Relative);
			break;

		case SEEK_END:
			decoder.mFileStream.Seek(offset, .FromEnd);
			break;

		case ffmpeg.AVSEEK_SIZE:
			return decoder.mFileStream.Length;

		default:
			return -1;
		}

		return decoder.mFileStream.Position;
	}
}