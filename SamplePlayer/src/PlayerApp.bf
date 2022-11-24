using SDL2;
using System;
using System.Threading;
using System.Diagnostics;
using System.Collections;

namespace SamplePlayer;

class PlayerApp
{
	private SDL.Window* mWindow;
	private SDL.Renderer* mRenderer;
	private SDL.Texture* mTexture ~ SDL.DestroyTexture(_);

	private String mFileName;
	private Decoder mDecoder = new .() ~ delete _;
	private Stopwatch mStopwatch = new .() ~ delete _;
	private int64 mLastFrameTime;

	private int32 mWidth;
	private int32 mHeight;
	private int32 mFrameInterval;

	public this(String fileName)
	{
		mFileName = fileName;
	}

	public void Init()
	{
		mDecoder.Open(mFileName);

		mWidth = (.)mDecoder.Width;
		mHeight = (.)mDecoder.Height;
		mFrameInterval = (.)((1.0 / mDecoder.FrameRate) * 1000.0);

		// Initialize SDL.
		if (SDL.Init(.Video) < 0)
			return;

		// create the window and renderer
		// note that the renderer is accelerated
		mWindow = SDL.CreateWindow("SamplePlayer", .Centered, .Centered, mWidth, mHeight, 0);
		mRenderer = SDL.CreateRenderer(mWindow, -1, .Accelerated);

		mTexture = SDL.CreateTexture(mRenderer, SDL.PIXELFORMAT_RGBA8888, (.)SDL.TextureAccess.Streaming, mWidth, mHeight);

		mDecoder.Start();
		mStopwatch.Start();
	}

	public void Run()
	{
		while (true)
		{
			while (SDL.PollEvent(let event) != 0)
			{
				switch (event.type)
				{
				case .Quit:
					return;
				default:
					break;
				}
			}

			Update();

			SDL.RenderClear(mRenderer);
			Draw();
			SDL.RenderPresent(mRenderer);
		}
	}

	public void Update()
	{
		let frameTime = mStopwatch.ElapsedMilliseconds;
		if (frameTime - mLastFrameTime < mFrameInterval)
		{
			Thread.Sleep((.)mFrameInterval - (frameTime - mLastFrameTime));
			return;
		}

		mLastFrameTime = frameTime;

		let frameData = mDecoder.GetVideoFrame();
		defer delete frameData;

		if (frameData == null)
		{
			mDecoder.Stop();
			return;
		}

		if (SDL.LockTexture(mTexture, null, let bytes, let pitch) == 0)
		{
			int rowLength = Math.Align(mWidth * 4, 32) / 4;

			if (rowLength != mWidth)
			{
				for(int y = 0; y < mHeight; ++y)
				{
				    for (int x = 0; x < rowLength; ++x)
					{
						if (x >= mWidth)
							continue;
						//uint8[4] rgba = .(255, (.)(255 * pixels[x][y].z), (.)(255 * pixels[x][y].y), (.)(255 * pixels[x][y].x));
						Internal.MemCpy(&((uint8*)bytes)[(y * mWidth + x)*4], &frameData[(y * rowLength + x)*4], 4);
				    }
				}
			}
			else
			{
				Internal.MemCpy(bytes, &frameData[0], frameData.Count);
			}
			SDL.UnlockTexture(mTexture);
		}
	}

	public void Draw()
	{
		SDL.RenderCopy(mRenderer, mTexture, null, null);
	}
}