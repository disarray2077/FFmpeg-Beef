using System;
using System.Collections;
using System.Globalization;
using internal FFmpeg;

namespace FFmpeg
{
    public static class ffmpeg
    {
        private const String avutil_lib = "avutil-56.dll";
        private const String avformat_lib = "avformat-58.dll";
        private const String avcodec_lib = "avcodec-58.dll";
        private const String avdevice_lib = "avdevice-58.dll";
        private const String swscale_lib = "swscale-5.dll";

        #region API

        // Function @ mem.h:507:6
        //	x86_64-pc-windows-msvc (libavutil\mem.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void av_memcpy_backptr(byte* dst, int32 back, int32 cnt);

        // Function @ frame.h:889:14
        //	x86_64-pc-windows-msvc (libavutil\frame.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVBufferRef* av_frame_get_plane_buffer(AVFrame* frame, int32 plane);

        // Function @ swscale.h:330:16
        //	x86_64-pc-windows-msvc (libswscale\swscale.h)
        [Import(swscale_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVClass* sws_get_class();

        // Function @ opt.h:865:5
        //	x86_64-pc-windows-msvc (libavutil\opt.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_opt_serialize(void* obj, int32 opt_flags, int32 flags, CString* buffer, CChar key_val_sep, CChar pairs_sep);

        // Function @ hwcontext.h:371:5
        //	x86_64-pc-windows-msvc (libavutil\hwcontext.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_hwframe_ctx_init(AVBufferRef* @ref);

        // Function @ mem.h:407:6
        //	x86_64-pc-windows-msvc (libavutil\mem.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void av_fast_malloc(void* ptr, uint* size, ulong min_size);

        // Function @ avio.h:857:5
        //	x86_64-pc-windows-msvc (libavformat\avio.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 avio_read_to_bprint32(AVIOContext* h, AVBPrint* pb, ulong max_size);

        // Function @ packet.h:476:6
        //	x86_64-pc-windows-msvc (libavcodec\packet.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void av_shrink_packet(AVPacket* pkt, int32 size);

        // Function @ avcodec.h:2716:10
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern uint32 avcodec_version();

        // Function @ avio.h:578:5
        //	x86_64-pc-windows-msvc (libavformat\avio.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 avio_printf(AVIOContext* s, CString fmt);

        // Function @ avformat.h:2869:6
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void av_url_split(CString proto, int32 proto_size, CString authorization, int32 authorization_size, CString hostname, int32 hostname_size, int* port_ptr, CString path, int32 path_size, CString url);

        // Function @ swscale.h:274:6
        //	x86_64-pc-windows-msvc (libswscale\swscale.h)
        [Import(swscale_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void sws_freeVec(SwsVector* a);

        // Function @ buffer.h:198:5
        //	x86_64-pc-windows-msvc (libavutil\buffer.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_buffer_realloc(AVBufferRef** buf, int32 size);

        // Function @ avio.h:566:9
        //	x86_64-pc-windows-msvc (libavformat\avio.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern long avio_size(AVIOContext* s);

        // Function @ avformat.h:3038:5
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 avformat_match_stream_specifier(AVFormatContext* s, AVStream* st, CString spec);

        // Function @ packet.h:653:6
        //	x86_64-pc-windows-msvc (libavcodec\packet.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void av_packet_unref(AVPacket* pkt);

        // Function @ avformat.h:2379:5
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_find_best_stream(AVFormatContext* ic, AVMediaType type, int32 wanted_stream_nb, int32 related_stream, AVCodec** decoder_ret, int32 flags);

        // Function @ packet.h:499:5
        //	x86_64-pc-windows-msvc (libavcodec\packet.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_packet_from_data(AVPacket* pkt, byte* data, int32 size);

        // Function @ avformat.h:2096:17
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVOutputFormat* av_oformat_next(AVOutputFormat* f);

        // Function @ codec.h:366:10
        //	x86_64-pc-windows-msvc (libavcodec\codec.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVCodec* avcodec_find_encoder(AVCodecID id);

        // Function @ avformat.h:2920:5
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_filename_number_test(CString filename);

        // Function @ avutil.h:358:7
        //	x86_64-pc-windows-msvc (libavutil\avutil.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern CString av_fourcc_make_string(CString buf, uint32 fourcc);

        // Function @ mathematics.h:130:9
        //	x86_64-pc-windows-msvc (libavutil\mathematics.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern long av_rescale(long a, long b, long c);

        // Function @ avdevice.h:80:16
        //	x86_64-pc-windows-msvc (libavdevice\avdevice.h)
        [Import(avdevice_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVInputFormat* av_input_audio_device_next(AVInputFormat* d);

        // Function @ avformat.h:2256:27
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVInputFormat* av_probe_input_format2(AVProbeData* pd, int32 is_opened, int* score_max);

        // Function @ opt.h:455:6
        //	x86_64-pc-windows-msvc (libavutil\opt.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void av_opt_free(void* obj);

        // Function @ buffer.h:266:15
        //	x86_64-pc-windows-msvc (libavutil\buffer.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVBufferPool* av_buffer_pool_init2(int32 size, void* opaque, FnPtr_VoidPtr_Int_AVBufferRefPtr alloc, FnPtr_VoidPtr_Void pool_free);

        // Function @ avcodec.h:3759:5
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_picture_pad(AVPicture* dst, AVPicture* src, int32 height, int32 width, AVPixelFormat pix_fmt, int32 padtop, int32 padbottom, int32 padleft, int32 padright, int* color);

        // Function @ hwcontext.h:492:7
        //	x86_64-pc-windows-msvc (libavutil\hwcontext.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void* av_hwdevice_hwconfig_alloc(AVBufferRef* device_ctx);

        // Function @ hwcontext.h:514:6
        //	x86_64-pc-windows-msvc (libavutil\hwcontext.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void av_hwframe_constraints_free(AVHWFramesConstraints** constraints);

        // Function @ mem.h:484:7
        //	x86_64-pc-windows-msvc (libavutil\mem.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern CString av_strndup(CString s, ulong len);

        // Function @ rational.h:120:5
        //	x86_64-pc-windows-msvc (libavutil\rational.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_reduce(int32* dst_num, int* dst_den, long num, long den, long max);

        // Function @ avformat.h:3056:5
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_apply_bitstream_filters(AVCodecContext* codec, AVPacket* pkt, AVBitStreamFilterContext* bsfc);

        // Function @ swscale.h:55:13
        //	x86_64-pc-windows-msvc (libswscale\swscale.h)
        [Import(swscale_lib), CLink, CallingConvention(.Cdecl)]
        public static extern CString swscale_license();

        // Function @ avcodec.h:2370:26
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void av_codec_set_codec_descriptor(AVCodecContext* avctx, AVCodecDescriptor* desc);

        // Function @ opt.h:687:5
        //	x86_64-pc-windows-msvc (libavutil\opt.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_opt_set_int(void* obj, CString name, long val, int32 search_flags);

        // Function @ cpu.h:112:5
        //	x86_64-pc-windows-msvc (libavutil\cpu.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_parse_cpu_caps(uint32* flags, CString s);

        // Function @ avformat.h:2706:16
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVCodecID av_guess_codec(AVOutputFormat* fmt, CString short_name, CString filename, CString mime_type, AVMediaType type);

        // Function @ codec.h:374:10
        //	x86_64-pc-windows-msvc (libavcodec\codec.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVCodec* avcodec_find_encoder_by_name(CString name);

        // Function @ mem.h:342:5
        //	x86_64-pc-windows-msvc (libavutil\mem.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_reallocp_array(void* ptr, ulong nmemb, ulong size);

        // Function @ avutil.h:321:10
        //	x86_64-pc-windows-msvc (libavutil\avutil.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern uint32 av_int_list_length_for_size(uint32 elsize, void* list, ulong term);

        // Function @ opt.h:747:5
        //	x86_64-pc-windows-msvc (libavutil\opt.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_opt_get_pixel_fmt(void* obj, CString name, int32 search_flags, AVPixelFormat* out_fmt);

        // Function @ opt.h:691:5
        //	x86_64-pc-windows-msvc (libavutil\opt.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_opt_set_image_size(void* obj, CString name, int32 w, int32 h, int32 search_flags);

        // Function @ dict.h:103:20
        //	x86_64-pc-windows-msvc (libavutil\dict.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVDictionaryEntry* av_dict_get(AVDictionary* m, CString key, AVDictionaryEntry* prev, int32 flags);

        // Function @ opt.h:603:17
        //	x86_64-pc-windows-msvc (libavutil\opt.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVOption* av_opt_find(void* obj, CString name, CString unit, int32 opt_flags, int32 search_flags);

        // Function @ avcodec.h:3731:5
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 avpicture_layout(AVPicture* src, AVPixelFormat pix_fmt, int32 width, int32 height, byte* dest, int32 dest_size);

        // Function @ avformat.h:2233:27
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVInputFormat* av_find_input_format(CString short_name);

        // Function @ hwcontext.h:266:14
        //	x86_64-pc-windows-msvc (libavutil\hwcontext.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVBufferRef* av_hwdevice_ctx_alloc(AVHWDeviceType type);

        // Function @ avio.h:483:6
        //	x86_64-pc-windows-msvc (libavformat\avio.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void avio_wl32(AVIOContext* s, uint32 val);

        // Function @ rational.h:208:10
        //	x86_64-pc-windows-msvc (libavutil\rational.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern uint32 av_q2intfloat(AVRational q);

        // Function @ mathematics.h:160:9
        //	x86_64-pc-windows-msvc (libavutil\mathematics.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern long av_rescale_q_rnd(long a, AVRational bq, AVRational cq, AVRounding rnd);

        // Function @ avio.h:866:5
        //	x86_64-pc-windows-msvc (libavformat\avio.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 avio_accept(AVIOContext* s, AVIOContext** c);

        // Function @ packet.h:597:13
        //	x86_64-pc-windows-msvc (libavcodec\packet.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern CString av_packet_side_data_name(AVPacketSideDataType type);

        // Function @ packet.h:564:5
        //	x86_64-pc-windows-msvc (libavcodec\packet.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_packet_add_side_data(AVPacket* pkt, AVPacketSideDataType type, byte* data, ulong size);

        // Function @ bsf.h:319:5
        //	x86_64-pc-windows-msvc (libavcodec\bsf.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_bsf_get_null_filter(AVBSFContext** bsf);

        // Function @ samplefmt.h:140:5
        //	x86_64-pc-windows-msvc (libavutil\samplefmt.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_get_bytes_per_sample(AVSampleFormat sample_fmt);

        // Function @ avformat.h:1250:12
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern long av_stream_get_end_pts(AVStream* st);

        // Function @ channel_layout.h:192:5
        //	x86_64-pc-windows-msvc (libavutil\channel_layout.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_get_channel_layout_channel_index(ulong channel_layout, ulong channel);

        // Function @ frame.h:700:9
        //	x86_64-pc-windows-msvc (libavutil\frame.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern long av_frame_get_channel_layout(AVFrame* frame);

        // Function @ avcodec.h:3724:5
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 avpicture_fill(AVPicture* picture, byte* ptr, AVPixelFormat pix_fmt, int32 width, int32 height);

        // Function @ mem.h:693:6
        //	x86_64-pc-windows-msvc (libavutil\mem.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void av_max_alloc(ulong max);

        // Function @ avio.h:665:5
        //	x86_64-pc-windows-msvc (libavformat\avio.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 avio_get_str16be(AVIOContext* pb, int32 maxlen, CString buf, int32 buflen);

        // Function @ cpu.h:128:8
        //	x86_64-pc-windows-msvc (libavutil\cpu.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern ulong av_cpu_max_align();

        // Function @ avdevice.h:479:5
        //	x86_64-pc-windows-msvc (libavdevice\avdevice.h)
        [Import(avdevice_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 avdevice_list_devices(AVFormatContext* s, AVDeviceInfoList** device_list);

        // Function @ avio.h:664:5
        //	x86_64-pc-windows-msvc (libavformat\avio.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 avio_get_str16le(AVIOContext* pb, int32 maxlen, CString buf, int32 buflen);

        // Function @ cpu.h:80:5
        //	x86_64-pc-windows-msvc (libavutil\cpu.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_get_cpu_flags();

        // Function @ avformat.h:1989:27
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern av_format_control_message av_format_get_control_message_cb(AVFormatContext* s);

        // Function @ hwcontext.h:579:5
        //	x86_64-pc-windows-msvc (libavutil\hwcontext.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_hwframe_map(AVFrame* dst, AVFrame* src, int32 flags);

        // Function @ log.h:318:6
        //	x86_64-pc-windows-msvc (libavutil\log.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void av_log_default_callback(void* avcl, int32 level, CString fmt, void* vl);

        // Function @ frame.h:722:9
        //	x86_64-pc-windows-msvc (libavutil\frame.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void av_frame_set_pkt_size(AVFrame* frame, int32 val);

        // Function @ swscale.h:261:6
        //	x86_64-pc-windows-msvc (libswscale\swscale.h)
        [Import(swscale_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void sws_normalizeVec(SwsVector* a, double height);

        // Function @ avformat.h:1977:11
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVCodec* av_format_get_data_codec(AVFormatContext* s);

        // Function @ avcodec.h:4064:6
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void av_register_hwaccel(AVHWAccel* hwaccel);

        // Function @ avio.h:887:5
        //	x86_64-pc-windows-msvc (libavformat\avio.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 avio_handshake(AVIOContext* c);

        // Function @ avformat.h:2674:5
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_write_uncoded_frame_query(AVFormatContext* s, int32 stream_index);

        // Function @ swscale.h:45:10
        //	x86_64-pc-windows-msvc (libswscale\swscale.h)
        [Import(swscale_lib), CLink, CallingConvention(.Cdecl)]
        public static extern uint32 swscale_version();

        // Function @ frame.h:706:9
        //	x86_64-pc-windows-msvc (libavutil\frame.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void av_frame_set_channels(AVFrame* frame, int32 val);

        // Function @ samplefmt.h:148:5
        //	x86_64-pc-windows-msvc (libavutil\samplefmt.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_sample_fmt_is_planar(AVSampleFormat sample_fmt);

        // Function @ mem.h:647:7
        //	x86_64-pc-windows-msvc (libavutil\mem.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void* av_dynarray2_add(void** tab_ptr, int* nb_ptr, ulong elem_size, byte* elem_data);

        // Function @ codec_id.h:565:18
        //	x86_64-pc-windows-msvc (libavcodec\codec_id.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVMediaType avcodec_get_type(AVCodecID codec_id);

        // Function @ avcodec.h:2799:16
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVClass* avcodec_get_frame_class();

        // Function @ avformat.h:2175:5
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_stream_add_side_data(AVStream* st, AVPacketSideDataType type, byte* data, ulong size);

        // Function @ swscale.h:294:20
        //	x86_64-pc-windows-msvc (libswscale\swscale.h)
        [Import(swscale_lib), CLink, CallingConvention(.Cdecl)]
        public static extern SwsContext* sws_getCachedContext(SwsContext* context, int32 srcW, int32 srcH, AVPixelFormat srcFormat, int32 dstW, int32 dstH, AVPixelFormat dstFormat, int32 flags, SwsFilter* srcFilter, SwsFilter* dstFilter, double* param);

        // Function @ avformat.h:1979:11
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void av_format_set_data_codec(AVFormatContext* s, AVCodec* c);

        // Function @ buffer.h:139:6
        //	x86_64-pc-windows-msvc (libavutil\buffer.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void av_buffer_default_free(void* opaque, byte* data);

        // Function @ avcodec.h:3858:6
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void avcodec_string(CString buf, int32 buf_size, AVCodecContext* enc, int32 encode);

        // Function @ samplefmt.h:265:5
        //	x86_64-pc-windows-msvc (libavutil\samplefmt.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_samples_set_silence(byte** audio_data, int32 offset, int32 nb_samples, int32 nb_channels, AVSampleFormat sample_fmt);

        // Function @ avcodec.h:2710:10
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVCodec* av_codec_next(AVCodec* c);

        // Function @ avformat.h:1232:12
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVRational av_stream_get_r_frame_rate(AVStream* s);

        // Function @ mathematics.h:222:9
        //	x86_64-pc-windows-msvc (libavutil\mathematics.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern long av_rescale_delta(AVRational in_tb, long in_ts, AVRational fs_tb, int32 duration, long* last, AVRational out_tb);

        // Function @ packet.h:538:6
        //	x86_64-pc-windows-msvc (libavcodec\packet.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void av_free_packet(AVPacket* pkt);

        // Function @ frame.h:710:9
        //	x86_64-pc-windows-msvc (libavutil\frame.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void av_frame_set_sample_rate(AVFrame* frame, int32 val);

        // Function @ frame.h:702:9
        //	x86_64-pc-windows-msvc (libavutil\frame.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void av_frame_set_channel_layout(AVFrame* frame, long val);

        // Function @ swscale.h:148:20
        //	x86_64-pc-windows-msvc (libswscale\swscale.h)
        [Import(swscale_lib), CLink, CallingConvention(.Cdecl)]
        public static extern SwsContext* sws_alloc_context();

        // Function @ avdevice.h:98:17
        //	x86_64-pc-windows-msvc (libavdevice\avdevice.h)
        [Import(avdevice_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVOutputFormat* av_output_audio_device_next(AVOutputFormat* d);

        // Function @ avcodec.h:2945:6
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void avcodec_align_dimensions2(AVCodecContext* s, int* width, int* height, int* linesize_align);

        // Function @ samplefmt.h:87:21
        //	x86_64-pc-windows-msvc (libavutil\samplefmt.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVSampleFormat av_get_sample_fmt(CString name);

        // Function @ swscale.h:186:20
        //	x86_64-pc-windows-msvc (libswscale\swscale.h)
        [Import(swscale_lib), CLink, CallingConvention(.Cdecl)]
        public static extern SwsContext* sws_getContext(int32 srcW, int32 srcH, AVPixelFormat srcFormat, int32 dstW, int32 dstH, AVPixelFormat dstFormat, int32 flags, SwsFilter* srcFilter, SwsFilter* dstFilter, double* param);

        // Function @ avio.h:737:5
        //	x86_64-pc-windows-msvc (libavformat\avio.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 avio_open2(AVIOContext** s, CString url, int32 flags, AVIOInterruptCB* int_cb, AVDictionary** options);

        // Function @ log.h:376:6
        //	x86_64-pc-windows-msvc (libavutil\log.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void av_log_set_flags(int32 arg);

        // Function @ buffer.h:278:6
        //	x86_64-pc-windows-msvc (libavutil\buffer.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void av_buffer_pool_uninit(AVBufferPool** pool);

        // Function @ mathematics.h:118:18
        //	x86_64-pc-windows-msvc (libavutil\mathematics.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern long av_gcd(long a, long b);

        // Function @ avdevice.h:89:16
        //	x86_64-pc-windows-msvc (libavdevice\avdevice.h)
        [Import(avdevice_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVInputFormat* av_input_video_device_next(AVInputFormat* d);

        // Function @ avformat.h:3088:12
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVRational av_stream_get_codec_timebase(AVStream* st);

        // Function @ avformat.h:2196:10
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern byte* av_stream_get_side_data(AVStream* stream, AVPacketSideDataType type, int* size);

        // Function @ avcodec.h:3956:5
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_get_exact_bits_per_sample(AVCodecID codec_id);

        // Function @ avcodec.h:4016:6
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void av_bitstream_filter_close(AVBitStreamFilterContext* bsf);

        // Function @ cpu.h:117:5
        //	x86_64-pc-windows-msvc (libavutil\cpu.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_cpu_count();

        // Function @ dict.h:176:6
        //	x86_64-pc-windows-msvc (libavutil\dict.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void av_dict_free(AVDictionary** m);

        // Function @ frame.h:727:5
        //	x86_64-pc-windows-msvc (libavutil\frame.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_frame_set_qp_table(AVFrame* f, AVBufferRef* buf, int32 stride, int32 type);

        // Function @ avcodec.h:3073:5
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 avcodec_decode_video2(AVCodecContext* avctx, AVFrame* picture, int* got_picture_ptr, AVPacket* avpkt);

        // Function @ hwcontext.h:413:5
        //	x86_64-pc-windows-msvc (libavutil\hwcontext.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_hwframe_transfer_data(AVFrame* dst, AVFrame* src, int32 flags);

        // Function @ avcodec.h:2738:6
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void avcodec_register(AVCodec* codec);

        // Function @ avcodec.h:3855:8
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern ulong av_get_codec_tag_string(CString buf, ulong buf_size, uint32 codec_tag);

        // Function @ hwcontext.h:347:5
        //	x86_64-pc-windows-msvc (libavutil\hwcontext.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_hwdevice_ctx_create_derived_opts(AVBufferRef** dst_ctx, AVHWDeviceType type, AVBufferRef* src_ctx, AVDictionary* options, int32 flags);

        // Function @ avformat.h:2413:5
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_read_frame(AVFormatContext* s, AVPacket* pkt);

        // Function @ avcodec.h:3691:5
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 avcodec_encode_video2(AVCodecContext* avctx, AVPacket* avpkt, AVFrame* frame, int* got_packet_ptr);

        // Function @ avformat.h:2939:5
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_sdp_create(AVFormatContext** ac, int32 n_files, CString buf, int32 size);

        // Function @ mem.h:473:7
        //	x86_64-pc-windows-msvc (libavutil\mem.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern CString av_strdup(CString s);

        // Function @ opt.h:744:5
        //	x86_64-pc-windows-msvc (libavutil\opt.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_opt_get_double(void* obj, CString name, int32 search_flags, double* out_val);

        // Function @ opt.h:742:5
        //	x86_64-pc-windows-msvc (libavutil\opt.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_opt_get(void* obj, CString name, int32 search_flags, byte** out_val);

        // Function @ cpu.h:86:6
        //	x86_64-pc-windows-msvc (libavutil\cpu.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void av_force_cpu_flags(int32 flags);

        // Function @ dict.h:193:5
        //	x86_64-pc-windows-msvc (libavutil\dict.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_dict_get_string(AVDictionary* m, CString* buffer, CChar key_val_sep, CChar pairs_sep);

        // Function @ avio.h:639:14
        //	x86_64-pc-windows-msvc (libavformat\avio.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern ulong avio_rb64(AVIOContext* s);

        // Function @ bsf.h:266:5
        //	x86_64-pc-windows-msvc (libavcodec\bsf.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_bsf_list_append(AVBSFList* lst, AVBSFContext* bsf);

        // Function @ avcodec.h:2379:6
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void av_codec_set_lowres(AVCodecContext* avctx, int32 val);

        // Function @ channel_layout.h:156:5
        //	x86_64-pc-windows-msvc (libavutil\channel_layout.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_get_extended_channel_layout(CString name, ulong* channel_layout, int* nb_channels);

        // Function @ avformat.h:2186:10
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern byte* av_stream_new_side_data(AVStream* stream, AVPacketSideDataType type, int32 size);

        // Function @ avcodec.h:3802:5
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 avcodec_get_pix_fmt_loss(AVPixelFormat dst_pix_fmt, AVPixelFormat src_pix_fmt, int32 has_alpha);

        // Function @ packet.h:624:6
        //	x86_64-pc-windows-msvc (libavcodec\packet.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void av_packet_free_side_data(AVPacket* pkt);

        // Function @ dict.h:138:5
        //	x86_64-pc-windows-msvc (libavutil\dict.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_dict_set_int(AVDictionary** pm, CString key, long value, int32 flags);

        // Function @ frame.h:804:6
        //	x86_64-pc-windows-msvc (libavutil\frame.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void av_frame_move_ref(AVFrame* dst, AVFrame* src);

        // Function @ frame.h:730:19
        //	x86_64-pc-windows-msvc (libavutil\frame.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVColorSpace av_frame_get_colorspace(AVFrame* frame);

        // Function @ swscale.h:128:5
        //	x86_64-pc-windows-msvc (libswscale\swscale.h)
        [Import(swscale_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 sws_isSupportedInput(AVPixelFormat pix_fmt);

        // Function @ avformat.h:1237:7
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern CString av_stream_get_recommended_encoder_configuration(AVStream* s);

        // Function @ avformat.h:2353:6
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void av_program_add_stream_index(AVFormatContext* ac, int32 progid, uint32 idx);

        // Function @ frame.h:829:5
        //	x86_64-pc-windows-msvc (libavutil\frame.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_frame_get_buffer(AVFrame* frame, int32 align);

        // Function @ avio.h:635:14
        //	x86_64-pc-windows-msvc (libavformat\avio.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern ulong avio_rl64(AVIOContext* s);

        // Function @ frame.h:704:9
        //	x86_64-pc-windows-msvc (libavutil\frame.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_frame_get_channels(AVFrame* frame);

        // Function @ avio.h:845:9
        //	x86_64-pc-windows-msvc (libavformat\avio.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern long avio_seek_time(AVIOContext* h, int32 stream_index, long timestamp, int32 flags);

        // Function @ swscale.h:280:6
        //	x86_64-pc-windows-msvc (libswscale\swscale.h)
        [Import(swscale_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void sws_freeFilter(SwsFilter* filter);

        // Function @ avdevice.h:507:5
        //	x86_64-pc-windows-msvc (libavdevice\avdevice.h)
        [Import(avdevice_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 avdevice_list_output_sinks(AVOutputFormat* device, CString device_name, AVDictionary* device_options, AVDeviceInfoList** device_list);

        // Function @ opt.h:520:5
        //	x86_64-pc-windows-msvc (libavutil\opt.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_opt_get_key_value(CString* ropts, CString key_val_sep, CString pairs_sep, uint32 flags, CString* rkey, CString* rval);

        // Function @ avformat.h:1983:11
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void av_format_set_metadata_header_padding(AVFormatContext* s, int32 c);

        // Function @ avutil.h:213:13
        //	x86_64-pc-windows-msvc (libavutil\avutil.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern CString av_get_media_type_string(AVMediaType media_type);

        // Function @ error.h:97:5
        //	x86_64-pc-windows-msvc (libavutil\error.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_strerror(int32 errnum, CString errbuf, ulong errbuf_size);

        // Function @ avformat.h:2140:16
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVClass* avformat_get_class();

        // Function @ bsf.h:189:5
        //	x86_64-pc-windows-msvc (libavcodec\bsf.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_bsf_send_packet(AVBSFContext* ctx, AVPacket* pkt);

        // Function @ avio.h:633:14
        //	x86_64-pc-windows-msvc (libavformat\avio.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern uint32 avio_rl24(AVIOContext* s);

        // Function @ log.h:338:6
        //	x86_64-pc-windows-msvc (libavutil\log.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void av_log_format_line(void* ptr, int32 level, CString fmt, void* vl, CString line, int32 line_size, int* print_prefix);

        // Function @ avformat.h:2825:5
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_find_default_stream_index(AVFormatContext* s);

        // Function @ avformat.h:1985:11
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void* av_format_get_opaque(AVFormatContext* s);

        // Function @ bsf.h:295:5
        //	x86_64-pc-windows-msvc (libavcodec\bsf.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_bsf_list_finalize(AVBSFList** lst, AVBSFContext** bsf);

        // Function @ mem.h:494:7
        //	x86_64-pc-windows-msvc (libavutil\mem.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void* av_memdup(void* p, ulong size);

        // Function @ avcodec.h:3882:5
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 avcodec_default_execute(AVCodecContext* c, FnPtr_AVCodecContextPtr_VoidPtr_Int func, void* arg, int* ret, int32 count, int32 size);

        // Function @ opt.h:748:5
        //	x86_64-pc-windows-msvc (libavutil\opt.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_opt_get_sample_fmt(void* obj, CString name, int32 search_flags, AVSampleFormat* out_fmt);

        // Function @ avformat.h:2199:12
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVProgram* av_new_program(AVFormatContext* s, int32 id);

        // Function @ opt.h:749:5
        //	x86_64-pc-windows-msvc (libavutil\opt.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_opt_get_video_rate(void* obj, CString name, int32 search_flags, AVRational* out_val);

        // Function @ rational.h:188:5
        //	x86_64-pc-windows-msvc (libavutil\rational.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_nearer_q(AVRational q, AVRational q1, AVRational q2);

        // Function @ codec.h:383:5
        //	x86_64-pc-windows-msvc (libavcodec\codec.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_codec_is_decoder(AVCodec* codec);

        // Function @ packet.h:591:5
        //	x86_64-pc-windows-msvc (libavcodec\packet.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_packet_merge_side_data(AVPacket* pkt);

        // Function @ avio.h:479:6
        //	x86_64-pc-windows-msvc (libavformat\avio.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void avio_w8(AVIOContext* s, int32 b);

        // Function @ mathematics.h:235:9
        //	x86_64-pc-windows-msvc (libavutil\mathematics.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern long av_add_stable(AVRational ts_tb, long ts, AVRational inc_tb, long inc);

        // Function @ avcodec.h:2889:5
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 avcodec_open2(AVCodecContext* avctx, AVCodec* codec, AVDictionary** options);

        // Function @ bsf.h:149:26
        //	x86_64-pc-windows-msvc (libavcodec\bsf.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVBitStreamFilter* av_bsf_iterate(void** opaque);

        // Function @ frame.h:781:5
        //	x86_64-pc-windows-msvc (libavutil\frame.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_frame_ref(AVFrame* dst, AVFrame* src);

        // Function @ avcodec.h:2781:5
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 avcodec_get_context_defaults3(AVCodecContext* s, AVCodec* codec);

        // Function @ opt.h:755:5
        //	x86_64-pc-windows-msvc (libavutil\opt.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_opt_get_dict_val(void* obj, CString name, int32 search_flags, AVDictionary** out_val);

        // Function @ log.h:291:6
        //	x86_64-pc-windows-msvc (libavutil\log.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void av_log_set_level(int32 level);

        // Function @ avdevice.h:438:5
        //	x86_64-pc-windows-msvc (libavdevice\avdevice.h)
        [Import(avdevice_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 avdevice_capabilities_create(AVDeviceCapabilitiesQuery** caps, AVFormatContext* s, AVDictionary** device_options);

        // Function @ frame.h:916:18
        //	x86_64-pc-windows-msvc (libavutil\frame.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVFrameSideData* av_frame_new_side_data_from_buf(AVFrame* frame, AVFrameSideDataType type, AVBufferRef* buf);

        // Function @ avcodec.h:2790:16
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVClass* avcodec_get_class();

        // Function @ avio.h:607:6
        //	x86_64-pc-windows-msvc (libavformat\avio.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void avio_flush(AVIOContext* s);

        // Function @ avcodec.h:3218:5
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 avcodec_send_frame(AVCodecContext* avctx, AVFrame* frame);

        // Function @ avformat.h:2265:27
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVInputFormat* av_probe_input_format3(AVProbeData* pd, int32 is_opened, int* score_ret);

        // Function @ frame.h:900:18
        //	x86_64-pc-windows-msvc (libavutil\frame.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVFrameSideData* av_frame_new_side_data(AVFrame* frame, AVFrameSideDataType type, int32 size);

        // Function @ avformat.h:2811:14
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern uint32 av_codec_get_tag(AVCodecTag** tags, AVCodecID id);

        // Function @ opt.h:743:5
        //	x86_64-pc-windows-msvc (libavutil\opt.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_opt_get_int(void* obj, CString name, int32 search_flags, long* out_val);

        // Function @ swscale.h:157:5
        //	x86_64-pc-windows-msvc (libswscale\swscale.h)
        [Import(swscale_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 sws_init_context(SwsContext* sws_context, SwsFilter* srcFilter, SwsFilter* dstFilter);

        // Function @ avio.h:622:5
        //	x86_64-pc-windows-msvc (libavformat\avio.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 avio_read_partial(AVIOContext* s, byte* buf, int32 size);

        // Function @ avcodec.h:2363:12
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVRational av_codec_get_pkt_timebase(AVCodecContext* avctx);

        // Function @ opt.h:552:5
        //	x86_64-pc-windows-msvc (libavutil\opt.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_opt_eval_double(void* obj, AVOption* o, CString val, double* double_out);

        // Function @ frame.h:694:9
        //	x86_64-pc-windows-msvc (libavutil\frame.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void av_frame_set_pkt_duration(AVFrame* frame, long val);

        // Function @ avcodec.h:4125:5
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 avcodec_is_open(AVCodecContext* s);

        // Function @ avcodec.h:2726:13
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern CString avcodec_license();

        // Function @ avio.h:488:6
        //	x86_64-pc-windows-msvc (libavformat\avio.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void avio_wb16(AVIOContext* s, uint32 val);

        // Function @ channel_layout.h:171:6
        //	x86_64-pc-windows-msvc (libavutil\channel_layout.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void av_bprint_channel_layout(AVBPrint* bp, int32 nb_channels, ulong channel_layout);

        // Function @ opt.h:841:5
        //	x86_64-pc-windows-msvc (libavutil\opt.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_opt_is_set_to_default_by_name(void* obj, CString name, int32 search_flags);

        // Function @ samplefmt.h:95:21
        //	x86_64-pc-windows-msvc (libavutil\samplefmt.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVSampleFormat av_get_alt_sample_fmt(AVSampleFormat sample_fmt, int32 planar);

        // Function @ avcodec.h:3745:6
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void av_picture_copy(AVPicture* dst, AVPicture* src, AVPixelFormat pix_fmt, int32 width, int32 height);

        // Function @ avformat.h:2685:5
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_write_trailer(AVFormatContext* s);

        // Function @ avformat.h:2009:33
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVDurationEstimationMethod av_fmt_ctx_get_duration_estimation_method(AVFormatContext* ctx);

        // Function @ avformat.h:2776:6
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void av_pkt_dump2(nint f, AVPacket* pkt, int32 dump_payload, AVStream* st);

        // Function @ avcodec.h:2904:5
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 avcodec_close(AVCodecContext* avctx);

        // Function @ avutil.h:188:13
        //	x86_64-pc-windows-msvc (libavutil\avutil.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern CString avutil_license();

        // Function @ avio.h:636:14
        //	x86_64-pc-windows-msvc (libavformat\avio.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern uint32 avio_rb16(AVIOContext* s);

        // Function @ opt.h:655:16
        //	x86_64-pc-windows-msvc (libavutil\opt.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVClass* av_opt_child_class_next(AVClass* parent, AVClass* prev);

        // Function @ avformat.h:2222:5
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 avformat_alloc_output_context2(AVFormatContext** ctx, AVOutputFormat* oformat, CString format_name, CString filename);

        // Function @ avformat.h:2960:5
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 avformat_query_codec(AVOutputFormat* ofmt, AVCodecID codec_id, int32 std_compliance);

        // Function @ opt.h:686:5
        //	x86_64-pc-windows-msvc (libavutil\opt.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_opt_set(void* obj, CString name, CString val, int32 search_flags);

        // Function @ avio.h:487:6
        //	x86_64-pc-windows-msvc (libavformat\avio.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void avio_wl16(AVIOContext* s, uint32 val);

        // Function @ avformat.h:1234:12
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void av_stream_set_r_frame_rate(AVStream* s, AVRational r);

        // Function @ avio.h:503:5
        //	x86_64-pc-windows-msvc (libavformat\avio.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 avio_put_str16le(AVIOContext* s, CString str);

        // Function @ avformat.h:2054:6
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void av_register_input_format(AVInputFormat* format);

        // Function @ avformat.h:2986:26
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVCodecTag* avformat_get_mov_video_tags();

        // Function @ avio.h:494:5
        //	x86_64-pc-windows-msvc (libavformat\avio.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 avio_put_str(AVIOContext* s, CString str);

        // Function @ avformat.h:414:5
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_get_packet(AVIOContext* s, AVPacket* pkt, int32 size);

        // Function @ avio.h:482:6
        //	x86_64-pc-windows-msvc (libavformat\avio.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void avio_wb64(AVIOContext* s, ulong val);

        // Function @ avdevice.h:56:10
        //	x86_64-pc-windows-msvc (libavdevice\avdevice.h)
        [Import(avdevice_lib), CLink, CallingConvention(.Cdecl)]
        public static extern uint32 avdevice_version();

        // Function @ log.h:377:5
        //	x86_64-pc-windows-msvc (libavutil\log.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_log_get_flags();

        // Function @ mem.h:264:7
        //	x86_64-pc-windows-msvc (libavutil\mem.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void* av_realloc(void* ptr, ulong size);

        // Function @ frame.h:736:9
        //	x86_64-pc-windows-msvc (libavutil\frame.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void av_frame_set_color_range(AVFrame* frame, AVColorRange val);

        // Function @ avcodec.h:2968:23
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVChromaLocation avcodec_chroma_pos_to_enum(int32 xpos, int32 ypos);

        // Function @ opt.h:419:5
        //	x86_64-pc-windows-msvc (libavutil\opt.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_set_options_string(void* ctx, CString opts, CString key_val_sep, CString pairs_sep);

        // Function @ avformat.h:2978:26
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVCodecTag* avformat_get_riff_video_tags();

        // Function @ avcodec.h:3235:5
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 avcodec_receive_packet(AVCodecContext* avctx, AVPacket* avpkt);

        // Function @ dict.h:130:5
        //	x86_64-pc-windows-msvc (libavutil\dict.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_dict_set(AVDictionary** pm, CString key, CString value, int32 flags);

        // Function @ hwcontext.h:276:5
        //	x86_64-pc-windows-msvc (libavutil\hwcontext.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_hwdevice_ctx_init(AVBufferRef* @ref);

        // Function @ avcodec.h:3718:6
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void avpicture_free(AVPicture* picture);

        // Function @ opt.h:694:5
        //	x86_64-pc-windows-msvc (libavutil\opt.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_opt_set_video_rate(void* obj, CString name, AVRational val, int32 search_flags);

        // Function @ avcodec.h:3966:5
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_get_audio_frame_duration(AVCodecContext* avctx, int32 frame_bytes);

        // Function @ swscale.h:269:27
        //	x86_64-pc-windows-msvc (libswscale\swscale.h)
        [Import(swscale_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void sws_shiftVec(SwsVector* a, int32 shift);

        // Function @ avformat.h:2475:5
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 avformat_flush(AVFormatContext* s);

        // Function @ opt.h:815:5
        //	x86_64-pc-windows-msvc (libavutil\opt.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_opt_query_ranges_default(AVOptionRanges** param, void* obj, CString key, int32 flags);

        // Function @ mem.h:427:6
        //	x86_64-pc-windows-msvc (libavutil\mem.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void av_fast_mallocz(void* ptr, uint* size, ulong min_size);

        // Function @ avdevice.h:66:13
        //	x86_64-pc-windows-msvc (libavdevice\avdevice.h)
        [Import(avdevice_lib), CLink, CallingConvention(.Cdecl)]
        public static extern CString avdevice_license();

        // Function @ avcodec.h:2365:12
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void av_codec_set_pkt_timebase(AVCodecContext* avctx, AVRational val);

        // Function @ dict.h:112:5
        //	x86_64-pc-windows-msvc (libavutil\dict.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_dict_count(AVDictionary* m);

        // Function @ swscale.h:141:5
        //	x86_64-pc-windows-msvc (libswscale\swscale.h)
        [Import(swscale_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 sws_isSupportedEndiannessConversion(AVPixelFormat pix_fmt);

        // Function @ opt.h:829:5
        //	x86_64-pc-windows-msvc (libavutil\opt.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_opt_is_set_to_default(void* obj, AVOption* o);

        // Function @ avcodec.h:4075:12
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVHWAccel* av_hwaccel_next(AVHWAccel* hwaccel);

        // Function @ log.h:329:17
        //	x86_64-pc-windows-msvc (libavutil\log.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVClassCategory av_default_get_category(void* ptr);

        // Function @ avdevice.h:486:6
        //	x86_64-pc-windows-msvc (libavdevice\avdevice.h)
        [Import(avdevice_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void avdevice_free_list_devices(AVDeviceInfoList** device_list);

        // Function @ packet.h:518:5
        //	x86_64-pc-windows-msvc (libavcodec\packet.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_copy_packet(AVPacket* dst, AVPacket* src);

        // Function @ frame.h:720:9
        //	x86_64-pc-windows-msvc (libavutil\frame.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_frame_get_pkt_size(AVFrame* frame);

        // Function @ opt.h:553:5
        //	x86_64-pc-windows-msvc (libavutil\opt.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_opt_eval_q(void* obj, AVOption* o, CString val, AVRational* q_out);

        // Function @ samplefmt.h:202:5
        //	x86_64-pc-windows-msvc (libavutil\samplefmt.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_samples_fill_arrays(byte** audio_data, int* linesize, byte* buf, int32 nb_channels, int32 nb_samples, AVSampleFormat sample_fmt, int32 align);

        // Function @ hwcontext.h:361:14
        //	x86_64-pc-windows-msvc (libavutil\hwcontext.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVBufferRef* av_hwframe_ctx_alloc(AVBufferRef* device_ctx);

        // Function @ avcodec.h:4023:26
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVBitStreamFilter* av_bitstream_filter_next(AVBitStreamFilter* f);

        // Function @ avformat.h:1981:11
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_format_get_metadata_header_padding(AVFormatContext* s);

        // Function @ common.h:113:14
        //	x86_64-pc-windows-msvc (libavutil\common.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_log2(uint32 v);

        // Function @ avio.h:815:16
        //	x86_64-pc-windows-msvc (libavformat\avio.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVClass* avio_protocol_get_class(CString name);

        // Function @ samplefmt.h:238:5
        //	x86_64-pc-windows-msvc (libavutil\samplefmt.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_samples_alloc_array_and_samples(byte*** audio_data, int* linesize, int32 nb_channels, int32 nb_samples, AVSampleFormat sample_fmt, int32 align);

        // Function @ hwcontext.h:327:5
        //	x86_64-pc-windows-msvc (libavutil\hwcontext.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_hwdevice_ctx_create_derived(AVBufferRef** dst_ctx, AVHWDeviceType type, AVBufferRef* src_ctx, int32 flags);

        // Function @ buffer.h:155:6
        //	x86_64-pc-windows-msvc (libavutil\buffer.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void av_buffer_unref(AVBufferRef** buf);

        // Function @ buffer.h:107:14
        //	x86_64-pc-windows-msvc (libavutil\buffer.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVBufferRef* av_buffer_allocz(int32 size);

        // Function @ avformat.h:2838:5
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_index_search_timestamp(AVStream* st, long timestamp, int32 flags);

        // Function @ bsf.h:220:6
        //	x86_64-pc-windows-msvc (libavcodec\bsf.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void av_bsf_flush(AVBSFContext* ctx);

        // Function @ opt.h:389:6
        //	x86_64-pc-windows-msvc (libavutil\opt.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void av_opt_set_defaults(void* s);

        // Function @ opt.h:499:5
        //	x86_64-pc-windows-msvc (libavutil\opt.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_opt_set_dict2(void* obj, AVDictionary** options, int32 search_flags);

        // Function @ rational.h:197:5
        //	x86_64-pc-windows-msvc (libavutil\rational.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_find_nearest_q_idx(AVRational q, AVRational* q_list);

        // Function @ rational.h:176:12
        //	x86_64-pc-windows-msvc (libavutil\rational.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVRational av_d2q(double d, int32 max);

        // Function @ avio.h:524:6
        //	x86_64-pc-windows-msvc (libavformat\avio.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void avio_write_marker(AVIOContext* s, long time, AVIODataMarkerType type);

        // Function @ avutil.h:339:7
        //	x86_64-pc-windows-msvc (libavutil\avutil.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern nint av_fopen_utf8(CString path, CString mode);

        // Function @ buffer.h:181:5
        //	x86_64-pc-windows-msvc (libavutil\buffer.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_buffer_make_writable(AVBufferRef** buf);

        // Function @ avformat.h:3079:5
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 avformat_transfer_internal_stream_timing_info(AVOutputFormat* ofmt, AVStream* ost, AVStream* ist, AVTimebaseSource copy_tb);

        // Function @ avutil.h:178:13
        //	x86_64-pc-windows-msvc (libavutil\avutil.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern CString av_version_info();

        // Function @ avcodec.h:3972:5
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_get_audio_frame_duration2(AVCodecParameters* par, int32 frame_bytes);

        // Function @ packet.h:594:5
        //	x86_64-pc-windows-msvc (libavcodec\packet.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_packet_split_side_data(AVPacket* pkt);

        // Function @ codec.h:358:10
        //	x86_64-pc-windows-msvc (libavcodec\codec.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVCodec* avcodec_find_decoder_by_name(CString name);

        // Function @ avformat.h:2822:5
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_codec_get_tag2(AVCodecTag** tags, AVCodecID id, uint* tag);

        // Function @ codec.h:456:24
        //	x86_64-pc-windows-msvc (libavcodec\codec.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVCodecHWConfig* avcodec_get_hw_config(AVCodec* codec, int32 index);

        // Function @ opt.h:639:17
        //	x86_64-pc-windows-msvc (libavutil\opt.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVOption* av_opt_next(void* obj, AVOption* prev);

        // Function @ avformat.h:2119:22
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVInputFormat* av_demuxer_iterate(void** opaque);

        // Function @ avformat.h:2316:5
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_demuxer_open(AVFormatContext* ic);

        // Function @ bsf.h:215:5
        //	x86_64-pc-windows-msvc (libavcodec\bsf.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_bsf_receive_packet(AVBSFContext* ctx, AVPacket* pkt);

        // Function @ avio.h:824:9
        //	x86_64-pc-windows-msvc (libavformat\avio.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 avio_pause(AVIOContext* h, int32 pause);

        // Function @ avcodec.h:3334:5
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 avcodec_get_hw_frames_parameters(AVCodecContext* avctx, AVBufferRef* device_ref, AVPixelFormat hw_pix_fmt, AVBufferRef** out_frames_ref);

        // Function @ codec_par.h:214:6
        //	x86_64-pc-windows-msvc (libavcodec\codec_par.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void avcodec_parameters_free(AVCodecParameters** par);

        // Function @ avformat.h:2088:17
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVInputFormat* av_iformat_next(AVInputFormat* f);

        // Function @ bsf.h:310:5
        //	x86_64-pc-windows-msvc (libavcodec\bsf.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_bsf_list_parse_str(CString str, AVBSFContext** bsf);

        // Function @ mem.h:220:27
        //	x86_64-pc-windows-msvc (libavutil\mem.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void* av_malloc_array(ulong nmemb, ulong size);

        // Function @ codec_desc.h:107:26
        //	x86_64-pc-windows-msvc (libavcodec\codec_desc.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVCodecDescriptor* avcodec_descriptor_get(AVCodecID id);

        // Function @ buffer.h:168:7
        //	x86_64-pc-windows-msvc (libavutil\buffer.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void* av_buffer_get_opaque(AVBufferRef* buf);

        // Function @ avio.h:485:6
        //	x86_64-pc-windows-msvc (libavformat\avio.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void avio_wl24(AVIOContext* s, uint32 val);

        // Function @ avcodec.h:3158:5
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 avcodec_send_packet(AVCodecContext* avctx, AVPacket* avpkt);

        // Function @ avformat.h:2911:5
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_get_frame_filename(CString buf, int32 buf_size, CString path, int32 number);

        // Function @ swscale.h:322:6
        //	x86_64-pc-windows-msvc (libswscale\swscale.h)
        [Import(swscale_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void sws_convertPalette8ToPacked24(byte* src, byte* dst, int32 num_pixels, byte* palette);

        // Function @ samplefmt.h:252:5
        //	x86_64-pc-windows-msvc (libavutil\samplefmt.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_samples_copy(byte** dst, byte** src, int32 dst_offset, int32 src_offset, int32 nb_samples, int32 nb_channels, AVSampleFormat sample_fmt);

        // Function @ avformat.h:1969:11
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVCodec* av_format_get_audio_codec(AVFormatContext* s);

        // Function @ avutil.h:290:6
        //	x86_64-pc-windows-msvc (libavutil\avutil.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern CChar av_get_picture_type_char(AVPictureType pict_type);

        // Function @ avcodec.h:3181:5
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 avcodec_receive_frame(AVCodecContext* avctx, AVFrame* frame);

        // Function @ channel_layout.h:224:5
        //	x86_64-pc-windows-msvc (libavutil\channel_layout.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_get_standard_channel_layout(uint32 index, ulong* layout, CString* name);

        // Function @ packet.h:615:5
        //	x86_64-pc-windows-msvc (libavcodec\packet.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_packet_unpack_dictionary(byte* data, int32 size, AVDictionary** dict);

        // Function @ frame.h:716:9
        //	x86_64-pc-windows-msvc (libavutil\frame.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_frame_get_decode_error_flags(AVFrame* frame);

        // Function @ samplefmt.h:160:5
        //	x86_64-pc-windows-msvc (libavutil\samplefmt.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_samples_get_buffer_size(int32* linesize, int32 nb_channels, int32 nb_samples, AVSampleFormat sample_fmt, int32 align);

        // Function @ buffer.h:163:5
        //	x86_64-pc-windows-msvc (libavutil\buffer.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_buffer_is_writable(AVBufferRef* buf);

        // Function @ opt.h:449:5
        //	x86_64-pc-windows-msvc (libavutil\opt.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_opt_set_from_string(void* ctx, CString opts, CString* shorthand, CString key_val_sep, CString pairs_sep);

        // Function @ avcodec.h:3938:5
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_get_bits_per_sample(AVCodecID codec_id);

        // Function @ mem.h:242:7
        //	x86_64-pc-windows-msvc (libavutil\mem.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void* av_calloc(ulong nmemb, ulong size);

        // Function @ mathematics.h:195:9
        //	x86_64-pc-windows-msvc (libavutil\mathematics.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern long av_compare_mod(ulong a, ulong b, ulong mod);

        // Function @ codec_par.h:222:5
        //	x86_64-pc-windows-msvc (libavcodec\codec_par.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 avcodec_parameters_copy(AVCodecParameters* dst, AVCodecParameters* src);

        // Function @ avformat.h:2132:6
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void avformat_free_context(AVFormatContext* s);

        // Function @ frame.h:714:15
        //	x86_64-pc-windows-msvc (libavutil\frame.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void av_frame_set_metadata(AVFrame* frame, AVDictionary* val);

        // Function @ codec_par.h:208:20
        //	x86_64-pc-windows-msvc (libavcodec\codec_par.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVCodecParameters* avcodec_parameters_alloc();

        // Function @ avio.h:656:5
        //	x86_64-pc-windows-msvc (libavformat\avio.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 avio_get_str(AVIOContext* pb, int32 maxlen, CString buf, int32 buflen);

        // Function @ avformat.h:2073:5
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 avformat_network_init();

        // Function @ avcodec.h:3547:16
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVCodecParser* av_parser_next(AVCodecParser* c);

        // Function @ avio.h:375:5
        //	x86_64-pc-windows-msvc (libavformat\avio.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 avio_check(CString url, int32 flags);

        // Function @ log.h:282:5
        //	x86_64-pc-windows-msvc (libavutil\log.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_log_get_level();

        // Function @ opt.h:689:5
        //	x86_64-pc-windows-msvc (libavutil\opt.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_opt_set_q(void* obj, CString name, AVRational val, int32 search_flags);

        // Function @ avio.h:717:5
        //	x86_64-pc-windows-msvc (libavformat\avio.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 avio_open(AVIOContext** s, CString url, int32 flags);

        // Function @ frame.h:698:9
        //	x86_64-pc-windows-msvc (libavutil\frame.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void av_frame_set_pkt_pos(AVFrame* frame, long val);

        // Function @ frame.h:708:9
        //	x86_64-pc-windows-msvc (libavutil\frame.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_frame_get_sample_rate(AVFrame* frame);

        // Function @ mem.h:376:7
        //	x86_64-pc-windows-msvc (libavutil\mem.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void* av_fast_realloc(void* ptr, uint* size, ulong min_size);

        // Function @ frame.h:930:6
        //	x86_64-pc-windows-msvc (libavutil\frame.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void av_frame_remove_side_data(AVFrame* frame, AVFrameSideDataType type);

        // Function @ avcodec.h:2827:5
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 avcodec_copy_context(AVCodecContext* dest, AVCodecContext* src);

        // Function @ channel_layout.h:181:9
        //	x86_64-pc-windows-msvc (libavutil\channel_layout.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern long av_get_default_channel_layout(int32 nb_channels);

        // Function @ avcodec.h:3752:5
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_picture_crop(AVPicture* dst, AVPicture* src, AVPixelFormat pix_fmt, int32 top_band, int32 left_band);

        // Function @ packet.h:548:10
        //	x86_64-pc-windows-msvc (libavcodec\packet.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern byte* av_packet_new_side_data(AVPacket* pkt, AVPacketSideDataType type, int32 size);

        // Function @ mathematics.h:140:9
        //	x86_64-pc-windows-msvc (libavutil\mathematics.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern long av_rescale_rnd(long a, long b, long c, AVRounding rnd);

        // Function @ buffer.h:249:15
        //	x86_64-pc-windows-msvc (libavutil\buffer.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVBufferPool* av_buffer_pool_init(int32 size, FnPtr_Int_AVBufferRefPtr alloc);

        // Function @ avcodec.h:3599:6
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void av_parser_close(AVCodecParserContext* s);

        // Function @ frame.h:964:5
        //	x86_64-pc-windows-msvc (libavutil\frame.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_frame_apply_cropping(AVFrame* frame, int32 flags);

        // Function @ avformat.h:2002:6
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void av_format_inject_global_side_data(AVFormatContext* s);

        // Function @ avformat.h:2161:11
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVStream* avformat_new_stream(AVFormatContext* s, AVCodec* c);

        // Function @ avformat.h:1975:11
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void av_format_set_subtitle_codec(AVFormatContext* s, AVCodec* c);

        // Function @ avformat.h:2790:6
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void av_pkt_dump_log2(void* avcl, int32 level, AVPacket* pkt, int32 dump_payload, AVStream* st);

        // Function @ avformat.h:2051:6
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void av_register_all();

        // Function @ bsf.h:163:5
        //	x86_64-pc-windows-msvc (libavcodec\bsf.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_bsf_alloc(AVBitStreamFilter* filter, AVBSFContext** ctx);

        // Function @ avformat.h:2725:5
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_get_output_timestamp(AVFormatContext* s, int32 stream, long* dts, long* wall);

        // Function @ avformat.h:2126:18
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVFormatContext* avformat_alloc_context();

        // Function @ avio.h:808:13
        //	x86_64-pc-windows-msvc (libavformat\avio.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern CString avio_enum_protocols(void** opaque, int32 output);

        // Function @ log.h:303:6
        //	x86_64-pc-windows-msvc (libavutil\log.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void av_log_set_callback(FnPtr_VoidPtr_Int_CString_VoidPtr_Void callback);

        // Function @ avcodec.h:3797:14
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern uint32 avcodec_pix_fmt_to_codec_tag(AVPixelFormat pix_fmt);

        // Function @ opt.h:548:5
        //	x86_64-pc-windows-msvc (libavutil\opt.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_opt_eval_flags(void* obj, AVOption* o, CString val, int* flags_out);

        // Function @ avutil.h:344:12
        //	x86_64-pc-windows-msvc (libavutil\avutil.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVRational av_get_time_base_q();

        // Function @ avdevice.h:505:5
        //	x86_64-pc-windows-msvc (libavdevice\avdevice.h)
        [Import(avdevice_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 avdevice_list_input_sources(AVInputFormat* device, CString device_name, AVDictionary* device_options, AVDeviceInfoList** device_list);

        // Function @ dict.h:170:5
        //	x86_64-pc-windows-msvc (libavutil\dict.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_dict_copy(AVDictionary** dst, AVDictionary* src, int32 flags);

        // Function @ rational.h:214:12
        //	x86_64-pc-windows-msvc (libavutil\rational.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVRational av_gcd_q(AVRational a, AVRational b, int32 max_den, AVRational def);

        // Function @ avcodec.h:4046:6
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void av_fast_padded_mallocz(void* ptr, uint* size, ulong min_size);

        // Function @ channel_layout.h:198:10
        //	x86_64-pc-windows-msvc (libavutil\channel_layout.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern ulong av_channel_layout_extract_channel(ulong channel_layout, int32 index);

        // Function @ avformat.h:2056:6
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void av_register_output_format(AVOutputFormat* format);

        // Function @ avcodec.h:4006:5
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_bitstream_filter_filter(AVBitStreamFilterContext* bsfc, AVCodecContext* avctx, CString args, byte** poutbuf, int* poutbuf_size, byte* buf, int32 buf_size, int32 keyframe);

        // Function @ frame.h:688:9
        //	x86_64-pc-windows-msvc (libavutil\frame.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern long av_frame_get_best_effort_timestamp(AVFrame* frame);

        // Function @ hwcontext.h:303:5
        //	x86_64-pc-windows-msvc (libavutil\hwcontext.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_hwdevice_ctx_create(AVBufferRef** device_ctx, AVHWDeviceType type, CString device, AVDictionary* opts, int32 flags);

        // Function @ avformat.h:2665:5
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_interleaved_write_uncoded_frame(AVFormatContext* s, int32 stream_index, AVFrame* frame);

        // Function @ codec_desc.h:122:26
        //	x86_64-pc-windows-msvc (libavcodec\codec_desc.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVCodecDescriptor* avcodec_descriptor_get_by_name(CString name);

        // Function @ frame.h:843:5
        //	x86_64-pc-windows-msvc (libavutil\frame.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_frame_is_writable(AVFrame* frame);

        // Function @ frame.h:795:6
        //	x86_64-pc-windows-msvc (libavutil\frame.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void av_frame_unref(AVFrame* frame);

        // Function @ avcodec.h:3550:6
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void av_register_codec_parser(AVCodecParser* parser);

        // Function @ packet.h:448:6
        //	x86_64-pc-windows-msvc (libavcodec\packet.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void av_packet_free(AVPacket** pkt);

        // Function @ hwcontext.h:506:24
        //	x86_64-pc-windows-msvc (libavutil\hwcontext.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVHWFramesConstraints* av_hwdevice_get_hwframe_constraints(AVBufferRef* @ref, void* hwconfig);

        // Function @ avformat.h:1993:37
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVOpenCallback av_format_get_open_cb(AVFormatContext* s);

        // Function @ avformat.h:2029:10
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern uint32 avformat_version();

        // Function @ swscale.h:105:12
        //	x86_64-pc-windows-msvc (libswscale\swscale.h)
        [Import(swscale_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int* sws_getCoefficients(int32 colorspace);

        // Function @ swscale.h:245:12
        //	x86_64-pc-windows-msvc (libswscale\swscale.h)
        [Import(swscale_lib), CLink, CallingConvention(.Cdecl)]
        public static extern SwsVector* sws_allocVec(int32 length);

        // Function @ avio.h:484:6
        //	x86_64-pc-windows-msvc (libavformat\avio.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void avio_wb32(AVIOContext* s, uint32 val);

        // Function @ bsf.h:226:6
        //	x86_64-pc-windows-msvc (libavcodec\bsf.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void av_bsf_free(AVBSFContext** ctx);

        // Function @ frame.h:924:18
        //	x86_64-pc-windows-msvc (libavutil\frame.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVFrameSideData* av_frame_get_side_data(AVFrame* frame, AVFrameSideDataType type);

        // Function @ packet.h:663:6
        //	x86_64-pc-windows-msvc (libavcodec\packet.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void av_packet_move_ref(AVPacket* dst, AVPacket* src);

        // Function @ frame.h:790:10
        //	x86_64-pc-windows-msvc (libavutil\frame.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVFrame* av_frame_clone(AVFrame* src);

        // Function @ opt.h:745:5
        //	x86_64-pc-windows-msvc (libavutil\opt.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_opt_get_q(void* obj, CString name, int32 search_flags, AVRational* out_val);

        // Function @ packet.h:468:5
        //	x86_64-pc-windows-msvc (libavcodec\packet.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_new_packet(AVPacket* pkt, int32 size);

        // Function @ avformat.h:2801:16
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVCodecID av_codec_get_id(AVCodecTag** tags, uint32 tag);

        // Function @ frame.h:725:9
        //	x86_64-pc-windows-msvc (libavutil\frame.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern sbyte* av_frame_get_qp_table(AVFrame* f, int* stride, int* type);

        // Function @ avcodec.h:3829:20
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVPixelFormat avcodec_find_best_pix_fmt_of_2(AVPixelFormat dst_pix_fmt1, AVPixelFormat dst_pix_fmt2, AVPixelFormat src_pix_fmt, int32 has_alpha, int* loss_ptr);

        // Function @ samplefmt.h:81:13
        //	x86_64-pc-windows-msvc (libavutil\samplefmt.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern CString av_get_sample_fmt_name(AVSampleFormat sample_fmt);

        // Function @ avcodec.h:3551:23
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVCodecParserContext* av_parser_init(int32 codec_id);

        // Function @ avio.h:512:5
        //	x86_64-pc-windows-msvc (libavformat\avio.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 avio_put_str16be(AVIOContext* s, CString str);

        // Function @ avcodec.h:2773:6
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void avcodec_free_context(AVCodecContext** avctx);

        // Function @ avio.h:437:6
        //	x86_64-pc-windows-msvc (libavformat\avio.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void avio_free_directory_entry(AVIODirEntry** entry);

        // Function @ opt.h:695:5
        //	x86_64-pc-windows-msvc (libavutil\opt.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_opt_set_channel_layout(void* obj, CString name, long ch_layout, int32 search_flags);

        // Function @ swscale.h:276:12
        //	x86_64-pc-windows-msvc (libswscale\swscale.h)
        [Import(swscale_lib), CLink, CallingConvention(.Cdecl)]
        public static extern SwsFilter* sws_getDefaultFilter(float lumaGBlur, float chromaGBlur, float lumaSharpen, float chromaSharpen, float chromaHShift, float chromaVShift, int32 verbose);

        // Function @ avdevice.h:306:5
        //	x86_64-pc-windows-msvc (libavdevice\avdevice.h)
        [Import(avdevice_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 avdevice_app_to_dev_control_message(AVFormatContext* s, AVAppToDevMessageType type, void* data, ulong data_size);

        // Function @ swscale.h:310:6
        //	x86_64-pc-windows-msvc (libswscale\swscale.h)
        [Import(swscale_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void sws_convertPalette8ToPacked32(byte* src, byte* dst, int32 num_pixels, byte* palette);

        // Function @ opt.h:688:5
        //	x86_64-pc-windows-msvc (libavutil\opt.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_opt_set_double(void* obj, CString name, double val, int32 search_flags);

        // Function @ frame.h:969:13
        //	x86_64-pc-windows-msvc (libavutil\frame.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern CString av_frame_side_data_name(AVFrameSideDataType type);

        // Function @ avformat.h:2699:28
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVOutputFormat* av_guess_format(CString short_name, CString filename, CString mime_type);

        // Function @ opt.h:700:5
        //	x86_64-pc-windows-msvc (libavutil\opt.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_opt_set_dict_val(void* obj, CString name, AVDictionary* val, int32 search_flags);

        // Function @ frame.h:734:19
        //	x86_64-pc-windows-msvc (libavutil\frame.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVColorRange av_frame_get_color_range(AVFrame* frame);

        // Function @ buffer.h:299:7
        //	x86_64-pc-windows-msvc (libavutil\buffer.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void* av_buffer_pool_buffer_get_opaque(AVBufferRef* @ref);

        // Function @ packet.h:692:5
        //	x86_64-pc-windows-msvc (libavcodec\packet.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_packet_make_refcounted(AVPacket* pkt);

        // Function @ packet.h:716:6
        //	x86_64-pc-windows-msvc (libavcodec\packet.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void av_packet_rescale_ts(AVPacket* pkt, AVRational tb_src, AVRational tb_dst);

        // Function @ opt.h:787:5
        //	x86_64-pc-windows-msvc (libavutil\opt.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_opt_query_ranges(AVOptionRanges** param, void* obj, CString key, int32 flags);

        // Function @ avdevice.h:107:17
        //	x86_64-pc-windows-msvc (libavdevice\avdevice.h)
        [Import(avdevice_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVOutputFormat* av_output_video_device_next(AVOutputFormat* d);

        // Function @ opt.h:799:5
        //	x86_64-pc-windows-msvc (libavutil\opt.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_opt_copy(void* dest, void* src);

        // Function @ avformat.h:1994:27
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void av_format_set_open_cb(AVFormatContext* s, AVOpenCallback callback);

        // Function @ avformat.h:2636:5
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_interleaved_write_frame(AVFormatContext* s, AVPacket* pkt);

        // Function @ avformat.h:2846:5
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_add_index_entry(AVStream* st, long pos, long timestamp, int32 size, int32 distance, int32 flags);

        // Function @ rational.h:144:12
        //	x86_64-pc-windows-msvc (libavutil\rational.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVRational av_add_q(AVRational b, AVRational c);

        // Function @ mem.h:609:6
        //	x86_64-pc-windows-msvc (libavutil\mem.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void av_dynarray_add(void* tab_ptr, int* nb_ptr, void* elem);

        // Function @ avformat.h:1963:5
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_format_get_probe_score(AVFormatContext* s);

        // Function @ avformat.h:2766:6
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void av_hex_dump_log(void* avcl, int32 level, byte* buf, int32 size);

        // Function @ avio.h:631:14
        //	x86_64-pc-windows-msvc (libavformat\avio.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 avio_r8(AVIOContext* s);

        // Function @ avio.h:637:14
        //	x86_64-pc-windows-msvc (libavformat\avio.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern uint32 avio_rb24(AVIOContext* s);

        // Function @ opt.h:772:6
        //	x86_64-pc-windows-msvc (libavutil\opt.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void av_opt_freep_ranges(AVOptionRanges** ranges);

        // Function @ avcodec.h:2368:26
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVCodecDescriptor* av_codec_get_codec_descriptor(AVCodecContext* avctx);

        // Function @ opt.h:767:7
        //	x86_64-pc-windows-msvc (libavutil\opt.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void* av_opt_ptr(AVClass* avclass, void* obj, CString name);

        // Function @ avcodec.h:3999:27
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVBitStreamFilterContext* av_bitstream_filter_init(CString name);

        // Function @ swscale.h:270:33
        //	x86_64-pc-windows-msvc (libswscale\swscale.h)
        [Import(swscale_lib), CLink, CallingConvention(.Cdecl)]
        public static extern SwsVector* sws_cloneVec(SwsVector* a);

        // Function @ avformat.h:2494:6
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void avformat_close_input(AVFormatContext** s);

        // Function @ avcodec.h:3836:20
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVPixelFormat avcodec_default_get_format(AVCodecContext* s, AVPixelFormat* fmt);

        // Function @ swscale.h:134:5
        //	x86_64-pc-windows-msvc (libswscale\swscale.h)
        [Import(swscale_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 sws_isSupportedOutput(AVPixelFormat pix_fmt);

        // Function @ avio.h:795:5
        //	x86_64-pc-windows-msvc (libavformat\avio.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 avio_close_dyn_buf(AVIOContext* s, byte** pbuffer);

        // Function @ avcodec.h:2385:6
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void av_codec_set_seek_preroll(AVCodecContext* avctx, int32 val);

        // Function @ opt.h:551:5
        //	x86_64-pc-windows-msvc (libavutil\opt.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_opt_eval_float(void* obj, AVOption* o, CString val, float* float_out);

        // Function @ avcodec.h:2848:5
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 avcodec_parameters_to_context(AVCodecContext* codec, AVCodecParameters* par);

        // Function @ packet.h:676:5
        //	x86_64-pc-windows-msvc (libavcodec\packet.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_packet_copy_props(AVPacket* dst, AVPacket* src);

        // Function @ hwcontext.h:599:5
        //	x86_64-pc-windows-msvc (libavutil\hwcontext.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_hwframe_ctx_create_derived(AVBufferRef** derived_frame_ctx, AVPixelFormat format, AVBufferRef* derived_device_ctx, AVBufferRef* source_frame_ctx, int32 flags);

        // Function @ codec.h:378:5
        //	x86_64-pc-windows-msvc (libavcodec\codec.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_codec_is_encoder(AVCodec* codec);

        // Function @ frame.h:718:9
        //	x86_64-pc-windows-msvc (libavutil\frame.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void av_frame_set_decode_error_flags(AVFrame* frame, int32 val);

        // Function @ avformat.h:1991:11
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void av_format_set_control_message_cb(AVFormatContext* s, av_format_control_message callback);

        // Function @ opt.h:693:5
        //	x86_64-pc-windows-msvc (libavutil\opt.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_opt_set_sample_fmt(void* obj, CString name, AVSampleFormat fmt, int32 search_flags);

        // Function @ opt.h:382:5
        //	x86_64-pc-windows-msvc (libavutil\opt.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_opt_show2(void* obj, void* av_log_obj, int32 req_flags, int32 rej_flags);

        // Function @ avio.h:572:5
        //	x86_64-pc-windows-msvc (libavformat\avio.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 avio_feof(AVIOContext* s);

        // Function @ packet.h:586:10
        //	x86_64-pc-windows-msvc (libavcodec\packet.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern byte* av_packet_get_side_data(AVPacket* pkt, AVPacketSideDataType type, int* size);

        // Function @ mem.h:303:7
        //	x86_64-pc-windows-msvc (libavutil\mem.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void* av_realloc_f(void* ptr, ulong nelem, ulong elsize);

        // Function @ packet.h:439:11
        //	x86_64-pc-windows-msvc (libavcodec\packet.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVPacket* av_packet_clone(AVPacket* src);

        // Function @ swscale.h:163:6
        //	x86_64-pc-windows-msvc (libswscale\swscale.h)
        [Import(swscale_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void sws_freeContext(SwsContext* swsContext);

        // Function @ buffer.h:130:14
        //	x86_64-pc-windows-msvc (libavutil\buffer.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVBufferRef* av_buffer_create(byte* data, int32 size, FnPtr_VoidPtr_BytePtr_Void free, void* opaque, int32 flags);

        // Function @ avcodec.h:3822:20
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVPixelFormat avcodec_find_best_pix_fmt_of_list(AVPixelFormat* pix_fmt_list, AVPixelFormat src_pix_fmt, int32 has_alpha, int* loss_ptr);

        // Function @ mem.h:196:7
        //	x86_64-pc-windows-msvc (libavutil\mem.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void* av_malloc(ulong size);

        // Function @ packet.h:643:5
        //	x86_64-pc-windows-msvc (libavcodec\packet.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_packet_ref(AVPacket* dst, AVPacket* src);

        // Function @ avcodec.h:3883:5
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 avcodec_default_execute2(AVCodecContext* c, FnPtr_AVCodecContextPtr_VoidPtr_Int_Int_Int func, void* arg, int* ret, int32 count);

        // Function @ avcodec.h:2767:17
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVCodecContext* avcodec_alloc_context3(AVCodec* codec);

        // Function @ avcodec.h:3880:13
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern CString avcodec_profile_name(AVCodecID codec_id, int32 profile);

        // Function @ avcodec.h:2377:6
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_codec_get_lowres(AVCodecContext* avctx);

        // Function @ avio.h:406:5
        //	x86_64-pc-windows-msvc (libavformat\avio.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 avio_open_dir(AVIODirContext** s, CString url, AVDictionary** options);

        // Function @ avcodec.h:3595:5
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_parser_change(AVCodecParserContext* s, AVCodecContext* avctx, byte** poutbuf, int* poutbuf_size, byte* buf, int32 buf_size, int32 keyframe);

        // Function @ avformat.h:431:5
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_append_packet(AVIOContext* s, AVPacket* pkt, int32 size);

        // Function @ avcodec.h:3652:5
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 avcodec_encode_audio2(AVCodecContext* avctx, AVPacket* avpkt, AVFrame* frame, int* got_packet_ptr);

        // Function @ swscale.h:264:33
        //	x86_64-pc-windows-msvc (libswscale\swscale.h)
        [Import(swscale_lib), CLink, CallingConvention(.Cdecl)]
        public static extern SwsVector* sws_getConstVec(double c, int32 length);

        // Function @ mem.h:463:6
        //	x86_64-pc-windows-msvc (libavutil\mem.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void av_freep(void* ptr);

        // Function @ avformat.h:3013:12
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVRational av_guess_sample_aspect_ratio(AVFormatContext* format, AVStream* stream, AVFrame* frame);

        // Function @ codec_desc.h:116:26
        //	x86_64-pc-windows-msvc (libavcodec\codec_desc.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVCodecDescriptor* avcodec_descriptor_next(AVCodecDescriptor* prev);

        // Function @ opt.h:465:5
        //	x86_64-pc-windows-msvc (libavutil\opt.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_opt_flag_is_set(void* obj, CString field_name, CString flag_name);

        // Function @ avcodec.h:3712:5
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 avpicture_alloc(AVPicture* picture, AVPixelFormat pix_fmt, int32 width, int32 height);

        // Function @ channel_layout.h:176:5
        //	x86_64-pc-windows-msvc (libavutil\channel_layout.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_get_channel_layout_nb_channels(ulong channel_layout);

        // Function @ hwcontext.h:239:21
        //	x86_64-pc-windows-msvc (libavutil\hwcontext.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVHWDeviceType av_hwdevice_find_type_by_name(CString name);

        // Function @ avformat.h:2488:5
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_read_pause(AVFormatContext* s);

        // Function @ buffer.h:147:14
        //	x86_64-pc-windows-msvc (libavutil\buffer.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVBufferRef* av_buffer_ref(AVBufferRef* buf);

        // Function @ avformat.h:2457:5
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 avformat_seek_file(AVFormatContext* s, int32 stream_index, long min_ts, long ts, long max_ts, int32 flags);

        // Function @ avformat.h:2990:26
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVCodecTag* avformat_get_mov_audio_tags();

        // Function @ avformat.h:1239:7
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void av_stream_set_recommended_encoder_configuration(AVStream* s, CString configuration);

        // Function @ rational.h:128:12
        //	x86_64-pc-windows-msvc (libavutil\rational.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVRational av_mul_q(AVRational b, AVRational c);

        // Function @ bsf.h:278:5
        //	x86_64-pc-windows-msvc (libavcodec\bsf.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_bsf_list_append2(AVBSFList* lst, CString bsf_name, AVDictionary** options);

        // Function @ avformat.h:2481:5
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_read_play(AVFormatContext* s);

        // Function @ swscale.h:265:33
        //	x86_64-pc-windows-msvc (libswscale\swscale.h)
        [Import(swscale_lib), CLink, CallingConvention(.Cdecl)]
        public static extern SwsVector* sws_getIdentityVec();

        // Function @ hwcontext.h:442:5
        //	x86_64-pc-windows-msvc (libavutil\hwcontext.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_hwframe_transfer_get_formats(AVBufferRef* hwframe_ctx, AVHWFrameTransferDirection dir, AVPixelFormat** formats, int32 flags);

        // Function @ avdevice.h:61:13
        //	x86_64-pc-windows-msvc (libavdevice\avdevice.h)
        [Import(avdevice_lib), CLink, CallingConvention(.Cdecl)]
        public static extern CString avdevice_configuration();

        // Function @ avformat.h:2646:5
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_write_uncoded_frame(AVFormatContext* s, int32 stream_index, AVFrame* frame);

        // Function @ opt.h:481:5
        //	x86_64-pc-windows-msvc (libavutil\opt.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_opt_set_dict(void* obj, AVDictionary** options);

        // Function @ frame.h:764:6
        //	x86_64-pc-windows-msvc (libavutil\frame.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void av_frame_free(AVFrame** frame);

        // Function @ opt.h:550:5
        //	x86_64-pc-windows-msvc (libavutil\opt.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_opt_eval_int64(void* obj, AVOption* o, CString val, long* int64_out);

        // Function @ avio.h:632:14
        //	x86_64-pc-windows-msvc (libavformat\avio.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern uint32 avio_rl16(AVIOContext* s);

        // Function @ channel_layout.h:165:6
        //	x86_64-pc-windows-msvc (libavutil\channel_layout.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void av_get_channel_layout_string(CString buf, int32 buf_size, int32 nb_channels, ulong channel_layout);

        // Function @ log.h:273:6
        //	x86_64-pc-windows-msvc (libavutil\log.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void av_vlog(void* avcl, int32 level, CString fmt, void* vl);

        // Function @ avcodec.h:3833:20
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVPixelFormat avcodec_find_best_pix_fmt2(AVPixelFormat dst_pix_fmt1, AVPixelFormat dst_pix_fmt2, AVPixelFormat src_pix_fmt, int32 has_alpha, int* loss_ptr);

        // Function @ avio.h:477:6
        //	x86_64-pc-windows-msvc (libavformat\avio.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void avio_context_free(AVIOContext** s);

        // Function @ avformat.h:2108:23
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVOutputFormat* av_muxer_iterate(void** opaque);

        // Function @ opt.h:400:6
        //	x86_64-pc-windows-msvc (libavutil\opt.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void av_opt_set_defaults2(void* s, int32 mask, int32 flags);

        // Function @ mem.h:286:5
        //	x86_64-pc-windows-msvc (libavutil\mem.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_reallocp(void* ptr, ulong size);

        // Function @ samplefmt.h:117:21
        //	x86_64-pc-windows-msvc (libavutil\samplefmt.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVSampleFormat av_get_planar_sample_fmt(AVSampleFormat sample_fmt);

        // Function @ avcodec.h:3930:6
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void avcodec_flush_buffers(AVCodecContext* avctx);

        // Function @ bsf.h:169:5
        //	x86_64-pc-windows-msvc (libavcodec\bsf.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_bsf_init(AVBSFContext* ctx);

        // Function @ packet.h:575:5
        //	x86_64-pc-windows-msvc (libavcodec\packet.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_packet_shrink_side_data(AVPacket* pkt, AVPacketSideDataType type, int32 size);

        // Function @ avcodec.h:3544:22
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVCodecParser* av_parser_iterate(void** opaque);

        // Function @ swscale.h:251:12
        //	x86_64-pc-windows-msvc (libswscale\swscale.h)
        [Import(swscale_lib), CLink, CallingConvention(.Cdecl)]
        public static extern SwsVector* sws_getGaussianVec(double variance, double quality);

        // Function @ avformat.h:3023:12
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVRational av_guess_frame_rate(AVFormatContext* ctx, AVStream* stream, AVFrame* frame);

        // Function @ opt.h:549:5
        //	x86_64-pc-windows-msvc (libavutil\opt.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_opt_eval_int(void* obj, AVOption* o, CString val, int* int_out);

        // Function @ avformat.h:2948:5
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_match_ext(CString filename, CString extensions);

        // Function @ avcodec.h:4028:26
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVBitStreamFilter* av_bsf_next(void** opaque);

        // Function @ avcodec.h:3946:16
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVCodecID av_get_pcm_codec(AVSampleFormat fmt, int32 be);

        // Function @ opt.h:690:5
        //	x86_64-pc-windows-msvc (libavutil\opt.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_opt_set_bin(void* obj, CString name, byte* val, int32 size, int32 search_flags);

        // Function @ buffer.h:170:5
        //	x86_64-pc-windows-msvc (libavutil\buffer.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_buffer_get_ref_count(AVBufferRef* buf);

        // Function @ avio.h:551:9
        //	x86_64-pc-windows-msvc (libavformat\avio.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern long avio_skip(AVIOContext* s, long offset);

        // Function @ swscale.h:256:6
        //	x86_64-pc-windows-msvc (libswscale\swscale.h)
        [Import(swscale_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void sws_scaleVec(SwsVector* a, double scalar);

        // Function @ packet.h:509:5
        //	x86_64-pc-windows-msvc (libavcodec\packet.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_dup_packet(AVPacket* pkt);

        // Function @ bsf.h:249:12
        //	x86_64-pc-windows-msvc (libavcodec\bsf.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVBSFList* av_bsf_list_alloc();

        // Function @ avutil.h:171:10
        //	x86_64-pc-windows-msvc (libavutil\avutil.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern uint32 avutil_version();

        // Function @ frame.h:856:5
        //	x86_64-pc-windows-msvc (libavutil\frame.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_frame_make_writable(AVFrame* frame);

        // Function @ avio.h:462:14
        //	x86_64-pc-windows-msvc (libavformat\avio.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVIOContext* avio_alloc_context(byte* buffer, int32 buffer_size, int32 write_flag, void* opaque, FnPtr_VoidPtr_BytePtr_Int_Int read_packet, FnPtr_VoidPtr_BytePtr_Int_Int write_packet, FnPtr_VoidPtr_Long_Int_Long seek);

        // Function @ frame.h:690:9
        //	x86_64-pc-windows-msvc (libavutil\frame.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void av_frame_set_best_effort_timestamp(AVFrame* frame, long val);

        // Function @ avio.h:361:13
        //	x86_64-pc-windows-msvc (libavformat\avio.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern CString avio_find_protocol_name(CString url);

        // Function @ mem.h:622:5
        //	x86_64-pc-windows-msvc (libavutil\mem.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_dynarray_add_nofree(void* tab_ptr, int* nb_ptr, void* elem);

        // Function @ avio.h:763:5
        //	x86_64-pc-windows-msvc (libavformat\avio.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 avio_closep(AVIOContext** s);

        // Function @ swscale.h:267:27
        //	x86_64-pc-windows-msvc (libswscale\swscale.h)
        [Import(swscale_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void sws_addVec(SwsVector* a, SwsVector* b);

        // Function @ avformat.h:2552:5
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 avformat_init_output(AVFormatContext* s, AVDictionary** options);

        // Function @ avcodec.h:3739:5
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 avpicture_get_size(AVPixelFormat pix_fmt, int32 width, int32 height);

        // Function @ avformat.h:1965:11
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVCodec* av_format_get_video_codec(AVFormatContext* s);

        // Function @ avformat.h:2034:13
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern CString avformat_configuration();

        // Function @ avcodec.h:3104:5
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 avcodec_decode_subtitle2(AVCodecContext* avctx, AVSubtitle* sub, int* got_sub_ptr, AVPacket* avpkt);

        // Function @ hwcontext.h:382:5
        //	x86_64-pc-windows-msvc (libavutil\hwcontext.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_hwframe_get_buffer(AVBufferRef* hwframe_ctx, AVFrame* frame, int32 flags);

        // Function @ opt.h:750:5
        //	x86_64-pc-windows-msvc (libavutil\opt.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_opt_get_channel_layout(void* obj, CString name, int32 search_flags, long* ch_layout);

        // Function @ opt.h:746:5
        //	x86_64-pc-windows-msvc (libavutil\opt.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_opt_get_image_size(void* obj, CString name, int32 search_flags, int* w_out, int* h_out);

        // Function @ codec.h:350:10
        //	x86_64-pc-windows-msvc (libavcodec\codec.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVCodec* avcodec_find_decoder(AVCodecID id);

        // Function @ avformat.h:2339:5
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 avformat_find_stream_info(AVFormatContext* ic, AVDictionary** options);

        // Function @ log.h:234:6
        //	x86_64-pc-windows-msvc (libavutil\log.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void av_log(void* avcl, int32 level, CString fmt);

        // Function @ channel_layout.h:205:13
        //	x86_64-pc-windows-msvc (libavutil\channel_layout.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern CString av_get_channel_name(ulong channel);

        // Function @ avcodec.h:3694:5
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 avcodec_encode_subtitle(AVCodecContext* avctx, byte* buf, int32 buf_size, AVSubtitle* sub);

        // Function @ dict.h:156:5
        //	x86_64-pc-windows-msvc (libavutil\dict.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_dict_parse_string(AVDictionary** pm, CString str, CString key_val_sep, CString pairs_sep, int32 flags);

        // Function @ avcodec.h:2751:6
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void avcodec_register_all();

        // Function @ avutil.h:183:13
        //	x86_64-pc-windows-msvc (libavutil\avutil.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern CString avutil_configuration();

        // Function @ opt.h:692:5
        //	x86_64-pc-windows-msvc (libavutil\opt.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_opt_set_pixel_fmt(void* obj, CString name, AVPixelFormat fmt, int32 search_flags);

        // Function @ avio.h:638:14
        //	x86_64-pc-windows-msvc (libavformat\avio.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern uint32 avio_rb32(AVIOContext* s);

        // Function @ bsf.h:256:6
        //	x86_64-pc-windows-msvc (libavcodec\bsf.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void av_bsf_list_free(AVBSFList** lst);

        // Function @ avformat.h:2313:5
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 avformat_open_input(AVFormatContext** ps, CString url, AVInputFormat* fmt, AVDictionary** options);

        // Function @ frame.h:743:13
        //	x86_64-pc-windows-msvc (libavutil\frame.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern CString av_get_colorspace_name(AVColorSpace val);

        // Function @ packet.h:458:6
        //	x86_64-pc-windows-msvc (libavcodec\packet.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void av_init_packet(AVPacket* pkt);

        // Function @ avcodec.h:3584:5
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_parser_parse2(AVCodecParserContext* s, AVCodecContext* avctx, byte** poutbuf, int* poutbuf_size, byte* buf, int32 buf_size, long pts, long dts, long pos);

        // Function @ avcodec.h:4136:18
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVCPBProperties* av_cpb_properties_alloc(ulong* size);

        // Function @ avformat.h:1973:11
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVCodec* av_format_get_subtitle_codec(AVFormatContext* s);

        // Function @ avformat.h:2351:12
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVProgram* av_find_program_from_stream(AVFormatContext* ic, AVProgram* last, int32 s);

        // Function @ hwcontext.h:257:21
        //	x86_64-pc-windows-msvc (libavutil\hwcontext.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVHWDeviceType av_hwdevice_iterate_types(AVHWDeviceType prev);

        // Function @ avcodec.h:4040:6
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void av_fast_padded_malloc(void* ptr, uint* size, ulong min_size);

        // Function @ swscale.h:50:13
        //	x86_64-pc-windows-msvc (libswscale\swscale.h)
        [Import(swscale_lib), CLink, CallingConvention(.Cdecl)]
        public static extern CString swscale_configuration();

        // Function @ frame.h:732:9
        //	x86_64-pc-windows-msvc (libavutil\frame.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void av_frame_set_colorspace(AVFrame* frame, AVColorSpace val);

        // Function @ avio.h:784:5
        //	x86_64-pc-windows-msvc (libavformat\avio.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 avio_get_dyn_buf(AVIOContext* s, byte** pbuffer);

        // Function @ frame.h:879:5
        //	x86_64-pc-windows-msvc (libavutil\frame.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_frame_copy_props(AVFrame* dst, AVFrame* src);

        // Function @ avformat.h:2530:5
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 avformat_write_header(AVFormatContext* s, AVDictionary** options);

        // Function @ packet.h:703:5
        //	x86_64-pc-windows-msvc (libavcodec\packet.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_packet_make_writable(AVPacket* pkt);

        // Function @ avcodec.h:3992:6
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void av_register_bitstream_filter(AVBitStreamFilter* bsf);

        // Function @ mathematics.h:175:5
        //	x86_64-pc-windows-msvc (libavutil\mathematics.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_compare_ts(long ts_a, AVRational tb_a, long ts_b, AVRational tb_b);

        // Function @ avformat.h:2283:5
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_probe_input_buffer2(AVIOContext* pb, AVInputFormat** fmt, CString url, void* logctx, uint32 offset, uint32 max_probe_size);

        // Function @ avformat.h:1967:11
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void av_format_set_video_codec(AVFormatContext* s, AVCodec* c);

        // Function @ avformat.h:2428:5
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_seek_frame(AVFormatContext* s, int32 stream_index, long timestamp, int32 flags);

        // Function @ avio.h:386:5
        //	x86_64-pc-windows-msvc (libavformat\avio.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 avpriv_io_move(CString url_src, CString url_dst);

        // Function @ swscale.h:266:27
        //	x86_64-pc-windows-msvc (libswscale\swscale.h)
        [Import(swscale_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void sws_convVec(SwsVector* a, SwsVector* b);

        // Function @ rational.h:152:12
        //	x86_64-pc-windows-msvc (libavutil\rational.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVRational av_sub_q(AVRational b, AVRational c);

        // Function @ frame.h:696:9
        //	x86_64-pc-windows-msvc (libavutil\frame.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern long av_frame_get_pkt_pos(AVFrame* frame);

        // Function @ avcodec.h:3024:5
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 avcodec_decode_audio4(AVCodecContext* avctx, AVFrame* frame, int* got_frame_ptr, AVPacket* avpkt);

        // Function @ avio.h:430:5
        //	x86_64-pc-windows-msvc (libavformat\avio.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 avio_close_dir(AVIODirContext** s);

        // Function @ mathematics.h:151:9
        //	x86_64-pc-windows-msvc (libavutil\mathematics.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern long av_rescale_q(long a, AVRational bq, AVRational cq);

        // Function @ avcodec.h:2807:16
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVClass* avcodec_get_subtitle_rect_class();

        // Function @ swscale.h:238:5
        //	x86_64-pc-windows-msvc (libswscale\swscale.h)
        [Import(swscale_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 sws_getColorspaceDetails(SwsContext* c, long** inv_table, int* srcRange, long** table, int* dstRange, int* brightness, int* contrast, int* saturation);

        // Function @ samplefmt.h:226:5
        //	x86_64-pc-windows-msvc (libavutil\samplefmt.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_samples_alloc(byte** audio_data, int* linesize, int32 nb_channels, int32 nb_samples, AVSampleFormat sample_fmt, int32 align);

        // Function @ rational.h:136:12
        //	x86_64-pc-windows-msvc (libavutil\rational.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVRational av_div_q(AVRational b, AVRational c);

        // Function @ samplefmt.h:131:7
        //	x86_64-pc-windows-msvc (libavutil\samplefmt.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern CString av_get_sample_fmt_string(CString buf, int32 buf_size, AVSampleFormat sample_fmt);

        // Function @ swscale.h:217:5
        //	x86_64-pc-windows-msvc (libswscale\swscale.h)
        [Import(swscale_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 sws_scale(SwsContext* c, byte** srcSlice, int* srcStride, int32 srcSliceY, int32 srcSliceH, byte** dst, int* dstStride);

        // Function @ opt.h:647:7
        //	x86_64-pc-windows-msvc (libavutil\opt.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void* av_opt_child_next(void* obj, void* prev);

        // Function @ log.h:328:13
        //	x86_64-pc-windows-msvc (libavutil\log.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern CString av_default_item_name(void* ctx);

        // Function @ avcodec.h:2911:6
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void avsubtitle_free(AVSubtitle* sub);

        // Function @ avcodec.h:2383:6
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_codec_get_seek_preroll(AVCodecContext* avctx);

        // Function @ packet.h:427:11
        //	x86_64-pc-windows-msvc (libavcodec\packet.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVPacket* av_packet_alloc();

        // Function @ swscale.h:231:5
        //	x86_64-pc-windows-msvc (libswscale\swscale.h)
        [Import(swscale_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 sws_setColorspaceDetails(SwsContext* c, int* inv_table, int32 srcRange, int* table, int32 dstRange, int32 brightness, int32 contrast, int32 saturation);

        // Function @ packet.h:528:5
        //	x86_64-pc-windows-msvc (libavcodec\packet.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_copy_packet_side_data(AVPacket* dst, AVPacket* src);

        // Function @ avformat.h:3041:5
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 avformat_queue_attached_pictures(AVFormatContext* s);

        // Function @ codec_id.h:571:13
        //	x86_64-pc-windows-msvc (libavcodec\codec_id.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern CString avcodec_get_name(AVCodecID id);

        // Function @ avdevice.h:71:6
        //	x86_64-pc-windows-msvc (libavdevice\avdevice.h)
        [Import(avdevice_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void avdevice_register_all();

        // Function @ avformat.h:2752:6
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void av_hex_dump(nint f, byte* buf, int32 size);

        // Function @ avio.h:480:6
        //	x86_64-pc-windows-msvc (libavformat\avio.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void avio_write(AVIOContext* s, byte* buf, int32 size);

        // Function @ bsf.h:234:16
        //	x86_64-pc-windows-msvc (libavcodec\bsf.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVClass* av_bsf_get_class();

        // Function @ avio.h:419:5
        //	x86_64-pc-windows-msvc (libavformat\avio.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 avio_read_dir(AVIODirContext* s, AVIODirEntry** next);

        // Function @ buffer.h:286:14
        //	x86_64-pc-windows-msvc (libavutil\buffer.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVBufferRef* av_buffer_pool_get(AVBufferPool* pool);

        // Function @ avformat.h:2242:27
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVInputFormat* av_probe_input_format(AVProbeData* pd, int32 is_opened);

        // Function @ avformat.h:2982:26
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVCodecTag* avformat_get_riff_audio_tags();

        // Function @ frame.h:712:15
        //	x86_64-pc-windows-msvc (libavutil\frame.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVDictionary* av_frame_get_metadata(AVFrame* frame);

        // Function @ avcodec.h:2721:13
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern CString avcodec_configuration();

        // Function @ avcodec.h:2936:6
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void avcodec_align_dimensions(AVCodecContext* s, int* width, int* height);

        // Function @ mem.h:323:27
        //	x86_64-pc-windows-msvc (libavutil\mem.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void* av_realloc_array(void* ptr, ulong nmemb, ulong size);

        // Function @ avcodec.h:2927:5
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 avcodec_default_get_buffer2(AVCodecContext* s, AVFrame* frame, int32 flags);

        // Function @ samplefmt.h:106:21
        //	x86_64-pc-windows-msvc (libavutil\samplefmt.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVSampleFormat av_get_packed_sample_fmt(AVSampleFormat sample_fmt);

        // Function @ avformat.h:2591:5
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_write_frame(AVFormatContext* s, AVPacket* pkt);

        // Function @ avformat.h:2908:5
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_get_frame_filename2(CString buf, int32 buf_size, CString path, int32 number, int32 flags);

        // Function @ avformat.h:2039:13
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern CString avformat_license();

        // Function @ avformat.h:2079:5
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 avformat_network_deinit();

        // Function @ avcodec.h:2390:6
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void av_codec_set_chroma_intra_matrix(AVCodecContext* avctx, ushort* val);

        // Function @ avio.h:394:5
        //	x86_64-pc-windows-msvc (libavformat\avio.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 avpriv_io_delete(CString url);

        // Function @ frame.h:692:9
        //	x86_64-pc-windows-msvc (libavutil\frame.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern long av_frame_get_pkt_duration(AVFrame* frame);

        // Function @ avio.h:545:9
        //	x86_64-pc-windows-msvc (libavformat\avio.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern long avio_seek(AVIOContext* s, long offset, int32 whence);

        // Function @ frame.h:755:10
        //	x86_64-pc-windows-msvc (libavutil\frame.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVFrame* av_frame_alloc();

        // Function @ avdevice.h:447:6
        //	x86_64-pc-windows-msvc (libavdevice\avdevice.h)
        [Import(avdevice_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void avdevice_capabilities_free(AVDeviceCapabilitiesQuery** caps, AVFormatContext* s);

        // Function @ avcodec.h:3909:5
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 avcodec_fill_audio_frame(AVFrame* frame, int32 nb_channels, AVSampleFormat sample_fmt, byte* buf, int32 buf_size, int32 align);

        // Function @ swscale.h:268:27
        //	x86_64-pc-windows-msvc (libswscale\swscale.h)
        [Import(swscale_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void sws_subVec(SwsVector* a, SwsVector* b);

        // Function @ avcodec.h:2373:10
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern uint32 av_codec_get_codec_properties(AVCodecContext* avctx);

        // Function @ buffer.h:101:14
        //	x86_64-pc-windows-msvc (libavutil\buffer.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVBufferRef* av_buffer_alloc(int32 size);

        // Function @ avcodec.h:2957:5
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 avcodec_enum_to_chroma_pos(int32* xpos, int* ypos, AVChromaLocation pos);

        // Function @ avio.h:750:5
        //	x86_64-pc-windows-msvc (libavformat\avio.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 avio_close(AVIOContext* s);

        // Function @ packet.h:484:5
        //	x86_64-pc-windows-msvc (libavcodec\packet.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_grow_packet(AVPacket* pkt, int32 grow_by);

        // Function @ avcodec.h:3789:6
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void avcodec_get_chroma_sub_sample(AVPixelFormat pix_fmt, int* h_shift, int* v_shift);

        // Function @ avcodec.h:3867:13
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern CString av_get_profile_name(AVCodec* codec, int32 profile);

        // Function @ opt.h:627:17
        //	x86_64-pc-windows-msvc (libavutil\opt.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVOption* av_opt_find2(void* obj, CString name, CString unit, int32 opt_flags, int32 search_flags, void** target_obj);

        // Function @ packet.h:606:10
        //	x86_64-pc-windows-msvc (libavcodec\packet.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern byte* av_packet_pack_dictionary(AVDictionary* dict, int* size);

        // Function @ frame.h:869:5
        //	x86_64-pc-windows-msvc (libavutil\frame.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_frame_copy(AVFrame* dst, AVFrame* src);

        // Function @ cpu.h:105:5
        //	x86_64-pc-windows-msvc (libavutil\cpu.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_parse_cpu_flags(CString s);

        // Function @ log.h:255:6
        //	x86_64-pc-windows-msvc (libavutil\log.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void av_log_once(void* avcl, int32 initial_level, int32 subsequent_level, int* state, CString fmt);

        // Function @ avformat.h:1243:30
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVCodecParserContext* av_stream_get_parser(AVStream* s);

        // Function @ codec.h:342:16
        //	x86_64-pc-windows-msvc (libavcodec\codec.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVCodec* av_codec_iterate(void** opaque);

        // Function @ avio.h:634:14
        //	x86_64-pc-windows-msvc (libavformat\avio.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern uint32 avio_rl32(AVIOContext* s);

        // Function @ avio.h:613:5
        //	x86_64-pc-windows-msvc (libavformat\avio.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 avio_read(AVIOContext* s, byte* buf, int32 size);

        // Function @ avio.h:772:5
        //	x86_64-pc-windows-msvc (libavformat\avio.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 avio_open_dyn_buf(AVIOContext** s);

        // Function @ mem.h:207:7
        //	x86_64-pc-windows-msvc (libavutil\mem.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void* av_mallocz(ulong size);

        // Function @ avcodec.h:2388:11
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern ushort* av_codec_get_chroma_intra_matrix(AVCodecContext* avctx);

        // Function @ avcodec.h:2837:5
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 avcodec_parameters_from_context(AVCodecParameters* par, AVCodecContext* codec);

        // Function @ avcodec.h:2397:5
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_codec_get_max_lowres(AVCodec* codec);

        // Function @ mem.h:440:6
        //	x86_64-pc-windows-msvc (libavutil\mem.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void av_free(void* ptr);

        // Function @ avcodec.h:4118:5
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_lockmgr_register(FnPtr_VoidPtrPtr_AVLockOp_Int cb);

        // Function @ avcodec.h:4055:14
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern uint32 av_xiphlacing(byte* s, uint32 v);

        // Function @ cpu.h:93:27
        //	x86_64-pc-windows-msvc (libavutil\cpu.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void av_set_cpu_flags_mask(int32 mask);

        // Function @ hwcontext.h:247:13
        //	x86_64-pc-windows-msvc (libavutil\hwcontext.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern CString av_hwdevice_get_type_name(AVHWDeviceType type);

        // Function @ mem.h:235:27
        //	x86_64-pc-windows-msvc (libavutil\mem.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void* av_mallocz_array(ulong nmemb, ulong size);

        // Function @ avformat.h:2887:6
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void av_dump_format(AVFormatContext* ic, int32 index, CString url, int32 is_output);

        // Function @ avdevice.h:320:5
        //	x86_64-pc-windows-msvc (libavdevice\avdevice.h)
        [Import(avdevice_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 avdevice_dev_to_app_control_message(AVFormatContext* s, AVDevToAppMessageType type, void* data, ulong data_size);

        // Function @ swscale.h:271:27
        //	x86_64-pc-windows-msvc (libswscale\swscale.h)
        [Import(swscale_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void sws_printVec2(SwsVector* a, AVClass* log_ctx, int32 log_level);

        // Function @ avformat.h:2290:5
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_probe_input_buffer(AVIOContext* pb, AVInputFormat** fmt, CString url, void* logctx, uint32 offset, uint32 max_probe_size);

        // Function @ avio.h:585:6
        //	x86_64-pc-windows-msvc (libavformat\avio.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void avio_print_string_array(AVIOContext* s, CString* strings);

        // Function @ avio.h:481:6
        //	x86_64-pc-windows-msvc (libavformat\avio.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void avio_wl64(AVIOContext* s, ulong val);

        // Function @ common.h:117:14
        //	x86_64-pc-windows-msvc (libavutil\common.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_log2_16bit(uint32 v);

        // Function @ channel_layout.h:213:13
        //	x86_64-pc-windows-msvc (libavutil\channel_layout.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern CString av_get_channel_description(ulong channel);

        // Function @ avformat.h:1987:11
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void av_format_set_opaque(AVFormatContext* s, void* opaque);

        // Function @ avformat.h:1971:11
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void av_format_set_audio_codec(AVFormatContext* s, AVCodec* c);

        // Function @ avio.h:486:6
        //	x86_64-pc-windows-msvc (libavformat\avio.h)
        [Import(avformat_lib), CLink, CallingConvention(.Cdecl)]
        public static extern void avio_wb24(AVIOContext* s, uint32 val);

        // Function @ log.h:355:5
        //	x86_64-pc-windows-msvc (libavutil\log.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern int32 av_log_format_line2(void* ptr, int32 level, CString fmt, void* vl, CString line, int32 line_size, int* print_prefix);

        // Function @ bsf.h:138:26
        //	x86_64-pc-windows-msvc (libavcodec\bsf.h)
        [Import(avcodec_lib), CLink, CallingConvention(.Cdecl)]
        public static extern AVBitStreamFilter* av_bsf_get_by_name(CString name);

        // Function @ channel_layout.h:142:10
        //	x86_64-pc-windows-msvc (libavutil\channel_layout.h)
        [Import(avutil_lib), CLink, CallingConvention(.Cdecl)]
        public static extern ulong av_get_channel_layout(CString name);

        #endregion

        #region Types

        // FunctionPointer @ NoLocation
        //	x86_64-pc-windows-msvc
        typealias FnPtr_Uint_BytePtr_Uint_Uint = function uint32(uint32, byte*, uint32);

        // FunctionPointer @ NoLocation
        //	x86_64-pc-windows-msvc
        typealias FnPtr_AVBSFContextPtr_Int = function int32(AVBSFContext*);

        // FunctionPointer @ NoLocation
        //	x86_64-pc-windows-msvc
        typealias FnPtr_AVCodecContextPtr_Int = function int32(AVCodecContext*);

        // FunctionPointer @ NoLocation
        //	x86_64-pc-windows-msvc
        typealias FnPtr_AVCodecID_Int_Int = function int32(AVCodecID, int32);

        // FunctionPointer @ NoLocation
        //	x86_64-pc-windows-msvc
        typealias FnPtr_VoidPtr_Long_Int_Long = function long(void*, long, int32);

        // FunctionPointer @ NoLocation
        //	x86_64-pc-windows-msvc
        typealias FnPtr_AVProbeDataPtr_Int = function int32(AVProbeData*);

        // FunctionPointer @ NoLocation
        //	x86_64-pc-windows-msvc
        typealias FnPtr_AVFormatContextPtr_Int = function int32(AVFormatContext*);

        // FunctionPointer @ NoLocation
        //	x86_64-pc-windows-msvc
        typealias FnPtr_AVCodecContextPtr_AVPixelFormatPtr_AVPixelFormat = function AVPixelFormat(AVCodecContext*, AVPixelFormat*);

        // FunctionPointer @ NoLocation
        //	x86_64-pc-windows-msvc
        typealias FnPtr_AVFormatContextPtr_Int_Long_Long_Long_Int_Int = function int32(AVFormatContext*, int32, long, long, long, int32);

        // FunctionPointer @ NoLocation
        //	x86_64-pc-windows-msvc
        typealias FnPtr_VoidPtr_Int_AVBufferRefPtr = function AVBufferRef*(void*, int32);

        // FunctionPointer @ NoLocation
        //	x86_64-pc-windows-msvc
        typealias FnPtr_AVCodecContextPtr_AVCodecContextPtr_Int = function int32(AVCodecContext*, AVCodecContext*);

        // FunctionPointer @ NoLocation
        //	x86_64-pc-windows-msvc
        typealias FnPtr_AVFormatContextPtr_AVIOContextPtrPtr_CString_Int_AVDictionaryPtrPtr_Int = function int32(AVFormatContext*, AVIOContext**, CString, int32, AVDictionary**);

        // FunctionPointer @ NoLocation
        //	x86_64-pc-windows-msvc
        typealias FnPtr_AVCodecContextPtr_VoidPtr_Int = function int32(AVCodecContext*, void*);

        // FunctionPointer @ NoLocation
        //	x86_64-pc-windows-msvc
        typealias FnPtr_AVFormatContextPtr_Int_LongPtr_LongPtr_Void = function void(AVFormatContext*, int32, long*, long*);

        // FunctionPointer @ NoLocation
        //	x86_64-pc-windows-msvc
        typealias FnPtr_AVCodecContextPtr_AVPacketPtr_Int = function int32(AVCodecContext*, AVPacket*);

        // FunctionPointer @ NoLocation
        //	x86_64-pc-windows-msvc
        typealias FnPtr_AVFormatContextPtr_Int_LongPtr_Long_Long = function long(AVFormatContext*, int32, long*, long);

        // FunctionPointer @ NoLocation
        //	x86_64-pc-windows-msvc
        typealias FnPtr_AVCodecContextPtr_AVBufferRefPtr_Int = function int32(AVCodecContext*, AVBufferRef*);

        // FunctionPointer @ NoLocation
        //	x86_64-pc-windows-msvc
        typealias FnPtr_VoidPtr_BytePtr_Int_AVIODataMarkerType_Long_Int = function int32(void*, byte*, int32, AVIODataMarkerType, long);

        // FunctionPointer @ NoLocation
        //	x86_64-pc-windows-msvc
        typealias FnPtr_VoidPtr_CString = function CString(void*);

        // FunctionPointer @ NoLocation
        //	x86_64-pc-windows-msvc
        typealias FnPtr_AVFormatContextPtr_AVPacketPtr_AVPacketPtr_Int_Int = function int32(AVFormatContext*, AVPacket*, AVPacket*, int32);

        // FunctionPointer @ NoLocation
        //	x86_64-pc-windows-msvc
        typealias FnPtr_MpegEncContextPtr_Void = function void(MpegEncContext*);

        // FunctionPointer @ NoLocation
        //	x86_64-pc-windows-msvc
        typealias FnPtr_AVCodecContextPtr_AVFramePtr_Int = function int32(AVCodecContext*, AVFrame*);

        // FunctionPointer @ NoLocation
        //	x86_64-pc-windows-msvc
        typealias FnPtr_VoidPtr_AVClassCategory = function AVClassCategory(void*);

        // FunctionPointer @ NoLocation
        //	x86_64-pc-windows-msvc
        typealias FnPtr_AVBSFContextPtr_Void = function void(AVBSFContext*);

        // FunctionPointer @ NoLocation
        //	x86_64-pc-windows-msvc
        typealias FnPtr_AVCodecContextPtr_BytePtr_Int_Int = function int32(AVCodecContext*, byte*, int32);

        // FunctionPointer @ NoLocation
        //	x86_64-pc-windows-msvc
        typealias FnPtr_AVFormatContextPtr_Int_VoidPtr_Ulong_Int = function int32(AVFormatContext*, int32, void*, ulong);

        // FunctionPointer @ NoLocation
        //	x86_64-pc-windows-msvc
        typealias FnPtr_AVCodecContextPtr_Int_BytePtr_Uint_Int = function int32(AVCodecContext*, int32, byte*, uint32);

        // FunctionPointer @ NoLocation
        //	x86_64-pc-windows-msvc
        typealias FnPtr_AVCodecParserContextPtr_Void = function void(AVCodecParserContext*);

        // FunctionPointer @ NoLocation
        //	x86_64-pc-windows-msvc
        typealias FnPtr_AVFormatContextPtr_AVPacketPtr_Int = function int32(AVFormatContext*, AVPacket*);

        // FunctionPointer @ NoLocation
        //	x86_64-pc-windows-msvc
        typealias FnPtr_AVCodecContextPtr_FnPtr_AVCodecContextPtr_VoidPtr_Int_Int_Int_VoidPtr_IntPtr_Int_Int = function int32(AVCodecContext*, FnPtr_AVCodecContextPtr_VoidPtr_Int_Int_Int, void*, int*, int32);

        // FunctionPointer @ NoLocation
        //	x86_64-pc-windows-msvc
        typealias FnPtr_AVOptionRangesPtrPtr_VoidPtr_CString_Int_Int = function int32(AVOptionRanges**, void*, CString, int32);

        // FunctionPointer @ NoLocation
        //	x86_64-pc-windows-msvc
        typealias FnPtr_AVCodecContextPtr_VoidPtr_Int_Int_Void = function void(AVCodecContext*, void*, int32, int32);

        // FunctionPointer @ NoLocation
        //	x86_64-pc-windows-msvc
        typealias FnPtr_AVCodecContextPtr_FnPtr_AVCodecContextPtr_VoidPtr_Int_VoidPtr_IntPtr_Int_Int_Int = function int32(AVCodecContext*, FnPtr_AVCodecContextPtr_VoidPtr_Int, void*, int*, int32, int32);

        // FunctionPointer @ NoLocation
        //	x86_64-pc-windows-msvc
        typealias FnPtr_AVFormatContextPtr_AVIOContextPtr_Void = function void(AVFormatContext*, AVIOContext*);

        // FunctionPointer @ NoLocation
        //	x86_64-pc-windows-msvc
        typealias FnPtr_VoidPtr_Int = function int32(void*);

        // FunctionPointer @ NoLocation
        //	x86_64-pc-windows-msvc
        typealias FnPtr_AVCodecContextPtr_AVFramePtr_IntPtr_Int_Int_Int_Void = function void(AVCodecContext*, AVFrame*, int*, int32, int32, int32);

        // FunctionPointer @ NoLocation
        //	x86_64-pc-windows-msvc
        typealias FnPtr_AVFormatContextPtr_AVDeviceCapabilitiesQueryPtr_Int = function int32(AVFormatContext*, AVDeviceCapabilitiesQuery*);

        // FunctionPointer @ NoLocation
        //	x86_64-pc-windows-msvc
        typealias FnPtr_AVCodecContextPtr_AVPacketPtr_AVFramePtr_IntPtr_Int = function int32(AVCodecContext*, AVPacket*, AVFrame*, int*);

        // FunctionPointer @ NoLocation
        //	x86_64-pc-windows-msvc
        typealias FnPtr_AVCodecPtr_Void = function void(AVCodec*);

        // FunctionPointer @ NoLocation
        //	x86_64-pc-windows-msvc
        typealias FnPtr_AVCodecContextPtr_VoidPtr_Int_Int_Int = function int32(AVCodecContext*, void*, int32, int32);

        // FunctionPointer @ NoLocation
        //	x86_64-pc-windows-msvc
        typealias FnPtr_VoidPtr_Void = function void(void*);

        // FunctionPointer @ NoLocation
        //	x86_64-pc-windows-msvc
        typealias FnPtr_VoidPtr_BytePtr_Int_Int = function int32(void*, byte*, int32);

        // FunctionPointer @ NoLocation
        //	x86_64-pc-windows-msvc
        typealias FnPtr_VoidPtrPtr_AVLockOp_Int = function int32(void**, AVLockOp);

        // FunctionPointer @ NoLocation
        //	x86_64-pc-windows-msvc
        typealias FnPtr_AVCodecContextPtr_VoidPtr_IntPtr_AVPacketPtr_Int = function int32(AVCodecContext*, void*, int*, AVPacket*);

        // FunctionPointer @ NoLocation
        //	x86_64-pc-windows-msvc
        typealias FnPtr_AVFormatContextPtr_Int_AVFramePtrPtr_Uint_Int = function int32(AVFormatContext*, int32, AVFrame**, uint32);

        // FunctionPointer @ NoLocation
        //	x86_64-pc-windows-msvc
        typealias FnPtr_VoidPtr_VoidPtr_VoidPtr = function void*(void*, void*);

        // FunctionPointer @ NoLocation
        //	x86_64-pc-windows-msvc
        typealias FnPtr_AVFormatContextPtr_Void = function void(AVFormatContext*);

        // FunctionPointer @ NoLocation
        //	x86_64-pc-windows-msvc
        typealias FnPtr_Int_AVBufferRefPtr = function AVBufferRef*(int32);

        // FunctionPointer @ NoLocation
        //	x86_64-pc-windows-msvc
        typealias FnPtr_AVBSFContextPtr_AVPacketPtr_Int = function int32(AVBSFContext*, AVPacket*);

        // FunctionPointer @ NoLocation
        //	x86_64-pc-windows-msvc
        typealias FnPtr_AVCodecParserContextPtr_Int = function int32(AVCodecParserContext*);

        // FunctionPointer @ NoLocation
        //	x86_64-pc-windows-msvc
        typealias FnPtr_AVFormatContextPtr_AVIOContextPtrPtr_CString_Int_AVIOInterruptCBPtr_AVDictionaryPtrPtr_Int = function int32(AVFormatContext*, AVIOContext**, CString, int32, AVIOInterruptCB*, AVDictionary**);

        // FunctionPointer @ NoLocation
        //	x86_64-pc-windows-msvc
        typealias FnPtr_VoidPtr_Int_Long_Int_Long = function long(void*, int32, long, int32);

        // FunctionPointer @ NoLocation
        //	x86_64-pc-windows-msvc
        typealias FnPtr_AVClassPtr_AVClassPtr = function AVClass*(AVClass*);

        // FunctionPointer @ NoLocation
        //	x86_64-pc-windows-msvc
        typealias FnPtr_AVCodecContextPtr_BytePtr_Int_AVSubtitlePtr_Int = function int32(AVCodecContext*, byte*, int32, AVSubtitle*);

        // FunctionPointer @ NoLocation
        //	x86_64-pc-windows-msvc
        typealias FnPtr_VoidPtr_Int_CString_VoidPtr_Void = function void(void*, int32, CString, void*);

        // FunctionPointer @ NoLocation
        //	x86_64-pc-windows-msvc
        typealias FnPtr_VoidPtr_BytePtr_Void = function void(void*, byte*);

        // FunctionPointer @ NoLocation
        //	x86_64-pc-windows-msvc
        typealias FnPtr_AVCodecContextPtr_BytePtr_Uint_Int = function int32(AVCodecContext*, byte*, uint32);

        // FunctionPointer @ NoLocation
        //	x86_64-pc-windows-msvc
        typealias FnPtr_AVFormatContextPtr_Int_Long_Int_Int = function int32(AVFormatContext*, int32, long, int32);

        // FunctionPointer @ NoLocation
        //	x86_64-pc-windows-msvc
        typealias FnPtr_AVCodecContextPtr_AVFramePtr_Int_Int = function int32(AVCodecContext*, AVFrame*, int32);

        // FunctionPointer @ NoLocation
        //	x86_64-pc-windows-msvc
        typealias FnPtr_VoidPtr_Int_Int = function int32(void*, int32);

        // FunctionPointer @ NoLocation
        //	x86_64-pc-windows-msvc
        typealias FnPtr_AVCodecContextPtr_Void = function void(AVCodecContext*);

        // FunctionPointer @ NoLocation
        //	x86_64-pc-windows-msvc
        typealias FnPtr_AVFormatContextPtr_AVDeviceInfoListPtr_Int = function int32(AVFormatContext*, AVDeviceInfoList*);

        // FunctionPointer @ NoLocation
        //	x86_64-pc-windows-msvc
        typealias FnPtr_AVCodecParserContextPtr_AVCodecContextPtr_BytePtrPtr_IntPtr_BytePtr_Int_Int = function int32(AVCodecParserContext*, AVCodecContext*, byte**, int*, byte*, int32);

        // Struct @ opt.h:308:16
        //	x86_64-pc-windows-msvc (libavutil\opt.h)
        [CRepr]
        public struct AVOptionRange
        {
            public CString str;
            public double value_min;
            public double value_max;
            public double component_min;
            public double component_max;
            public int32 is_range;
        }

        // Struct @ frame.h:206:16
        //	x86_64-pc-windows-msvc (libavutil\frame.h)
        [CRepr]
        public struct AVFrameSideData
        {
            public AVFrameSideDataType type;
            public byte* data;
            public int32 size;
            public AVDictionary* metadata;
            public AVBufferRef* buf;
        }

        // Struct @ avcodec.h:255:16
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        [CRepr]
        public struct RcOverride
        {
            public int32 start_frame;
            public int32 end_frame;
            public int32 qscale;
            public float quality_factor;
        }

        // Struct @ avcodec.h:2410:16
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        [CRepr]
        public struct AVHWAccel
        {
            public CString name;
            public AVMediaType type;
            public AVCodecID id;
            public AVPixelFormat pix_fmt;
            public int32 capabilities;
            public FnPtr_AVCodecContextPtr_AVFramePtr_Int alloc_frame;
            public FnPtr_AVCodecContextPtr_BytePtr_Uint_Int start_frame;
            public FnPtr_AVCodecContextPtr_Int_BytePtr_Uint_Int decode_params;
            public FnPtr_AVCodecContextPtr_BytePtr_Uint_Int decode_slice;
            public FnPtr_AVCodecContextPtr_Int end_frame;
            public int32 frame_priv_data_size;
            public FnPtr_MpegEncContextPtr_Void decode_mb;
            public FnPtr_AVCodecContextPtr_Int init;
            public FnPtr_AVCodecContextPtr_Int uninit;
            public int32 priv_data_size;
            public int32 caps_internal;
            public FnPtr_AVCodecContextPtr_AVBufferRefPtr_Int frame_params;
        }

        // Struct @ dict.h:81:16
        //	x86_64-pc-windows-msvc (libavutil\dict.h)
        [CRepr]
        public struct AVDictionaryEntry
        {
            public CString key;
            public CString value;
        }

        // Struct @ avcodec.h:2659:16
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        [CRepr]
        public struct AVSubtitleRect
        {
            public int32 x;
            public int32 y;
            public int32 w;
            public int32 h;
            public int32 nb_colors;
            public AVPicture pict;
            public byte[32] _data; // uint8_t*[4]

            public Span<nint> data
            {
                get mut
                {
                    var pointer = &_data[0];
                    var span = Span<nint>((.)pointer, 4);
                    return span;
                }
            }

            public byte[16] _linesize; // int[4]

            public Span<int32> linesize
            {
                get mut
                {
                    var pointer = &_linesize[0];
                    var span = Span<int32>((.)pointer, 4);
                    return span;
                }
            }

            public AVSubtitleType type;
            public CString text;
            public CString ass;
            public int32 flags;
        }

        // Struct @ avdevice.h:400:16
        //	x86_64-pc-windows-msvc (libavdevice\avdevice.h)
        [CRepr]
        public struct AVDeviceCapabilitiesQuery
        {
            public AVClass* av_class;
            public AVFormatContext* device_context;
            public AVCodecID codec;
            public AVSampleFormat sample_format;
            public AVPixelFormat pixel_format;
            public int32 sample_rate;
            public int32 channels;
            public long channel_layout;
            public int32 window_width;
            public int32 window_height;
            public int32 frame_width;
            public int32 frame_height;
            public AVRational fps;
        }

        // Struct @ avformat.h:795:16
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [CRepr]
        public struct AVIndexEntry
        {
            public long pos;
            public long timestamp;
            public int32 flags;
            public int32 size;
            public int32 min_distance;
        }

        // Struct @ avformat.h:1295:16
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [CRepr]
        public struct AVChapter
        {
            public int32 id;
            public AVRational time_base;
            public long start;
            public long end;
            public AVDictionary* metadata;
        }

        // Struct @ log.h:67:16
        //	x86_64-pc-windows-msvc (libavutil\log.h)
        [CRepr]
        public struct AVClass
        {
            public CString class_name;
            public FnPtr_VoidPtr_CString item_name;
            public AVOption* option;
            public int32 version;
            public int32 log_level_offset_offset;
            public int32 parent_log_context_offset;
            public FnPtr_VoidPtr_VoidPtr_VoidPtr child_next;
            public FnPtr_AVClassPtr_AVClassPtr child_class_next;
            public AVClassCategory category;
            public FnPtr_VoidPtr_AVClassCategory get_category;
            public FnPtr_AVOptionRangesPtrPtr_VoidPtr_CString_Int_Int query_ranges;
        }

        // Struct @ avcodec.h:2694:16
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        [CRepr]
        public struct AVSubtitle
        {
            public ushort format;
            public uint32 start_display_time;
            public uint32 end_display_time;
            public uint32 num_rects;
            public AVSubtitleRect** rects;
            public long pts;
        }

        // Struct @ avformat.h:441:16
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [CRepr]
        public struct AVProbeData
        {
            public CString filename;
            public byte* buf;
            public int32 buf_size;
            public CString mime_type;
        }

        // Struct @ bsf.h:49:16
        //	x86_64-pc-windows-msvc (libavcodec\bsf.h)
        [CRepr]
        public struct AVBSFContext
        {
            public AVClass* av_class;
            public AVBitStreamFilter* filter;
            public AVBSFInternal* @internal;
            public void* priv_data;
            public AVCodecParameters* par_in;
            public AVCodecParameters* par_out;
            public AVRational time_base_in;
            public AVRational time_base_out;
        }

        // Struct @ avio.h:103:16
        //	x86_64-pc-windows-msvc (libavformat\avio.h)
        [CRepr]
        public struct AVIODirContext
        {
            public URLContext* url_context;
        }

        // Struct @ opt.h:246:16
        //	x86_64-pc-windows-msvc (libavutil\opt.h)
        [CRepr]
        public struct AVOption
        {
            public CString name;
            public CString help;
            public int32 offset;
            public AVOptionType type;
            public AVOption_ANONYMOUS_FIELD4 default_val;
            public double min;
            public double max;
            public int32 flags;
            public CString unit;
        }

        // Struct @ avcodec.h:3520:16
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        [CRepr]
        public struct AVCodecParser
        {
            public byte[20] _codec_ids; // int[5]

            public Span<int32> codec_ids
            {
                get mut
                {
                    var pointer = &_codec_ids[0];
                    var span = Span<int32>((.)pointer, 5);
                    return span;
                }
            }

            public int32 priv_data_size;
            public FnPtr_AVCodecParserContextPtr_Int parser_init;
            public FnPtr_AVCodecParserContextPtr_AVCodecContextPtr_BytePtrPtr_IntPtr_BytePtr_Int_Int parser_parse;
            public FnPtr_AVCodecParserContextPtr_Void parser_close;
            public FnPtr_AVCodecContextPtr_BytePtr_Int_Int split;
            public AVCodecParser* next;
        }

        // Struct @ swscale.h:109:16
        //	x86_64-pc-windows-msvc (libswscale\swscale.h)
        [CRepr]
        public struct SwsVector
        {
            public double* coeff;
            public int32 length;
        }

        // Struct @ avformat.h:636:16
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [CRepr]
        public struct AVInputFormat
        {
            public CString name;
            public CString long_name;
            public int32 flags;
            public CString extensions;
            public AVCodecTag** codec_tag;
            public AVClass* priv_class;
            public CString mime_type;
            public AVInputFormat* next;
            public int32 raw_codec_id;
            public int32 priv_data_size;
            public FnPtr_AVProbeDataPtr_Int read_probe;
            public FnPtr_AVFormatContextPtr_Int read_header;
            public FnPtr_AVFormatContextPtr_AVPacketPtr_Int read_packet;
            public FnPtr_AVFormatContextPtr_Int read_close;
            public FnPtr_AVFormatContextPtr_Int_Long_Int_Int read_seek;
            public FnPtr_AVFormatContextPtr_Int_LongPtr_Long_Long read_timestamp;
            public FnPtr_AVFormatContextPtr_Int read_play;
            public FnPtr_AVFormatContextPtr_Int read_pause;
            public FnPtr_AVFormatContextPtr_Int_Long_Long_Long_Int_Int read_seek2;
            public FnPtr_AVFormatContextPtr_AVDeviceInfoListPtr_Int get_device_list;
            public FnPtr_AVFormatContextPtr_AVDeviceCapabilitiesQueryPtr_Int create_device_capabilities;
            public FnPtr_AVFormatContextPtr_AVDeviceCapabilitiesQueryPtr_Int free_device_capabilities;
        }

        // Struct @ avformat.h:2011:16
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [CRepr]
        public struct AVPacketList
        {
            public AVPacket pkt;
            public AVPacketList* next;
        }

        // Struct @ bsf.h:98:16
        //	x86_64-pc-windows-msvc (libavcodec\bsf.h)
        [CRepr]
        public struct AVBitStreamFilter
        {
            public CString name;
            public AVCodecID* codec_ids;
            public AVClass* priv_class;
            public int32 priv_data_size;
            public FnPtr_AVBSFContextPtr_Int init;
            public FnPtr_AVBSFContextPtr_AVPacketPtr_Int filter;
            public FnPtr_AVBSFContextPtr_Void close;
            public FnPtr_AVBSFContextPtr_Void flush;
        }

        // Struct @ avcodec.h:2627:16
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        [CRepr]
        public struct AVPicture
        {
            public byte[64] _data; // uint8_t*[8]

            public Span<nint> data
            {
                get mut
                {
                    var pointer = &_data[0];
                    var span = Span<nint>((.)pointer, 8);
                    return span;
                }
            }

            public byte[32] _linesize; // int[8]

            public Span<int32> linesize
            {
                get mut
                {
                    var pointer = &_linesize[0];
                    var span = Span<int32>((.)pointer, 8);
                    return span;
                }
            }
        }

        // Union @ opt.h:265:5
        //	x86_64-pc-windows-msvc (libavutil\opt.h)
        [CRepr]
        public struct AVOption_ANONYMOUS_FIELD4
        {
            public long i64;
            public double dbl;
            public CString str;
            public AVRational q;
        }

        // Struct @ codec_desc.h:38:16
        //	x86_64-pc-windows-msvc (libavcodec\codec_desc.h)
        [CRepr]
        public struct AVCodecDescriptor
        {
            public AVCodecID id;
            public AVMediaType type;
            public CString name;
            public CString long_name;
            public int32 props;
            public CString* mime_types;
            public AVProfile* profiles;
        }

        // Struct @ swscale.h:115:16
        //	x86_64-pc-windows-msvc (libswscale\swscale.h)
        [CRepr]
        public struct SwsFilter
        {
            public SwsVector* lumH;
            public SwsVector* lumV;
            public SwsVector* chrH;
            public SwsVector* chrV;
        }

        // Struct @ codec_par.h:52:16
        //	x86_64-pc-windows-msvc (libavcodec\codec_par.h)
        [CRepr]
        public struct AVCodecParameters
        {
            public AVMediaType codec_type;
            public AVCodecID codec_id;
            public uint32 codec_tag;
            public byte* extradata;
            public int32 extradata_size;
            public int32 format;
            public long bit_rate;
            public int32 bits_per_coded_sample;
            public int32 bits_per_raw_sample;
            public int32 profile;
            public int32 level;
            public int32 width;
            public int32 height;
            public AVRational sample_aspect_ratio;
            public AVFieldOrder field_order;
            public AVColorRange color_range;
            public AVColorPrimaries color_primaries;
            public AVColorTransferCharacteristic color_trc;
            public AVColorSpace color_space;
            public AVChromaLocation chroma_location;
            public int32 video_delay;
            public ulong channel_layout;
            public int32 channels;
            public int32 sample_rate;
            public int32 block_align;
            public int32 frame_size;
            public int32 initial_padding;
            public int32 trailing_padding;
            public int32 seek_preroll;
        }

        // Struct @ buffer.h:81:16
        //	x86_64-pc-windows-msvc (libavutil\buffer.h)
        [CRepr]
        public struct AVBufferRef
        {
            public AVBuffer* buffer;
            public byte* data;
            public int32 size;
        }

        // Struct @ codec.h:176:16
        //	x86_64-pc-windows-msvc (libavcodec\codec.h)
        [CRepr]
        public struct AVProfile
        {
            public int32 profile;
            public CString name;
        }

        // Struct @ avformat.h:490:16
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [CRepr]
        public struct AVOutputFormat
        {
            public CString name;
            public CString long_name;
            public CString mime_type;
            public CString extensions;
            public AVCodecID audio_codec;
            public AVCodecID video_codec;
            public AVCodecID subtitle_codec;
            public int32 flags;
            public AVCodecTag** codec_tag;
            public AVClass* priv_class;
            public AVOutputFormat* next;
            public int32 priv_data_size;
            public FnPtr_AVFormatContextPtr_Int write_header;
            public FnPtr_AVFormatContextPtr_AVPacketPtr_Int write_packet;
            public FnPtr_AVFormatContextPtr_Int write_trailer;
            public FnPtr_AVFormatContextPtr_AVPacketPtr_AVPacketPtr_Int_Int interleave_packet;
            public FnPtr_AVCodecID_Int_Int query_codec;
            public FnPtr_AVFormatContextPtr_Int_LongPtr_LongPtr_Void get_output_timestamp;
            public FnPtr_AVFormatContextPtr_Int_VoidPtr_Ulong_Int control_message;
            public FnPtr_AVFormatContextPtr_Int_AVFramePtrPtr_Uint_Int write_uncoded_frame;
            public FnPtr_AVFormatContextPtr_AVDeviceInfoListPtr_Int get_device_list;
            public FnPtr_AVFormatContextPtr_AVDeviceCapabilitiesQueryPtr_Int create_device_capabilities;
            public FnPtr_AVFormatContextPtr_AVDeviceCapabilitiesQueryPtr_Int free_device_capabilities;
            public AVCodecID data_codec;
            public FnPtr_AVFormatContextPtr_Int init;
            public FnPtr_AVFormatContextPtr_Void deinit;
            public FnPtr_AVFormatContextPtr_AVPacketPtr_Int check_bitstream;
        }

        // Struct @ rational.h:58:16
        //	x86_64-pc-windows-msvc (libavutil\rational.h)
        [CRepr]
        public struct AVRational
        {
            public int32 num;
            public int32 den;
        }

        // Struct @ avcodec.h:526:16
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        [CRepr]
        public struct AVCodecContext
        {
            public AVClass* av_class;
            public int32 log_level_offset;
            public AVMediaType codec_type;
            public AVCodec* codec;
            public AVCodecID codec_id;
            public uint32 codec_tag;
            public void* priv_data;
            public AVCodecInternal* @internal;
            public void* opaque;
            public long bit_rate;
            public int32 bit_rate_tolerance;
            public int32 global_quality;
            public int32 compression_level;
            public int32 flags;
            public int32 flags2;
            public byte* extradata;
            public int32 extradata_size;
            public AVRational time_base;
            public int32 ticks_per_frame;
            public int32 delay;
            public int32 width;
            public int32 height;
            public int32 coded_width;
            public int32 coded_height;
            public int32 gop_size;
            public AVPixelFormat pix_fmt;
            public FnPtr_AVCodecContextPtr_AVFramePtr_IntPtr_Int_Int_Int_Void draw_horiz_band;
            public FnPtr_AVCodecContextPtr_AVPixelFormatPtr_AVPixelFormat get_format;
            public int32 max_b_frames;
            public float b_quant_factor;
            public int32 b_frame_strategy;
            public float b_quant_offset;
            public int32 has_b_frames;
            public int32 mpeg_quant;
            public float i_quant_factor;
            public float i_quant_offset;
            public float lumi_masking;
            public float temporal_cplx_masking;
            public float spatial_cplx_masking;
            public float p_masking;
            public float dark_masking;
            public int32 slice_count;
            public int32 prediction_method;
            public int* slice_offset;
            public AVRational sample_aspect_ratio;
            public int32 me_cmp;
            public int32 me_sub_cmp;
            public int32 mb_cmp;
            public int32 ildct_cmp;
            public int32 dia_size;
            public int32 last_predictor_count;
            public int32 pre_me;
            public int32 me_pre_cmp;
            public int32 pre_dia_size;
            public int32 me_subpel_quality;
            public int32 me_range;
            public int32 slice_flags;
            public int32 mb_decision;
            public ushort* intra_matrix;
            public ushort* inter_matrix;
            public int32 scenechange_threshold;
            public int32 noise_reduction;
            public int32 intra_dc_precision;
            public int32 skip_top;
            public int32 skip_bottom;
            public int32 mb_lmin;
            public int32 mb_lmax;
            public int32 me_penalty_compensation;
            public int32 bidir_refine;
            public int32 brd_scale;
            public int32 keyint_min;
            public int32 refs;
            public int32 chromaoffset;
            public int32 mv0_threshold;
            public int32 b_sensitivity;
            public AVColorPrimaries color_primaries;
            public AVColorTransferCharacteristic color_trc;
            public AVColorSpace colorspace;
            public AVColorRange color_range;
            public AVChromaLocation chroma_sample_location;
            public int32 slices;
            public AVFieldOrder field_order;
            public int32 sample_rate;
            public int32 channels;
            public AVSampleFormat sample_fmt;
            public int32 frame_size;
            public int32 frame_number;
            public int32 block_align;
            public int32 cutoff;
            public ulong channel_layout;
            public ulong request_channel_layout;
            public AVAudioServiceType audio_service_type;
            public AVSampleFormat request_sample_fmt;
            public FnPtr_AVCodecContextPtr_AVFramePtr_Int_Int get_buffer2;
            public int32 refcounted_frames;
            public float qcompress;
            public float qblur;
            public int32 qmin;
            public int32 qmax;
            public int32 max_qdiff;
            public int32 rc_buffer_size;
            public int32 rc_override_count;
            public RcOverride* rc_override;
            public long rc_max_rate;
            public long rc_min_rate;
            public float rc_max_available_vbv_use;
            public float rc_min_vbv_overflow_use;
            public int32 rc_initial_buffer_occupancy;
            public int32 coder_type;
            public int32 context_model;
            public int32 frame_skip_threshold;
            public int32 frame_skip_factor;
            public int32 frame_skip_exp;
            public int32 frame_skip_cmp;
            public int32 trellis;
            public int32 min_prediction_order;
            public int32 max_prediction_order;
            public long timecode_frame_start;
            public FnPtr_AVCodecContextPtr_VoidPtr_Int_Int_Void rtp_callback;
            public int32 rtp_payload_size;
            public int32 mv_bits;
            public int32 header_bits;
            public int32 i_tex_bits;
            public int32 p_tex_bits;
            public int32 i_count;
            public int32 p_count;
            public int32 skip_count;
            public int32 misc_bits;
            public int32 frame_bits;
            public CString stats_out;
            public CString stats_in;
            public int32 workaround_bugs;
            public int32 strict_std_compliance;
            public int32 error_concealment;
            public int32 debug;
            public int32 err_recognition;
            public long reordered_opaque;
            public AVHWAccel* hwaccel;
            public void* hwaccel_context;
            public byte[64] _error; // uint64_t[8]

            public Span<ulong> error
            {
                get mut
                {
                    var pointer = &_error[0];
                    var span = Span<ulong>((.)pointer, 8);
                    return span;
                }
            }

            public int32 dct_algo;
            public int32 idct_algo;
            public int32 bits_per_coded_sample;
            public int32 bits_per_raw_sample;
            public int32 lowres;
            public AVFrame* coded_frame;
            public int32 thread_count;
            public int32 thread_type;
            public int32 active_thread_type;
            public int32 thread_safe_callbacks;
            public FnPtr_AVCodecContextPtr_FnPtr_AVCodecContextPtr_VoidPtr_Int_VoidPtr_IntPtr_Int_Int_Int execute;
            public FnPtr_AVCodecContextPtr_FnPtr_AVCodecContextPtr_VoidPtr_Int_Int_Int_VoidPtr_IntPtr_Int_Int execute2;
            public int32 nsse_weight;
            public int32 profile;
            public int32 level;
            public AVDiscard skip_loop_filter;
            public AVDiscard skip_idct;
            public AVDiscard skip_frame;
            public byte* subtitle_header;
            public int32 subtitle_header_size;
            public ulong vbv_delay;
            public int32 side_data_only_packets;
            public int32 initial_padding;
            public AVRational framerate;
            public AVPixelFormat sw_pix_fmt;
            public AVRational pkt_timebase;
            public AVCodecDescriptor* codec_descriptor;
            public long pts_correction_num_faulty_pts;
            public long pts_correction_num_faulty_dts;
            public long pts_correction_last_pts;
            public long pts_correction_last_dts;
            public CString sub_charenc;
            public int32 sub_charenc_mode;
            public int32 skip_alpha;
            public int32 seek_preroll;
            public int32 debug_mv;
            public ushort* chroma_intra_matrix;
            public byte* dump_separator;
            public CString codec_whitelist;
            public uint32 properties;
            public AVPacketSideData* coded_side_data;
            public int32 nb_coded_side_data;
            public AVBufferRef* hw_frames_ctx;
            public int32 sub_text_format;
            public int32 trailing_padding;
            public long max_pixels;
            public AVBufferRef* hw_device_ctx;
            public int32 hwaccel_flags;
            public int32 apply_cropping;
            public int32 extra_hw_frames;
            public int32 discard_damaged_percentage;
            public long max_samples;
            public int32 export_side_data;
        }

        // Struct @ avdevice.h:452:16
        //	x86_64-pc-windows-msvc (libavdevice\avdevice.h)
        [CRepr]
        public struct AVDeviceInfo
        {
            public CString device_name;
            public CString device_description;
        }

        // Struct @ codec.h:190:16
        //	x86_64-pc-windows-msvc (libavcodec\codec.h)
        [CRepr]
        public struct AVCodec
        {
            public CString name;
            public CString long_name;
            public AVMediaType type;
            public AVCodecID id;
            public int32 capabilities;
            public AVRational* supported_framerates;
            public AVPixelFormat* pix_fmts;
            public int* supported_samplerates;
            public AVSampleFormat* sample_fmts;
            public ulong* channel_layouts;
            public byte max_lowres;
            public AVClass* priv_class;
            public AVProfile* profiles;
            public CString wrapper_name;
            public int32 priv_data_size;
            public AVCodec* next;
            public FnPtr_AVCodecContextPtr_AVCodecContextPtr_Int update_thread_context;
            public AVCodecDefault* defaults;
            public FnPtr_AVCodecPtr_Void init_static_data;
            public FnPtr_AVCodecContextPtr_Int init;
            public FnPtr_AVCodecContextPtr_BytePtr_Int_AVSubtitlePtr_Int encode_sub;
            public FnPtr_AVCodecContextPtr_AVPacketPtr_AVFramePtr_IntPtr_Int encode2;
            public FnPtr_AVCodecContextPtr_VoidPtr_IntPtr_AVPacketPtr_Int decode;
            public FnPtr_AVCodecContextPtr_Int close;
            public FnPtr_AVCodecContextPtr_AVFramePtr_Int send_frame;
            public FnPtr_AVCodecContextPtr_AVPacketPtr_Int receive_packet;
            public FnPtr_AVCodecContextPtr_AVFramePtr_Int receive_frame;
            public FnPtr_AVCodecContextPtr_Void flush;
            public int32 caps_internal;
            public CString bsfs;
            public AVCodecHWConfigInternal** hw_configs;
            public uint* codec_tags;
        }

        // Struct @ frame.h:300:16
        //	x86_64-pc-windows-msvc (libavutil\frame.h)
        [CRepr]
        public struct AVFrame
        {
            public byte[64] _data; // uint8_t*[8]

            public Span<nint> data
            {
                get mut
                {
                    var pointer = &_data[0];
                    var span = Span<nint>((.)pointer, 8);
                    return span;
                }
            }

            public byte[32] _linesize; // int[8]

            public Span<int32> linesize
            {
                get mut
                {
                    var pointer = &_linesize[0];
                    var span = Span<int32>((.)pointer, 8);
                    return span;
                }
            }

            public byte** extended_data;
            public int32 width;
            public int32 height;
            public int32 nb_samples;
            public int32 format;
            public int32 key_frame;
            public AVPictureType pict_type;
            public AVRational sample_aspect_ratio;
            public long pts;
            public long pkt_pts;
            public long pkt_dts;
            public int32 coded_picture_number;
            public int32 display_picture_number;
            public int32 quality;
            public void* opaque;
            public byte[64] _error; // uint64_t[8]

            public Span<ulong> error
            {
                get mut
                {
                    var pointer = &_error[0];
                    var span = Span<ulong>((.)pointer, 8);
                    return span;
                }
            }

            public int32 repeat_pict;
            public int32 interlaced_frame;
            public int32 top_field_first;
            public int32 palette_has_changed;
            public long reordered_opaque;
            public int32 sample_rate;
            public ulong channel_layout;
            public byte[64] _buf; // AVBufferRef*[8]

            public Span<nint> buf
            {
                get mut
                {
                    var pointer = &_buf[0];
                    var span = Span<nint>((.)pointer, 8);
                    return span;
                }
            }

            public AVBufferRef** extended_buf;
            public int32 nb_extended_buf;
            public AVFrameSideData** side_data;
            public int32 nb_side_data;
            public int32 flags;
            public AVColorRange color_range;
            public AVColorPrimaries color_primaries;
            public AVColorTransferCharacteristic color_trc;
            public AVColorSpace colorspace;
            public AVChromaLocation chroma_location;
            public long best_effort_timestamp;
            public long pkt_pos;
            public long pkt_duration;
            public AVDictionary* metadata;
            public int32 decode_error_flags;
            public int32 channels;
            public int32 pkt_size;
            public sbyte* qscale_table;
            public int32 qstride;
            public int32 qscale_type;
            public AVBufferRef* qp_table_buf;
            public AVBufferRef* hw_frames_ctx;
            public AVBufferRef* opaque_ref;
            public ulong crop_top;
            public ulong crop_bottom;
            public ulong crop_left;
            public ulong crop_right;
            public AVBufferRef* private_ref;
        }

        // Struct @ avformat.h:1338:16
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [CRepr]
        public struct AVFormatContext
        {
            public AVClass* av_class;
            public AVInputFormat* iformat;
            public AVOutputFormat* oformat;
            public void* priv_data;
            public AVIOContext* pb;
            public int32 ctx_flags;
            public uint32 nb_streams;
            public AVStream** streams;
            public byte[1024] _filename; // char[1024]

            public StringView filename mut => .((.)&_filename[0]);
            public CString url;
            public long start_time;
            public long duration;
            public long bit_rate;
            public uint32 packet_size;
            public int32 max_delay;
            public int32 flags;
            public long probesize;
            public long max_analyze_duration;
            public byte* key;
            public int32 keylen;
            public uint32 nb_programs;
            public AVProgram** programs;
            public AVCodecID video_codec_id;
            public AVCodecID audio_codec_id;
            public AVCodecID subtitle_codec_id;
            public uint32 max_index_size;
            public uint32 max_picture_buffer;
            public uint32 nb_chapters;
            public AVChapter** chapters;
            public AVDictionary* metadata;
            public long start_time_realtime;
            public int32 fps_probe_size;
            public int32 error_recognition;
            public AVIOInterruptCB interrupt_callback;
            public int32 debug;
            public long max_interleave_delta;
            public int32 strict_std_compliance;
            public int32 event_flags;
            public int32 max_ts_probe;
            public int32 avoid_negative_ts;
            public int32 ts_id;
            public int32 audio_preload;
            public int32 max_chunk_duration;
            public int32 max_chunk_size;
            public int32 use_wallclock_as_timestamps;
            public int32 avio_flags;
            public AVDurationEstimationMethod duration_estimation_method;
            public long skip_initial_bytes;
            public uint32 correct_ts_overflow;
            public int32 seek2any;
            public int32 flush_packets;
            public int32 probe_score;
            public int32 format_probesize;
            public CString codec_whitelist;
            public CString format_whitelist;
            public AVFormatInternal* @internal;
            public int32 io_repositioned;
            public AVCodec* video_codec;
            public AVCodec* audio_codec;
            public AVCodec* subtitle_codec;
            public AVCodec* data_codec;
            public int32 metadata_header_padding;
            public void* opaque;
            public av_format_control_message control_message_cb;
            public long output_ts_offset;
            public byte* dump_separator;
            public AVCodecID data_codec_id;
            public FnPtr_AVFormatContextPtr_AVIOContextPtrPtr_CString_Int_AVIOInterruptCBPtr_AVDictionaryPtrPtr_Int open_cb;
            public CString protocol_whitelist;
            public FnPtr_AVFormatContextPtr_AVIOContextPtrPtr_CString_Int_AVDictionaryPtrPtr_Int io_open;
            public FnPtr_AVFormatContextPtr_AVIOContextPtr_Void io_close;
            public CString protocol_blacklist;
            public int32 max_streams;
            public int32 skip_estimate_duration_from_pts;
            public int32 max_probe_packets;
        }

        // Struct @ codec.h:425:16
        //	x86_64-pc-windows-msvc (libavcodec\codec.h)
        [CRepr]
        public struct AVCodecHWConfig
        {
            public AVPixelFormat pix_fmt;
            public int32 methods;
            public AVHWDeviceType device_type;
        }

        // Struct @ avformat.h:861:16
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [CRepr]
        public struct AVStreamInfoInternal
        {
            public long last_dts;
            public long duration_gcd;
            public int32 duration_count;
            public long rfps_duration_sum;
            public void* duration_error;
            public long codec_info_duration;
            public long codec_info_duration_fields;
            public int32 frame_delay_evidence;
            public int32 found_decoder;
            public long last_duration;
            public long fps_first_dts;
            public int32 fps_first_dts_idx;
            public long fps_last_dts;
            public int32 fps_last_dts_idx;
        }

        // Struct @ avcodec.h:448:16
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        [CRepr]
        public struct AVCPBProperties
        {
            public int32 max_bitrate;
            public int32 min_bitrate;
            public int32 avg_bitrate;
            public int32 buffer_size;
            public ulong vbv_delay;
        }

        // Struct @ avdevice.h:460:16
        //	x86_64-pc-windows-msvc (libavdevice\avdevice.h)
        [CRepr]
        public struct AVDeviceInfoList
        {
            public AVDeviceInfo** devices;
            public int32 nb_devices;
            public int32 default_device;
        }

        // Struct @ avformat.h:1260:16
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [CRepr]
        public struct AVProgram
        {
            public int32 id;
            public int32 flags;
            public AVDiscard discard;
            public uint* stream_index;
            public uint32 nb_stream_indexes;
            public AVDictionary* metadata;
            public int32 program_num;
            public int32 pmt_pid;
            public int32 pcr_pid;
            public int32 pmt_version;
            public long start_time;
            public long end_time;
            public long pts_wrap_reference;
            public int32 pts_wrap_behavior;
        }

        // Struct @ avio.h:161:16
        //	x86_64-pc-windows-msvc (libavformat\avio.h)
        [CRepr]
        public struct AVIOContext
        {
            public AVClass* av_class;
            public byte* buffer;
            public int32 buffer_size;
            public byte* buf_ptr;
            public byte* buf_end;
            public void* opaque;
            public FnPtr_VoidPtr_BytePtr_Int_Int read_packet;
            public FnPtr_VoidPtr_BytePtr_Int_Int write_packet;
            public FnPtr_VoidPtr_Long_Int_Long seek;
            public long pos;
            public int32 eof_reached;
            public int32 write_flag;
            public int32 max_packet_size;
            public uint32 checksum;
            public byte* checksum_ptr;
            public FnPtr_Uint_BytePtr_Uint_Uint update_checksum;
            public int32 error;
            public FnPtr_VoidPtr_Int_Int read_pause;
            public FnPtr_VoidPtr_Int_Long_Int_Long read_seek;
            public int32 seekable;
            public long maxsize;
            public int32 direct;
            public long bytes_read;
            public int32 seek_count;
            public int32 writeout_count;
            public int32 orig_buffer_size;
            public int32 short_seek_threshold;
            public CString protocol_whitelist;
            public CString protocol_blacklist;
            public FnPtr_VoidPtr_BytePtr_Int_AVIODataMarkerType_Long_Int write_data_type;
            public int32 ignore_boundary_point;
            public AVIODataMarkerType current_type;
            public long last_time;
            public FnPtr_VoidPtr_Int short_seek_get;
            public long written;
            public byte* buf_ptr_max;
            public int32 min_packet_size;
        }

        // Struct @ hwcontext.h:453:16
        //	x86_64-pc-windows-msvc (libavutil\hwcontext.h)
        [CRepr]
        public struct AVHWFramesConstraints
        {
            public AVPixelFormat* valid_hw_formats;
            public AVPixelFormat* valid_sw_formats;
            public int32 min_width;
            public int32 min_height;
            public int32 max_width;
            public int32 max_height;
        }

        // Struct @ avformat.h:896:16
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [CRepr]
        public struct AVStream
        {
            public int32 index;
            public int32 id;
            public AVCodecContext* codec;
            public void* priv_data;
            public AVRational time_base;
            public long start_time;
            public long duration;
            public long nb_frames;
            public int32 disposition;
            public AVDiscard discard;
            public AVRational sample_aspect_ratio;
            public AVDictionary* metadata;
            public AVRational avg_frame_rate;
            public AVPacket attached_pic;
            public AVPacketSideData* side_data;
            public int32 nb_side_data;
            public int32 event_flags;
            public AVRational r_frame_rate;
            public CString recommended_encoder_configuration;
            public AVCodecParameters* codecpar;
            public AVStreamInfoInternal* info;
            public int32 pts_wrap_bits;
            public long first_dts;
            public long cur_dts;
            public long last_IP_pts;
            public int32 last_IP_duration;
            public int32 probe_packets;
            public int32 codec_info_nb_frames;
            public AVStreamParseType need_parsing;
            public AVCodecParserContext* parser;
            public AVPacketList* last_in_packet_buffer;
            public AVProbeData probe_data;
            public byte[136] _pts_buffer; // int64_t[17]

            public Span<long> pts_buffer
            {
                get mut
                {
                    var pointer = &_pts_buffer[0];
                    var span = Span<long>((.)pointer, 17);
                    return span;
                }
            }

            public AVIndexEntry* index_entries;
            public int32 nb_index_entries;
            public uint32 index_entries_allocated_size;
            public int32 stream_identifier;
            public int32 program_num;
            public int32 pmt_version;
            public int32 pmt_stream_idx;
            public long interleaver_chunk_size;
            public long interleaver_chunk_duration;
            public int32 request_probe;
            public int32 skip_to_keyframe;
            public int32 skip_samples;
            public long start_skip_samples;
            public long first_discard_sample;
            public long last_discard_sample;
            public int32 nb_decoded_frames;
            public long mux_ts_offset;
            public long pts_wrap_reference;
            public int32 pts_wrap_behavior;
            public int32 update_initial_durations_done;
            public byte[136] _pts_reorder_error; // int64_t[17]

            public Span<long> pts_reorder_error
            {
                get mut
                {
                    var pointer = &_pts_reorder_error[0];
                    var span = Span<long>((.)pointer, 17);
                    return span;
                }
            }

            public byte[17] _pts_reorder_error_count; // uint8_t[17]

            public Span<byte> pts_reorder_error_count
            {
                get mut
                {
                    var pointer = &_pts_reorder_error_count[0];
                    var span = Span<byte>((.)pointer, 17);
                    return span;
                }
            }

            public long last_dts_for_order_check;
            public byte dts_ordered;
            public byte dts_misordered;
            public int32 inject_global_side_data;
            public AVRational display_aspect_ratio;
            public AVStreamInternal* @internal;
        }

        // Struct @ avio.h:86:16
        //	x86_64-pc-windows-msvc (libavformat\avio.h)
        [CRepr]
        public struct AVIODirEntry
        {
            public CString name;
            public int32 type;
            public int32 utf8;
            public long size;
            public long modification_timestamp;
            public long access_timestamp;
            public long status_change_timestamp;
            public long user_id;
            public long group_id;
            public long filemode;
        }

        // Struct @ opt.h:331:16
        //	x86_64-pc-windows-msvc (libavutil\opt.h)
        [CRepr]
        public struct AVOptionRanges
        {
            public AVOptionRange** range;
            public int32 nb_ranges;
            public int32 nb_components;
        }

        // Struct @ avcodec.h:3353:16
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        [CRepr]
        public struct AVCodecParserContext
        {
            public void* priv_data;
            public AVCodecParser* parser;
            public long frame_offset;
            public long cur_offset;
            public long next_frame_offset;
            public int32 pict_type;
            public int32 repeat_pict;
            public long pts;
            public long dts;
            public long last_pts;
            public long last_dts;
            public int32 fetch_timestamp;
            public int32 cur_frame_start_index;
            public byte[32] _cur_frame_offset; // int64_t[4]

            public Span<long> cur_frame_offset
            {
                get mut
                {
                    var pointer = &_cur_frame_offset[0];
                    var span = Span<long>((.)pointer, 4);
                    return span;
                }
            }

            public byte[32] _cur_frame_pts; // int64_t[4]

            public Span<long> cur_frame_pts
            {
                get mut
                {
                    var pointer = &_cur_frame_pts[0];
                    var span = Span<long>((.)pointer, 4);
                    return span;
                }
            }

            public byte[32] _cur_frame_dts; // int64_t[4]

            public Span<long> cur_frame_dts
            {
                get mut
                {
                    var pointer = &_cur_frame_dts[0];
                    var span = Span<long>((.)pointer, 4);
                    return span;
                }
            }

            public int32 flags;
            public long offset;
            public byte[32] _cur_frame_end; // int64_t[4]

            public Span<long> cur_frame_end
            {
                get mut
                {
                    var pointer = &_cur_frame_end[0];
                    var span = Span<long>((.)pointer, 4);
                    return span;
                }
            }

            public int32 key_frame;
            public long convergence_duration;
            public int32 dts_sync_point;
            public int32 dts_ref_dts_delta;
            public int32 pts_dts_delta;
            public byte[32] _cur_frame_pos; // int64_t[4]

            public Span<long> cur_frame_pos
            {
                get mut
                {
                    var pointer = &_cur_frame_pos[0];
                    var span = Span<long>((.)pointer, 4);
                    return span;
                }
            }

            public long pos;
            public long last_pos;
            public int32 duration;
            public AVFieldOrder field_order;
            public AVPictureStructure picture_structure;
            public int32 output_picture_number;
            public int32 width;
            public int32 height;
            public int32 coded_width;
            public int32 coded_height;
            public int32 format;
        }

        // Struct @ packet.h:298:16
        //	x86_64-pc-windows-msvc (libavcodec\packet.h)
        [CRepr]
        public struct AVPacketSideData
        {
            public byte* data;
            public int32 size;
            public AVPacketSideDataType type;
        }

        // Struct @ avcodec.h:3975:16
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        [CRepr]
        public struct AVBitStreamFilterContext
        {
            public void* priv_data;
            public AVBitStreamFilter* filter;
            public AVCodecParserContext* parser;
            public AVBitStreamFilterContext* next;
            public CString args;
        }

        // Struct @ avio.h:58:16
        //	x86_64-pc-windows-msvc (libavformat\avio.h)
        [CRepr]
        public struct AVIOInterruptCB
        {
            public FnPtr_VoidPtr_Int callback;
            public void* opaque;
        }

        // Struct @ packet.h:332:16
        //	x86_64-pc-windows-msvc (libavcodec\packet.h)
        [CRepr]
        public struct AVPacket
        {
            public AVBufferRef* buf;
            public long pts;
            public long dts;
            public byte* data;
            public int32 size;
            public int32 stream_index;
            public int32 flags;
            public AVPacketSideData* side_data;
            public int32 side_data_elems;
            public long duration;
            public long pos;
            public long convergence_duration;
        }

        // OpaqueType @ avformat.h:436:8
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [CRepr]
        public struct AVCodecTag
        {
        }

        // OpaqueType @ avformat.h:1322:33
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [CRepr]
        public struct AVFormatInternal
        {
        }

        // OpaqueType @ buffer.h:73:25
        //	x86_64-pc-windows-msvc (libavutil\buffer.h)
        [CRepr]
        public struct AVBuffer
        {
        }

        // OpaqueType @ avcodec.h:511:8
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        [CRepr]
        public struct AVCodecInternal
        {
        }

        // OpaqueType @ buffer.h:238:29
        //	x86_64-pc-windows-msvc (libavutil\buffer.h)
        [CRepr]
        public struct AVBufferPool
        {
        }

        // OpaqueType @ channel_layout.h:167:8
        //	x86_64-pc-windows-msvc (libavutil\channel_layout.h)
        [CRepr]
        public struct AVBPrint
        {
        }

        // OpaqueType @ bsf.h:240:26
        //	x86_64-pc-windows-msvc (libavcodec\bsf.h)
        [CRepr]
        public struct AVBSFList
        {
        }

        // OpaqueType @ swscale.h:122:8
        //	x86_64-pc-windows-msvc (libswscale\swscale.h)
        [CRepr]
        public struct SwsContext
        {
        }

        // OpaqueType @ codec.h:181:31
        //	x86_64-pc-windows-msvc (libavcodec\codec.h)
        [CRepr]
        public struct AVCodecDefault
        {
        }

        // OpaqueType @ bsf.h:37:30
        //	x86_64-pc-windows-msvc (libavcodec\bsf.h)
        [CRepr]
        public struct AVBSFInternal
        {
        }

        // OpaqueType @ avcodec.h:2400:8
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        [CRepr]
        public struct MpegEncContext
        {
        }

        // OpaqueType @ avformat.h:842:33
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [CRepr]
        public struct AVStreamInternal
        {
        }

        // OpaqueType @ codec.h:325:18
        //	x86_64-pc-windows-msvc (libavcodec\codec.h)
        [CRepr]
        public struct AVCodecHWConfigInternal
        {
        }

        // OpaqueType @ avio.h:104:12
        //	x86_64-pc-windows-msvc (libavformat\avio.h)
        [CRepr]
        public struct URLContext
        {
        }

        // OpaqueType @ dict.h:86:29
        //	x86_64-pc-windows-msvc (libavutil\dict.h)
        [CRepr]
        public struct AVDictionary
        {
        }

        // TypeAlias @ avformat.h:1306:15
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [CRepr]
        public struct av_format_control_message
        {
            public FnPtr_AVFormatContextPtr_Int_VoidPtr_Ulong_Int Data;
            public static implicit operator FnPtr_AVFormatContextPtr_Int_VoidPtr_Ulong_Int(av_format_control_message data) => data.Data;
            public static implicit operator av_format_control_message(FnPtr_AVFormatContextPtr_Int_VoidPtr_Ulong_Int data) => .() { Data = data };
        }

        // TypeAlias @ avformat.h:1309:15
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        [CRepr]
        public struct AVOpenCallback
        {
            public FnPtr_AVFormatContextPtr_AVIOContextPtrPtr_CString_Int_AVIOInterruptCBPtr_AVDictionaryPtrPtr_Int Data;
            public static implicit operator FnPtr_AVFormatContextPtr_AVIOContextPtrPtr_CString_Int_AVIOInterruptCBPtr_AVDictionaryPtrPtr_Int(AVOpenCallback data) => data.Data;
            public static implicit operator AVOpenCallback(FnPtr_AVFormatContextPtr_AVIOContextPtrPtr_CString_Int_AVIOInterruptCBPtr_AVDictionaryPtrPtr_Int data) => .() { Data = data };
        }

        // Enum @ avdevice.h:198:6
        //	x86_64-pc-windows-msvc (libavdevice\avdevice.h)
        public enum AVDevToAppMessageType : int32
        {
            AV_DEV_TO_APP_NONE = 1313820229,
            AV_DEV_TO_APP_CREATE_WINDOW_BUFFER = 1111708229,
            AV_DEV_TO_APP_PREPARE_WINDOW_BUFFER = 1112560197,
            AV_DEV_TO_APP_DISPLAY_WINDOW_BUFFER = 1111771475,
            AV_DEV_TO_APP_DESTROY_WINDOW_BUFFER = 1111770451,
            AV_DEV_TO_APP_BUFFER_OVERFLOW = 1112491596,
            AV_DEV_TO_APP_BUFFER_UNDERFLOW = 1112884812,
            AV_DEV_TO_APP_BUFFER_READABLE = 1112687648,
            AV_DEV_TO_APP_BUFFER_WRITABLE = 1113018912,
            AV_DEV_TO_APP_MUTE_STATE_CHANGED = 1129141588,
            AV_DEV_TO_APP_VOLUME_LEVEL_CHANGED = 1129729868
        }

        // Enum @ avformat.h:3060:6
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        public enum AVTimebaseSource : int32
        {
            AVFMT_TBCF_AUTO = -1,
            AVFMT_TBCF_DECODER = 0,
            AVFMT_TBCF_DEMUXER = 1,
            AVFMT_TBCF_R_FRAMERATE = 2
        }

        // Enum @ avio.h:111:6
        //	x86_64-pc-windows-msvc (libavformat\avio.h)
        public enum AVIODataMarkerType : int32
        {
            AVIO_DATA_MARKER_HEADER = 0,
            AVIO_DATA_MARKER_SYNC_POINT = 1,
            AVIO_DATA_MARKER_BOUNDARY_POINT = 2,
            AVIO_DATA_MARKER_UNKNOWN = 3,
            AVIO_DATA_MARKER_TRAILER = 4,
            AVIO_DATA_MARKER_FLUSH_POINT = 5
        }

        // Enum @ samplefmt.h:58:6
        //	x86_64-pc-windows-msvc (libavutil\samplefmt.h)
        public enum AVSampleFormat : int32
        {
            AV_SAMPLE_FMT_NONE = -1,
            AV_SAMPLE_FMT_U8 = 0,
            AV_SAMPLE_FMT_S16 = 1,
            AV_SAMPLE_FMT_S32 = 2,
            AV_SAMPLE_FMT_FLT = 3,
            AV_SAMPLE_FMT_DBL = 4,
            AV_SAMPLE_FMT_U8P = 5,
            AV_SAMPLE_FMT_S16P = 6,
            AV_SAMPLE_FMT_S32P = 7,
            AV_SAMPLE_FMT_FLTP = 8,
            AV_SAMPLE_FMT_DBLP = 9,
            AV_SAMPLE_FMT_S64 = 10,
            AV_SAMPLE_FMT_S64P = 11,
            AV_SAMPLE_FMT_NB = 12
        }

        // Enum @ mathematics.h:79:6
        //	x86_64-pc-windows-msvc (libavutil\mathematics.h)
        public enum AVRounding : int32
        {
            AV_ROUND_ZERO = 0,
            AV_ROUND_INF = 1,
            AV_ROUND_DOWN = 2,
            AV_ROUND_UP = 3,
            AV_ROUND_NEAR_INF = 5,
            AV_ROUND_PASS_MINMAX = 8192
        }

        // Enum @ frame.h:48:6
        //	x86_64-pc-windows-msvc (libavutil\frame.h)
        public enum AVFrameSideDataType : int32
        {
            AV_FRAME_DATA_PANSCAN = 0,
            AV_FRAME_DATA_A53_CC = 1,
            AV_FRAME_DATA_STEREO3D = 2,
            AV_FRAME_DATA_MATRIXENCODING = 3,
            AV_FRAME_DATA_DOWNMIX_INFO = 4,
            AV_FRAME_DATA_REPLAYGAIN = 5,
            AV_FRAME_DATA_DISPLAYMATRIX = 6,
            AV_FRAME_DATA_AFD = 7,
            AV_FRAME_DATA_MOTION_VECTORS = 8,
            AV_FRAME_DATA_SKIP_SAMPLES = 9,
            AV_FRAME_DATA_AUDIO_SERVICE_TYPE = 10,
            AV_FRAME_DATA_MASTERING_DISPLAY_METADATA = 11,
            AV_FRAME_DATA_GOP_TIMECODE = 12,
            AV_FRAME_DATA_SPHERICAL = 13,
            AV_FRAME_DATA_CONTENT_LIGHT_LEVEL = 14,
            AV_FRAME_DATA_ICC_PROFILE = 15,
            AV_FRAME_DATA_QP_TABLE_PROPERTIES = 16,
            AV_FRAME_DATA_QP_TABLE_DATA = 17,
            AV_FRAME_DATA_S12M_TIMECODE = 18,
            AV_FRAME_DATA_DYNAMIC_HDR_PLUS = 19,
            AV_FRAME_DATA_REGIONS_OF_INTEREST = 20,
            AV_FRAME_DATA_VIDEO_ENC_PARAMS = 21
        }

        // Enum @ avcodec.h:2639:6
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public enum AVSubtitleType : int32
        {
            SUBTITLE_NONE = 0,
            SUBTITLE_BITMAP = 1,
            SUBTITLE_TEXT = 2,
            SUBTITLE_ASS = 3
        }

        // Enum @ codec_par.h:36:6
        //	x86_64-pc-windows-msvc (libavcodec\codec_par.h)
        public enum AVFieldOrder : int32
        {
            AV_FIELD_UNKNOWN = 0,
            AV_FIELD_PROGRESSIVE = 1,
            AV_FIELD_TT = 2,
            AV_FIELD_BB = 3,
            AV_FIELD_TB = 4,
            AV_FIELD_BT = 5
        }

        // Enum @ avformat.h:1316:6
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        public enum AVDurationEstimationMethod : int32
        {
            AVFMT_DURATION_FROM_PTS = 0,
            AVFMT_DURATION_FROM_STREAM = 1,
            AVFMT_DURATION_FROM_BITRATE = 2
        }

        // Enum @ log.h:29:9
        //	x86_64-pc-windows-msvc (libavutil\log.h)
        public enum AVClassCategory : int32
        {
            AV_CLASS_CATEGORY_NA = 0,
            AV_CLASS_CATEGORY_INPUT = 1,
            AV_CLASS_CATEGORY_OUTPUT = 2,
            AV_CLASS_CATEGORY_MUXER = 3,
            AV_CLASS_CATEGORY_DEMUXER = 4,
            AV_CLASS_CATEGORY_ENCODER = 5,
            AV_CLASS_CATEGORY_DECODER = 6,
            AV_CLASS_CATEGORY_FILTER = 7,
            AV_CLASS_CATEGORY_BITSTREAM_FILTER = 8,
            AV_CLASS_CATEGORY_SWSCALER = 9,
            AV_CLASS_CATEGORY_SWRESAMPLER = 10,
            AV_CLASS_CATEGORY_DEVICE_VIDEO_OUTPUT = 40,
            AV_CLASS_CATEGORY_DEVICE_VIDEO_INPUT = 41,
            AV_CLASS_CATEGORY_DEVICE_AUDIO_OUTPUT = 42,
            AV_CLASS_CATEGORY_DEVICE_AUDIO_INPUT = 43,
            AV_CLASS_CATEGORY_DEVICE_OUTPUT = 44,
            AV_CLASS_CATEGORY_DEVICE_INPUT = 45,
            AV_CLASS_CATEGORY_NB = 46
        }

        // Enum @ avformat.h:784:6
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        public enum AVStreamParseType : int32
        {
            AVSTREAM_PARSE_NONE = 0,
            AVSTREAM_PARSE_FULL = 1,
            AVSTREAM_PARSE_HEADERS = 2,
            AVSTREAM_PARSE_TIMESTAMPS = 3,
            AVSTREAM_PARSE_FULL_ONCE = 4,
            AVSTREAM_PARSE_FULL_RAW = 5
        }

        // Enum @ opt.h:221:6
        //	x86_64-pc-windows-msvc (libavutil\opt.h)
        public enum AVOptionType : int32
        {
            AV_OPT_TYPE_FLAGS = 0,
            AV_OPT_TYPE_INT = 1,
            AV_OPT_TYPE_INT64 = 2,
            AV_OPT_TYPE_DOUBLE = 3,
            AV_OPT_TYPE_FLOAT = 4,
            AV_OPT_TYPE_STRING = 5,
            AV_OPT_TYPE_RATIONAL = 6,
            AV_OPT_TYPE_BINARY = 7,
            AV_OPT_TYPE_DICT = 8,
            AV_OPT_TYPE_UINT64 = 9,
            AV_OPT_TYPE_CONST = 10,
            AV_OPT_TYPE_IMAGE_SIZE = 11,
            AV_OPT_TYPE_PIXEL_FMT = 12,
            AV_OPT_TYPE_SAMPLE_FMT = 13,
            AV_OPT_TYPE_VIDEO_RATE = 14,
            AV_OPT_TYPE_DURATION = 15,
            AV_OPT_TYPE_COLOR = 16,
            AV_OPT_TYPE_CHANNEL_LAYOUT = 17,
            AV_OPT_TYPE_BOOL = 18
        }

        // Enum @ pixfmt.h:64:6
        //	x86_64-pc-windows-msvc (libavutil\pixfmt.h)
		[AllowDuplicates]
        public enum AVPixelFormat : int32
        {
            AV_PIX_FMT_NONE = -1,
            AV_PIX_FMT_YUV420P = 0,
            AV_PIX_FMT_YUYV422 = 1,
            AV_PIX_FMT_RGB24 = 2,
            AV_PIX_FMT_BGR24 = 3,
            AV_PIX_FMT_YUV422P = 4,
            AV_PIX_FMT_YUV444P = 5,
            AV_PIX_FMT_YUV410P = 6,
            AV_PIX_FMT_YUV411P = 7,
            AV_PIX_FMT_GRAY8 = 8,
            AV_PIX_FMT_MONOWHITE = 9,
            AV_PIX_FMT_MONOBLACK = 10,
            AV_PIX_FMT_PAL8 = 11,
            AV_PIX_FMT_YUVJ420P = 12,
            AV_PIX_FMT_YUVJ422P = 13,
            AV_PIX_FMT_YUVJ444P = 14,
            AV_PIX_FMT_UYVY422 = 15,
            AV_PIX_FMT_UYYVYY411 = 16,
            AV_PIX_FMT_BGR8 = 17,
            AV_PIX_FMT_BGR4 = 18,
            AV_PIX_FMT_BGR4_BYTE = 19,
            AV_PIX_FMT_RGB8 = 20,
            AV_PIX_FMT_RGB4 = 21,
            AV_PIX_FMT_RGB4_BYTE = 22,
            AV_PIX_FMT_NV12 = 23,
            AV_PIX_FMT_NV21 = 24,
            AV_PIX_FMT_ARGB = 25,
            AV_PIX_FMT_RGBA = 26,
            AV_PIX_FMT_ABGR = 27,
            AV_PIX_FMT_BGRA = 28,
            AV_PIX_FMT_GRAY16BE = 29,
            AV_PIX_FMT_GRAY16LE = 30,
            AV_PIX_FMT_YUV440P = 31,
            AV_PIX_FMT_YUVJ440P = 32,
            AV_PIX_FMT_YUVA420P = 33,
            AV_PIX_FMT_RGB48BE = 34,
            AV_PIX_FMT_RGB48LE = 35,
            AV_PIX_FMT_RGB565BE = 36,
            AV_PIX_FMT_RGB565LE = 37,
            AV_PIX_FMT_RGB555BE = 38,
            AV_PIX_FMT_RGB555LE = 39,
            AV_PIX_FMT_BGR565BE = 40,
            AV_PIX_FMT_BGR565LE = 41,
            AV_PIX_FMT_BGR555BE = 42,
            AV_PIX_FMT_BGR555LE = 43,
            AV_PIX_FMT_VAAPI_MOCO = 44,
            AV_PIX_FMT_VAAPI_IDCT = 45,
            AV_PIX_FMT_VAAPI_VLD = 46,
            AV_PIX_FMT_VAAPI = 46,
            AV_PIX_FMT_YUV420P16LE = 47,
            AV_PIX_FMT_YUV420P16BE = 48,
            AV_PIX_FMT_YUV422P16LE = 49,
            AV_PIX_FMT_YUV422P16BE = 50,
            AV_PIX_FMT_YUV444P16LE = 51,
            AV_PIX_FMT_YUV444P16BE = 52,
            AV_PIX_FMT_DXVA2_VLD = 53,
            AV_PIX_FMT_RGB444LE = 54,
            AV_PIX_FMT_RGB444BE = 55,
            AV_PIX_FMT_BGR444LE = 56,
            AV_PIX_FMT_BGR444BE = 57,
            AV_PIX_FMT_YA8 = 58,
            AV_PIX_FMT_Y400A = 58,
            AV_PIX_FMT_GRAY8A = 58,
            AV_PIX_FMT_BGR48BE = 59,
            AV_PIX_FMT_BGR48LE = 60,
            AV_PIX_FMT_YUV420P9BE = 61,
            AV_PIX_FMT_YUV420P9LE = 62,
            AV_PIX_FMT_YUV420P10BE = 63,
            AV_PIX_FMT_YUV420P10LE = 64,
            AV_PIX_FMT_YUV422P10BE = 65,
            AV_PIX_FMT_YUV422P10LE = 66,
            AV_PIX_FMT_YUV444P9BE = 67,
            AV_PIX_FMT_YUV444P9LE = 68,
            AV_PIX_FMT_YUV444P10BE = 69,
            AV_PIX_FMT_YUV444P10LE = 70,
            AV_PIX_FMT_YUV422P9BE = 71,
            AV_PIX_FMT_YUV422P9LE = 72,
            AV_PIX_FMT_GBRP = 73,
            AV_PIX_FMT_GBR24P = 73,
            AV_PIX_FMT_GBRP9BE = 74,
            AV_PIX_FMT_GBRP9LE = 75,
            AV_PIX_FMT_GBRP10BE = 76,
            AV_PIX_FMT_GBRP10LE = 77,
            AV_PIX_FMT_GBRP16BE = 78,
            AV_PIX_FMT_GBRP16LE = 79,
            AV_PIX_FMT_YUVA422P = 80,
            AV_PIX_FMT_YUVA444P = 81,
            AV_PIX_FMT_YUVA420P9BE = 82,
            AV_PIX_FMT_YUVA420P9LE = 83,
            AV_PIX_FMT_YUVA422P9BE = 84,
            AV_PIX_FMT_YUVA422P9LE = 85,
            AV_PIX_FMT_YUVA444P9BE = 86,
            AV_PIX_FMT_YUVA444P9LE = 87,
            AV_PIX_FMT_YUVA420P10BE = 88,
            AV_PIX_FMT_YUVA420P10LE = 89,
            AV_PIX_FMT_YUVA422P10BE = 90,
            AV_PIX_FMT_YUVA422P10LE = 91,
            AV_PIX_FMT_YUVA444P10BE = 92,
            AV_PIX_FMT_YUVA444P10LE = 93,
            AV_PIX_FMT_YUVA420P16BE = 94,
            AV_PIX_FMT_YUVA420P16LE = 95,
            AV_PIX_FMT_YUVA422P16BE = 96,
            AV_PIX_FMT_YUVA422P16LE = 97,
            AV_PIX_FMT_YUVA444P16BE = 98,
            AV_PIX_FMT_YUVA444P16LE = 99,
            AV_PIX_FMT_VDPAU = 100,
            AV_PIX_FMT_XYZ12LE = 101,
            AV_PIX_FMT_XYZ12BE = 102,
            AV_PIX_FMT_NV16 = 103,
            AV_PIX_FMT_NV20LE = 104,
            AV_PIX_FMT_NV20BE = 105,
            AV_PIX_FMT_RGBA64BE = 106,
            AV_PIX_FMT_RGBA64LE = 107,
            AV_PIX_FMT_BGRA64BE = 108,
            AV_PIX_FMT_BGRA64LE = 109,
            AV_PIX_FMT_YVYU422 = 110,
            AV_PIX_FMT_YA16BE = 111,
            AV_PIX_FMT_YA16LE = 112,
            AV_PIX_FMT_GBRAP = 113,
            AV_PIX_FMT_GBRAP16BE = 114,
            AV_PIX_FMT_GBRAP16LE = 115,
            AV_PIX_FMT_QSV = 116,
            AV_PIX_FMT_MMAL = 117,
            AV_PIX_FMT_D3D11VA_VLD = 118,
            AV_PIX_FMT_CUDA = 119,
            AV_PIX_FMT_0RGB = 120,
            AV_PIX_FMT_RGB0 = 121,
            AV_PIX_FMT_0BGR = 122,
            AV_PIX_FMT_BGR0 = 123,
            AV_PIX_FMT_YUV420P12BE = 124,
            AV_PIX_FMT_YUV420P12LE = 125,
            AV_PIX_FMT_YUV420P14BE = 126,
            AV_PIX_FMT_YUV420P14LE = 127,
            AV_PIX_FMT_YUV422P12BE = 128,
            AV_PIX_FMT_YUV422P12LE = 129,
            AV_PIX_FMT_YUV422P14BE = 130,
            AV_PIX_FMT_YUV422P14LE = 131,
            AV_PIX_FMT_YUV444P12BE = 132,
            AV_PIX_FMT_YUV444P12LE = 133,
            AV_PIX_FMT_YUV444P14BE = 134,
            AV_PIX_FMT_YUV444P14LE = 135,
            AV_PIX_FMT_GBRP12BE = 136,
            AV_PIX_FMT_GBRP12LE = 137,
            AV_PIX_FMT_GBRP14BE = 138,
            AV_PIX_FMT_GBRP14LE = 139,
            AV_PIX_FMT_YUVJ411P = 140,
            AV_PIX_FMT_BAYER_BGGR8 = 141,
            AV_PIX_FMT_BAYER_RGGB8 = 142,
            AV_PIX_FMT_BAYER_GBRG8 = 143,
            AV_PIX_FMT_BAYER_GRBG8 = 144,
            AV_PIX_FMT_BAYER_BGGR16LE = 145,
            AV_PIX_FMT_BAYER_BGGR16BE = 146,
            AV_PIX_FMT_BAYER_RGGB16LE = 147,
            AV_PIX_FMT_BAYER_RGGB16BE = 148,
            AV_PIX_FMT_BAYER_GBRG16LE = 149,
            AV_PIX_FMT_BAYER_GBRG16BE = 150,
            AV_PIX_FMT_BAYER_GRBG16LE = 151,
            AV_PIX_FMT_BAYER_GRBG16BE = 152,
            AV_PIX_FMT_XVMC = 153,
            AV_PIX_FMT_YUV440P10LE = 154,
            AV_PIX_FMT_YUV440P10BE = 155,
            AV_PIX_FMT_YUV440P12LE = 156,
            AV_PIX_FMT_YUV440P12BE = 157,
            AV_PIX_FMT_AYUV64LE = 158,
            AV_PIX_FMT_AYUV64BE = 159,
            AV_PIX_FMT_VIDEOTOOLBOX = 160,
            AV_PIX_FMT_P010LE = 161,
            AV_PIX_FMT_P010BE = 162,
            AV_PIX_FMT_GBRAP12BE = 163,
            AV_PIX_FMT_GBRAP12LE = 164,
            AV_PIX_FMT_GBRAP10BE = 165,
            AV_PIX_FMT_GBRAP10LE = 166,
            AV_PIX_FMT_MEDIACODEC = 167,
            AV_PIX_FMT_GRAY12BE = 168,
            AV_PIX_FMT_GRAY12LE = 169,
            AV_PIX_FMT_GRAY10BE = 170,
            AV_PIX_FMT_GRAY10LE = 171,
            AV_PIX_FMT_P016LE = 172,
            AV_PIX_FMT_P016BE = 173,
            AV_PIX_FMT_D3D11 = 174,
            AV_PIX_FMT_GRAY9BE = 175,
            AV_PIX_FMT_GRAY9LE = 176,
            AV_PIX_FMT_GBRPF32BE = 177,
            AV_PIX_FMT_GBRPF32LE = 178,
            AV_PIX_FMT_GBRAPF32BE = 179,
            AV_PIX_FMT_GBRAPF32LE = 180,
            AV_PIX_FMT_DRM_PRIME = 181,
            AV_PIX_FMT_OPENCL = 182,
            AV_PIX_FMT_GRAY14BE = 183,
            AV_PIX_FMT_GRAY14LE = 184,
            AV_PIX_FMT_GRAYF32BE = 185,
            AV_PIX_FMT_GRAYF32LE = 186,
            AV_PIX_FMT_YUVA422P12BE = 187,
            AV_PIX_FMT_YUVA422P12LE = 188,
            AV_PIX_FMT_YUVA444P12BE = 189,
            AV_PIX_FMT_YUVA444P12LE = 190,
            AV_PIX_FMT_NV24 = 191,
            AV_PIX_FMT_NV42 = 192,
            AV_PIX_FMT_VULKAN = 193,
            AV_PIX_FMT_Y210BE = 194,
            AV_PIX_FMT_Y210LE = 195,
            AV_PIX_FMT_NB = 196
        }

        // Enum @ avcodec.h:4084:6
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public enum AVLockOp : int32
        {
            AV_LOCK_CREATE = 0,
            AV_LOCK_OBTAIN = 1,
            AV_LOCK_RELEASE = 2,
            AV_LOCK_DESTROY = 3
        }

        // Enum @ packet.h:40:6
        //	x86_64-pc-windows-msvc (libavcodec\packet.h)
        public enum AVPacketSideDataType : int32
        {
            AV_PKT_DATA_PALETTE = 0,
            AV_PKT_DATA_NEW_EXTRADATA = 1,
            AV_PKT_DATA_PARAM_CHANGE = 2,
            AV_PKT_DATA_H263_MB_INFO = 3,
            AV_PKT_DATA_REPLAYGAIN = 4,
            AV_PKT_DATA_DISPLAYMATRIX = 5,
            AV_PKT_DATA_STEREO3D = 6,
            AV_PKT_DATA_AUDIO_SERVICE_TYPE = 7,
            AV_PKT_DATA_QUALITY_STATS = 8,
            AV_PKT_DATA_FALLBACK_TRACK = 9,
            AV_PKT_DATA_CPB_PROPERTIES = 10,
            AV_PKT_DATA_SKIP_SAMPLES = 11,
            AV_PKT_DATA_JP_DUALMONO = 12,
            AV_PKT_DATA_STRINGS_METADATA = 13,
            AV_PKT_DATA_SUBTITLE_POSITION = 14,
            AV_PKT_DATA_MATROSKA_BLOCKADDITIONAL = 15,
            AV_PKT_DATA_WEBVTT_IDENTIFIER = 16,
            AV_PKT_DATA_WEBVTT_SETTINGS = 17,
            AV_PKT_DATA_METADATA_UPDATE = 18,
            AV_PKT_DATA_MPEGTS_STREAM_ID = 19,
            AV_PKT_DATA_MASTERING_DISPLAY_METADATA = 20,
            AV_PKT_DATA_SPHERICAL = 21,
            AV_PKT_DATA_CONTENT_LIGHT_LEVEL = 22,
            AV_PKT_DATA_A53_CC = 23,
            AV_PKT_DATA_ENCRYPTION_INIT_INFO = 24,
            AV_PKT_DATA_ENCRYPTION_INFO = 25,
            AV_PKT_DATA_AFD = 26,
            AV_PKT_DATA_PRFT = 27,
            AV_PKT_DATA_ICC_PROFILE = 28,
            AV_PKT_DATA_DOVI_CONF = 29,
            AV_PKT_DATA_NB = 30
        }

        // Enum @ avcodec.h:239:6
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public enum AVAudioServiceType : int32
        {
            AV_AUDIO_SERVICE_TYPE_MAIN = 0,
            AV_AUDIO_SERVICE_TYPE_EFFECTS = 1,
            AV_AUDIO_SERVICE_TYPE_VISUALLY_IMPAIRED = 2,
            AV_AUDIO_SERVICE_TYPE_HEARING_IMPAIRED = 3,
            AV_AUDIO_SERVICE_TYPE_DIALOGUE = 4,
            AV_AUDIO_SERVICE_TYPE_COMMENTARY = 5,
            AV_AUDIO_SERVICE_TYPE_EMERGENCY = 6,
            AV_AUDIO_SERVICE_TYPE_VOICE_OVER = 7,
            AV_AUDIO_SERVICE_TYPE_KARAOKE = 8,
            AV_AUDIO_SERVICE_TYPE_NB = 9
        }

        // Enum @ avutil.h:272:6
        //	x86_64-pc-windows-msvc (libavutil\avutil.h)
        public enum AVPictureType : int32
        {
            AV_PICTURE_TYPE_NONE = 0,
            AV_PICTURE_TYPE_I = 1,
            AV_PICTURE_TYPE_P = 2,
            AV_PICTURE_TYPE_B = 3,
            AV_PICTURE_TYPE_S = 4,
            AV_PICTURE_TYPE_SI = 5,
            AV_PICTURE_TYPE_SP = 6,
            AV_PICTURE_TYPE_BI = 7
        }

        // Enum @ pixfmt.h:455:6
        //	x86_64-pc-windows-msvc (libavutil\pixfmt.h)
		[AllowDuplicates]
        public enum AVColorPrimaries : int32
        {
            AVCOL_PRI_RESERVED0 = 0,
            AVCOL_PRI_BT709 = 1,
            AVCOL_PRI_UNSPECIFIED = 2,
            AVCOL_PRI_RESERVED = 3,
            AVCOL_PRI_BT470M = 4,
            AVCOL_PRI_BT470BG = 5,
            AVCOL_PRI_SMPTE170M = 6,
            AVCOL_PRI_SMPTE240M = 7,
            AVCOL_PRI_FILM = 8,
            AVCOL_PRI_BT2020 = 9,
            AVCOL_PRI_SMPTE428 = 10,
            AVCOL_PRI_SMPTEST428_1 = 10,
            AVCOL_PRI_SMPTE431 = 11,
            AVCOL_PRI_SMPTE432 = 12,
            AVCOL_PRI_EBU3213 = 22,
            AVCOL_PRI_JEDEC_P22 = 22,
            AVCOL_PRI_NB = 23
        }

        // Enum @ pixfmt.h:480:6
        //	x86_64-pc-windows-msvc (libavutil\pixfmt.h)
		[AllowDuplicates]
        public enum AVColorTransferCharacteristic : int32
        {
            AVCOL_TRC_RESERVED0 = 0,
            AVCOL_TRC_BT709 = 1,
            AVCOL_TRC_UNSPECIFIED = 2,
            AVCOL_TRC_RESERVED = 3,
            AVCOL_TRC_GAMMA22 = 4,
            AVCOL_TRC_GAMMA28 = 5,
            AVCOL_TRC_SMPTE170M = 6,
            AVCOL_TRC_SMPTE240M = 7,
            AVCOL_TRC_LINEAR = 8,
            AVCOL_TRC_LOG = 9,
            AVCOL_TRC_LOG_SQRT = 10,
            AVCOL_TRC_IEC61966_2_4 = 11,
            AVCOL_TRC_BT1361_ECG = 12,
            AVCOL_TRC_IEC61966_2_1 = 13,
            AVCOL_TRC_BT2020_10 = 14,
            AVCOL_TRC_BT2020_12 = 15,
            AVCOL_TRC_SMPTE2084 = 16,
            AVCOL_TRC_SMPTEST2084 = 16,
            AVCOL_TRC_SMPTE428 = 17,
            AVCOL_TRC_SMPTEST428_1 = 17,
            AVCOL_TRC_ARIB_STD_B67 = 18,
            AVCOL_TRC_NB = 19
        }

        // Enum @ pixfmt.h:532:6
        //	x86_64-pc-windows-msvc (libavutil\pixfmt.h)
        public enum AVColorRange : int32
        {
            AVCOL_RANGE_UNSPECIFIED = 0,
            AVCOL_RANGE_MPEG = 1,
            AVCOL_RANGE_JPEG = 2,
            AVCOL_RANGE_NB = 3
        }

        // Enum @ avcodec.h:3346:6
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public enum AVPictureStructure : int32
        {
            AV_PICTURE_STRUCTURE_UNKNOWN = 0,
            AV_PICTURE_STRUCTURE_TOP_FIELD = 1,
            AV_PICTURE_STRUCTURE_BOTTOM_FIELD = 2,
            AV_PICTURE_STRUCTURE_FRAME = 3
        }

        // Enum @ avcodec.h:227:6
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public enum AVDiscard : int32
        {
            AVDISCARD_NONE = -16,
            AVDISCARD_DEFAULT = 0,
            AVDISCARD_NONREF = 8,
            AVDISCARD_BIDIR = 16,
            AVDISCARD_NONINTRA = 24,
            AVDISCARD_NONKEY = 32,
            AVDISCARD_ALL = 48
        }

        // Enum @ avutil.h:199:6
        //	x86_64-pc-windows-msvc (libavutil\avutil.h)
        public enum AVMediaType : int32
        {
            AVMEDIA_TYPE_UNKNOWN = -1,
            AVMEDIA_TYPE_VIDEO = 0,
            AVMEDIA_TYPE_AUDIO = 1,
            AVMEDIA_TYPE_DATA = 2,
            AVMEDIA_TYPE_SUBTITLE = 3,
            AVMEDIA_TYPE_ATTACHMENT = 4,
            AVMEDIA_TYPE_NB = 5
        }

        // Enum @ avdevice.h:119:6
        //	x86_64-pc-windows-msvc (libavdevice\avdevice.h)
        public enum AVAppToDevMessageType : int32
        {
            AV_APP_TO_DEV_NONE = 1313820229,
            AV_APP_TO_DEV_WINDOW_SIZE = 1195724621,
            AV_APP_TO_DEV_WINDOW_REPAINT = 1380274241,
            AV_APP_TO_DEV_PAUSE = 1346458912,
            AV_APP_TO_DEV_PLAY = 1347174745,
            AV_APP_TO_DEV_TOGGLE_PAUSE = 1346458964,
            AV_APP_TO_DEV_SET_VOLUME = 1398165324,
            AV_APP_TO_DEV_MUTE = 541939028,
            AV_APP_TO_DEV_UNMUTE = 1431131476,
            AV_APP_TO_DEV_TOGGLE_MUTE = 1414354260,
            AV_APP_TO_DEV_GET_VOLUME = 1196838732,
            AV_APP_TO_DEV_GET_MUTE = 1196250452
        }

        // Enum @ hwcontext.h:415:6
        //	x86_64-pc-windows-msvc (libavutil\hwcontext.h)
        public enum AVHWFrameTransferDirection : int32
        {
            AV_HWFRAME_TRANSFER_DIRECTION_FROM = 0,
            AV_HWFRAME_TRANSFER_DIRECTION_TO = 1
        }

        // Enum @ pixfmt.h:554:6
        //	x86_64-pc-windows-msvc (libavutil\pixfmt.h)
        public enum AVChromaLocation : int32
        {
            AVCHROMA_LOC_UNSPECIFIED = 0,
            AVCHROMA_LOC_LEFT = 1,
            AVCHROMA_LOC_CENTER = 2,
            AVCHROMA_LOC_TOPLEFT = 3,
            AVCHROMA_LOC_TOP = 4,
            AVCHROMA_LOC_BOTTOMLEFT = 5,
            AVCHROMA_LOC_BOTTOM = 6,
            AVCHROMA_LOC_NB = 7
        }

        // Enum @ codec_id.h:46:6
        //	x86_64-pc-windows-msvc (libavcodec\codec_id.h)
		[AllowDuplicates]
        public enum AVCodecID : int32
        {
            AV_CODEC_ID_NONE = 0,
            AV_CODEC_ID_MPEG1VIDEO = 1,
            AV_CODEC_ID_MPEG2VIDEO = 2,
            AV_CODEC_ID_H261 = 3,
            AV_CODEC_ID_H263 = 4,
            AV_CODEC_ID_RV10 = 5,
            AV_CODEC_ID_RV20 = 6,
            AV_CODEC_ID_MJPEG = 7,
            AV_CODEC_ID_MJPEGB = 8,
            AV_CODEC_ID_LJPEG = 9,
            AV_CODEC_ID_SP5X = 10,
            AV_CODEC_ID_JPEGLS = 11,
            AV_CODEC_ID_MPEG4 = 12,
            AV_CODEC_ID_RAWVIDEO = 13,
            AV_CODEC_ID_MSMPEG4V1 = 14,
            AV_CODEC_ID_MSMPEG4V2 = 15,
            AV_CODEC_ID_MSMPEG4V3 = 16,
            AV_CODEC_ID_WMV1 = 17,
            AV_CODEC_ID_WMV2 = 18,
            AV_CODEC_ID_H263P = 19,
            AV_CODEC_ID_H263I = 20,
            AV_CODEC_ID_FLV1 = 21,
            AV_CODEC_ID_SVQ1 = 22,
            AV_CODEC_ID_SVQ3 = 23,
            AV_CODEC_ID_DVVIDEO = 24,
            AV_CODEC_ID_HUFFYUV = 25,
            AV_CODEC_ID_CYUV = 26,
            AV_CODEC_ID_H264 = 27,
            AV_CODEC_ID_INDEO3 = 28,
            AV_CODEC_ID_VP3 = 29,
            AV_CODEC_ID_THEORA = 30,
            AV_CODEC_ID_ASV1 = 31,
            AV_CODEC_ID_ASV2 = 32,
            AV_CODEC_ID_FFV1 = 33,
            AV_CODEC_ID_4XM = 34,
            AV_CODEC_ID_VCR1 = 35,
            AV_CODEC_ID_CLJR = 36,
            AV_CODEC_ID_MDEC = 37,
            AV_CODEC_ID_ROQ = 38,
            AV_CODEC_ID_INTERPLAY_VIDEO = 39,
            AV_CODEC_ID_XAN_WC3 = 40,
            AV_CODEC_ID_XAN_WC4 = 41,
            AV_CODEC_ID_RPZA = 42,
            AV_CODEC_ID_CINEPAK = 43,
            AV_CODEC_ID_WS_VQA = 44,
            AV_CODEC_ID_MSRLE = 45,
            AV_CODEC_ID_MSVIDEO1 = 46,
            AV_CODEC_ID_IDCIN = 47,
            AV_CODEC_ID_8BPS = 48,
            AV_CODEC_ID_SMC = 49,
            AV_CODEC_ID_FLIC = 50,
            AV_CODEC_ID_TRUEMOTION1 = 51,
            AV_CODEC_ID_VMDVIDEO = 52,
            AV_CODEC_ID_MSZH = 53,
            AV_CODEC_ID_ZLIB = 54,
            AV_CODEC_ID_QTRLE = 55,
            AV_CODEC_ID_TSCC = 56,
            AV_CODEC_ID_ULTI = 57,
            AV_CODEC_ID_QDRAW = 58,
            AV_CODEC_ID_VIXL = 59,
            AV_CODEC_ID_QPEG = 60,
            AV_CODEC_ID_PNG = 61,
            AV_CODEC_ID_PPM = 62,
            AV_CODEC_ID_PBM = 63,
            AV_CODEC_ID_PGM = 64,
            AV_CODEC_ID_PGMYUV = 65,
            AV_CODEC_ID_PAM = 66,
            AV_CODEC_ID_FFVHUFF = 67,
            AV_CODEC_ID_RV30 = 68,
            AV_CODEC_ID_RV40 = 69,
            AV_CODEC_ID_VC1 = 70,
            AV_CODEC_ID_WMV3 = 71,
            AV_CODEC_ID_LOCO = 72,
            AV_CODEC_ID_WNV1 = 73,
            AV_CODEC_ID_AASC = 74,
            AV_CODEC_ID_INDEO2 = 75,
            AV_CODEC_ID_FRAPS = 76,
            AV_CODEC_ID_TRUEMOTION2 = 77,
            AV_CODEC_ID_BMP = 78,
            AV_CODEC_ID_CSCD = 79,
            AV_CODEC_ID_MMVIDEO = 80,
            AV_CODEC_ID_ZMBV = 81,
            AV_CODEC_ID_AVS = 82,
            AV_CODEC_ID_SMACKVIDEO = 83,
            AV_CODEC_ID_NUV = 84,
            AV_CODEC_ID_KMVC = 85,
            AV_CODEC_ID_FLASHSV = 86,
            AV_CODEC_ID_CAVS = 87,
            AV_CODEC_ID_JPEG2000 = 88,
            AV_CODEC_ID_VMNC = 89,
            AV_CODEC_ID_VP5 = 90,
            AV_CODEC_ID_VP6 = 91,
            AV_CODEC_ID_VP6F = 92,
            AV_CODEC_ID_TARGA = 93,
            AV_CODEC_ID_DSICINVIDEO = 94,
            AV_CODEC_ID_TIERTEXSEQVIDEO = 95,
            AV_CODEC_ID_TIFF = 96,
            AV_CODEC_ID_GIF = 97,
            AV_CODEC_ID_DXA = 98,
            AV_CODEC_ID_DNXHD = 99,
            AV_CODEC_ID_THP = 100,
            AV_CODEC_ID_SGI = 101,
            AV_CODEC_ID_C93 = 102,
            AV_CODEC_ID_BETHSOFTVID = 103,
            AV_CODEC_ID_PTX = 104,
            AV_CODEC_ID_TXD = 105,
            AV_CODEC_ID_VP6A = 106,
            AV_CODEC_ID_AMV = 107,
            AV_CODEC_ID_VB = 108,
            AV_CODEC_ID_PCX = 109,
            AV_CODEC_ID_SUNRAST = 110,
            AV_CODEC_ID_INDEO4 = 111,
            AV_CODEC_ID_INDEO5 = 112,
            AV_CODEC_ID_MIMIC = 113,
            AV_CODEC_ID_RL2 = 114,
            AV_CODEC_ID_ESCAPE124 = 115,
            AV_CODEC_ID_DIRAC = 116,
            AV_CODEC_ID_BFI = 117,
            AV_CODEC_ID_CMV = 118,
            AV_CODEC_ID_MOTIONPIXELS = 119,
            AV_CODEC_ID_TGV = 120,
            AV_CODEC_ID_TGQ = 121,
            AV_CODEC_ID_TQI = 122,
            AV_CODEC_ID_AURA = 123,
            AV_CODEC_ID_AURA2 = 124,
            AV_CODEC_ID_V210X = 125,
            AV_CODEC_ID_TMV = 126,
            AV_CODEC_ID_V210 = 127,
            AV_CODEC_ID_DPX = 128,
            AV_CODEC_ID_MAD = 129,
            AV_CODEC_ID_FRWU = 130,
            AV_CODEC_ID_FLASHSV2 = 131,
            AV_CODEC_ID_CDGRAPHICS = 132,
            AV_CODEC_ID_R210 = 133,
            AV_CODEC_ID_ANM = 134,
            AV_CODEC_ID_BINKVIDEO = 135,
            AV_CODEC_ID_IFF_ILBM = 136,
            AV_CODEC_ID_KGV1 = 137,
            AV_CODEC_ID_YOP = 138,
            AV_CODEC_ID_VP8 = 139,
            AV_CODEC_ID_PICTOR = 140,
            AV_CODEC_ID_ANSI = 141,
            AV_CODEC_ID_A64_MULTI = 142,
            AV_CODEC_ID_A64_MULTI5 = 143,
            AV_CODEC_ID_R10K = 144,
            AV_CODEC_ID_MXPEG = 145,
            AV_CODEC_ID_LAGARITH = 146,
            AV_CODEC_ID_PRORES = 147,
            AV_CODEC_ID_JV = 148,
            AV_CODEC_ID_DFA = 149,
            AV_CODEC_ID_WMV3IMAGE = 150,
            AV_CODEC_ID_VC1IMAGE = 151,
            AV_CODEC_ID_UTVIDEO = 152,
            AV_CODEC_ID_BMV_VIDEO = 153,
            AV_CODEC_ID_VBLE = 154,
            AV_CODEC_ID_DXTORY = 155,
            AV_CODEC_ID_V410 = 156,
            AV_CODEC_ID_XWD = 157,
            AV_CODEC_ID_CDXL = 158,
            AV_CODEC_ID_XBM = 159,
            AV_CODEC_ID_ZEROCODEC = 160,
            AV_CODEC_ID_MSS1 = 161,
            AV_CODEC_ID_MSA1 = 162,
            AV_CODEC_ID_TSCC2 = 163,
            AV_CODEC_ID_MTS2 = 164,
            AV_CODEC_ID_CLLC = 165,
            AV_CODEC_ID_MSS2 = 166,
            AV_CODEC_ID_VP9 = 167,
            AV_CODEC_ID_AIC = 168,
            AV_CODEC_ID_ESCAPE130 = 169,
            AV_CODEC_ID_G2M = 170,
            AV_CODEC_ID_WEBP = 171,
            AV_CODEC_ID_HNM4_VIDEO = 172,
            AV_CODEC_ID_HEVC = 173,
            AV_CODEC_ID_FIC = 174,
            AV_CODEC_ID_ALIAS_PIX = 175,
            AV_CODEC_ID_BRENDER_PIX = 176,
            AV_CODEC_ID_PAF_VIDEO = 177,
            AV_CODEC_ID_EXR = 178,
            AV_CODEC_ID_VP7 = 179,
            AV_CODEC_ID_SANM = 180,
            AV_CODEC_ID_SGIRLE = 181,
            AV_CODEC_ID_MVC1 = 182,
            AV_CODEC_ID_MVC2 = 183,
            AV_CODEC_ID_HQX = 184,
            AV_CODEC_ID_TDSC = 185,
            AV_CODEC_ID_HQ_HQA = 186,
            AV_CODEC_ID_HAP = 187,
            AV_CODEC_ID_DDS = 188,
            AV_CODEC_ID_DXV = 189,
            AV_CODEC_ID_SCREENPRESSO = 190,
            AV_CODEC_ID_RSCC = 191,
            AV_CODEC_ID_AVS2 = 192,
            AV_CODEC_ID_Y41P = 32768,
            AV_CODEC_ID_AVRP = 32769,
            AV_CODEC_ID_012V = 32770,
            AV_CODEC_ID_AVUI = 32771,
            AV_CODEC_ID_AYUV = 32772,
            AV_CODEC_ID_TARGA_Y216 = 32773,
            AV_CODEC_ID_V308 = 32774,
            AV_CODEC_ID_V408 = 32775,
            AV_CODEC_ID_YUV4 = 32776,
            AV_CODEC_ID_AVRN = 32777,
            AV_CODEC_ID_CPIA = 32778,
            AV_CODEC_ID_XFACE = 32779,
            AV_CODEC_ID_SNOW = 32780,
            AV_CODEC_ID_SMVJPEG = 32781,
            AV_CODEC_ID_APNG = 32782,
            AV_CODEC_ID_DAALA = 32783,
            AV_CODEC_ID_CFHD = 32784,
            AV_CODEC_ID_TRUEMOTION2RT = 32785,
            AV_CODEC_ID_M101 = 32786,
            AV_CODEC_ID_MAGICYUV = 32787,
            AV_CODEC_ID_SHEERVIDEO = 32788,
            AV_CODEC_ID_YLC = 32789,
            AV_CODEC_ID_PSD = 32790,
            AV_CODEC_ID_PIXLET = 32791,
            AV_CODEC_ID_SPEEDHQ = 32792,
            AV_CODEC_ID_FMVC = 32793,
            AV_CODEC_ID_SCPR = 32794,
            AV_CODEC_ID_CLEARVIDEO = 32795,
            AV_CODEC_ID_XPM = 32796,
            AV_CODEC_ID_AV1 = 32797,
            AV_CODEC_ID_BITPACKED = 32798,
            AV_CODEC_ID_MSCC = 32799,
            AV_CODEC_ID_SRGC = 32800,
            AV_CODEC_ID_SVG = 32801,
            AV_CODEC_ID_GDV = 32802,
            AV_CODEC_ID_FITS = 32803,
            AV_CODEC_ID_IMM4 = 32804,
            AV_CODEC_ID_PROSUMER = 32805,
            AV_CODEC_ID_MWSC = 32806,
            AV_CODEC_ID_WCMV = 32807,
            AV_CODEC_ID_RASC = 32808,
            AV_CODEC_ID_HYMT = 32809,
            AV_CODEC_ID_ARBC = 32810,
            AV_CODEC_ID_AGM = 32811,
            AV_CODEC_ID_LSCR = 32812,
            AV_CODEC_ID_VP4 = 32813,
            AV_CODEC_ID_IMM5 = 32814,
            AV_CODEC_ID_MVDV = 32815,
            AV_CODEC_ID_MVHA = 32816,
            AV_CODEC_ID_CDTOONS = 32817,
            AV_CODEC_ID_MV30 = 32818,
            AV_CODEC_ID_NOTCHLC = 32819,
            AV_CODEC_ID_PFM = 32820,
            AV_CODEC_ID_FIRST_AUDIO = 65536,
            AV_CODEC_ID_PCM_S16LE = 65536,
            AV_CODEC_ID_PCM_S16BE = 65537,
            AV_CODEC_ID_PCM_U16LE = 65538,
            AV_CODEC_ID_PCM_U16BE = 65539,
            AV_CODEC_ID_PCM_S8 = 65540,
            AV_CODEC_ID_PCM_U8 = 65541,
            AV_CODEC_ID_PCM_MULAW = 65542,
            AV_CODEC_ID_PCM_ALAW = 65543,
            AV_CODEC_ID_PCM_S32LE = 65544,
            AV_CODEC_ID_PCM_S32BE = 65545,
            AV_CODEC_ID_PCM_U32LE = 65546,
            AV_CODEC_ID_PCM_U32BE = 65547,
            AV_CODEC_ID_PCM_S24LE = 65548,
            AV_CODEC_ID_PCM_S24BE = 65549,
            AV_CODEC_ID_PCM_U24LE = 65550,
            AV_CODEC_ID_PCM_U24BE = 65551,
            AV_CODEC_ID_PCM_S24DAUD = 65552,
            AV_CODEC_ID_PCM_ZORK = 65553,
            AV_CODEC_ID_PCM_S16LE_PLANAR = 65554,
            AV_CODEC_ID_PCM_DVD = 65555,
            AV_CODEC_ID_PCM_F32BE = 65556,
            AV_CODEC_ID_PCM_F32LE = 65557,
            AV_CODEC_ID_PCM_F64BE = 65558,
            AV_CODEC_ID_PCM_F64LE = 65559,
            AV_CODEC_ID_PCM_BLURAY = 65560,
            AV_CODEC_ID_PCM_LXF = 65561,
            AV_CODEC_ID_S302M = 65562,
            AV_CODEC_ID_PCM_S8_PLANAR = 65563,
            AV_CODEC_ID_PCM_S24LE_PLANAR = 65564,
            AV_CODEC_ID_PCM_S32LE_PLANAR = 65565,
            AV_CODEC_ID_PCM_S16BE_PLANAR = 65566,
            AV_CODEC_ID_PCM_S64LE = 67584,
            AV_CODEC_ID_PCM_S64BE = 67585,
            AV_CODEC_ID_PCM_F16LE = 67586,
            AV_CODEC_ID_PCM_F24LE = 67587,
            AV_CODEC_ID_PCM_VIDC = 67588,
            AV_CODEC_ID_ADPCM_IMA_QT = 69632,
            AV_CODEC_ID_ADPCM_IMA_WAV = 69633,
            AV_CODEC_ID_ADPCM_IMA_DK3 = 69634,
            AV_CODEC_ID_ADPCM_IMA_DK4 = 69635,
            AV_CODEC_ID_ADPCM_IMA_WS = 69636,
            AV_CODEC_ID_ADPCM_IMA_SMJPEG = 69637,
            AV_CODEC_ID_ADPCM_MS = 69638,
            AV_CODEC_ID_ADPCM_4XM = 69639,
            AV_CODEC_ID_ADPCM_XA = 69640,
            AV_CODEC_ID_ADPCM_ADX = 69641,
            AV_CODEC_ID_ADPCM_EA = 69642,
            AV_CODEC_ID_ADPCM_G726 = 69643,
            AV_CODEC_ID_ADPCM_CT = 69644,
            AV_CODEC_ID_ADPCM_SWF = 69645,
            AV_CODEC_ID_ADPCM_YAMAHA = 69646,
            AV_CODEC_ID_ADPCM_SBPRO_4 = 69647,
            AV_CODEC_ID_ADPCM_SBPRO_3 = 69648,
            AV_CODEC_ID_ADPCM_SBPRO_2 = 69649,
            AV_CODEC_ID_ADPCM_THP = 69650,
            AV_CODEC_ID_ADPCM_IMA_AMV = 69651,
            AV_CODEC_ID_ADPCM_EA_R1 = 69652,
            AV_CODEC_ID_ADPCM_EA_R3 = 69653,
            AV_CODEC_ID_ADPCM_EA_R2 = 69654,
            AV_CODEC_ID_ADPCM_IMA_EA_SEAD = 69655,
            AV_CODEC_ID_ADPCM_IMA_EA_EACS = 69656,
            AV_CODEC_ID_ADPCM_EA_XAS = 69657,
            AV_CODEC_ID_ADPCM_EA_MAXIS_XA = 69658,
            AV_CODEC_ID_ADPCM_IMA_ISS = 69659,
            AV_CODEC_ID_ADPCM_G722 = 69660,
            AV_CODEC_ID_ADPCM_IMA_APC = 69661,
            AV_CODEC_ID_ADPCM_VIMA = 69662,
            AV_CODEC_ID_ADPCM_AFC = 71680,
            AV_CODEC_ID_ADPCM_IMA_OKI = 71681,
            AV_CODEC_ID_ADPCM_DTK = 71682,
            AV_CODEC_ID_ADPCM_IMA_RAD = 71683,
            AV_CODEC_ID_ADPCM_G726LE = 71684,
            AV_CODEC_ID_ADPCM_THP_LE = 71685,
            AV_CODEC_ID_ADPCM_PSX = 71686,
            AV_CODEC_ID_ADPCM_AICA = 71687,
            AV_CODEC_ID_ADPCM_IMA_DAT4 = 71688,
            AV_CODEC_ID_ADPCM_MTAF = 71689,
            AV_CODEC_ID_ADPCM_AGM = 71690,
            AV_CODEC_ID_ADPCM_ARGO = 71691,
            AV_CODEC_ID_ADPCM_IMA_SSI = 71692,
            AV_CODEC_ID_ADPCM_ZORK = 71693,
            AV_CODEC_ID_ADPCM_IMA_APM = 71694,
            AV_CODEC_ID_ADPCM_IMA_ALP = 71695,
            AV_CODEC_ID_ADPCM_IMA_MTF = 71696,
            AV_CODEC_ID_ADPCM_IMA_CUNNING = 71697,
            AV_CODEC_ID_AMR_NB = 73728,
            AV_CODEC_ID_AMR_WB = 73729,
            AV_CODEC_ID_RA_144 = 77824,
            AV_CODEC_ID_RA_288 = 77825,
            AV_CODEC_ID_ROQ_DPCM = 81920,
            AV_CODEC_ID_INTERPLAY_DPCM = 81921,
            AV_CODEC_ID_XAN_DPCM = 81922,
            AV_CODEC_ID_SOL_DPCM = 81923,
            AV_CODEC_ID_SDX2_DPCM = 83968,
            AV_CODEC_ID_GREMLIN_DPCM = 83969,
            AV_CODEC_ID_DERF_DPCM = 83970,
            AV_CODEC_ID_MP2 = 86016,
            AV_CODEC_ID_MP3 = 86017,
            AV_CODEC_ID_AAC = 86018,
            AV_CODEC_ID_AC3 = 86019,
            AV_CODEC_ID_DTS = 86020,
            AV_CODEC_ID_VORBIS = 86021,
            AV_CODEC_ID_DVAUDIO = 86022,
            AV_CODEC_ID_WMAV1 = 86023,
            AV_CODEC_ID_WMAV2 = 86024,
            AV_CODEC_ID_MACE3 = 86025,
            AV_CODEC_ID_MACE6 = 86026,
            AV_CODEC_ID_VMDAUDIO = 86027,
            AV_CODEC_ID_FLAC = 86028,
            AV_CODEC_ID_MP3ADU = 86029,
            AV_CODEC_ID_MP3ON4 = 86030,
            AV_CODEC_ID_SHORTEN = 86031,
            AV_CODEC_ID_ALAC = 86032,
            AV_CODEC_ID_WESTWOOD_SND1 = 86033,
            AV_CODEC_ID_GSM = 86034,
            AV_CODEC_ID_QDM2 = 86035,
            AV_CODEC_ID_COOK = 86036,
            AV_CODEC_ID_TRUESPEECH = 86037,
            AV_CODEC_ID_TTA = 86038,
            AV_CODEC_ID_SMACKAUDIO = 86039,
            AV_CODEC_ID_QCELP = 86040,
            AV_CODEC_ID_WAVPACK = 86041,
            AV_CODEC_ID_DSICINAUDIO = 86042,
            AV_CODEC_ID_IMC = 86043,
            AV_CODEC_ID_MUSEPACK7 = 86044,
            AV_CODEC_ID_MLP = 86045,
            AV_CODEC_ID_GSM_MS = 86046,
            AV_CODEC_ID_ATRAC3 = 86047,
            AV_CODEC_ID_APE = 86048,
            AV_CODEC_ID_NELLYMOSER = 86049,
            AV_CODEC_ID_MUSEPACK8 = 86050,
            AV_CODEC_ID_SPEEX = 86051,
            AV_CODEC_ID_WMAVOICE = 86052,
            AV_CODEC_ID_WMAPRO = 86053,
            AV_CODEC_ID_WMALOSSLESS = 86054,
            AV_CODEC_ID_ATRAC3P = 86055,
            AV_CODEC_ID_EAC3 = 86056,
            AV_CODEC_ID_SIPR = 86057,
            AV_CODEC_ID_MP1 = 86058,
            AV_CODEC_ID_TWINVQ = 86059,
            AV_CODEC_ID_TRUEHD = 86060,
            AV_CODEC_ID_MP4ALS = 86061,
            AV_CODEC_ID_ATRAC1 = 86062,
            AV_CODEC_ID_BINKAUDIO_RDFT = 86063,
            AV_CODEC_ID_BINKAUDIO_DCT = 86064,
            AV_CODEC_ID_AAC_LATM = 86065,
            AV_CODEC_ID_QDMC = 86066,
            AV_CODEC_ID_CELT = 86067,
            AV_CODEC_ID_G723_1 = 86068,
            AV_CODEC_ID_G729 = 86069,
            AV_CODEC_ID_8SVX_EXP = 86070,
            AV_CODEC_ID_8SVX_FIB = 86071,
            AV_CODEC_ID_BMV_AUDIO = 86072,
            AV_CODEC_ID_RALF = 86073,
            AV_CODEC_ID_IAC = 86074,
            AV_CODEC_ID_ILBC = 86075,
            AV_CODEC_ID_OPUS = 86076,
            AV_CODEC_ID_COMFORT_NOISE = 86077,
            AV_CODEC_ID_TAK = 86078,
            AV_CODEC_ID_METASOUND = 86079,
            AV_CODEC_ID_PAF_AUDIO = 86080,
            AV_CODEC_ID_ON2AVC = 86081,
            AV_CODEC_ID_DSS_SP = 86082,
            AV_CODEC_ID_CODEC2 = 86083,
            AV_CODEC_ID_FFWAVESYNTH = 88064,
            AV_CODEC_ID_SONIC = 88065,
            AV_CODEC_ID_SONIC_LS = 88066,
            AV_CODEC_ID_EVRC = 88067,
            AV_CODEC_ID_SMV = 88068,
            AV_CODEC_ID_DSD_LSBF = 88069,
            AV_CODEC_ID_DSD_MSBF = 88070,
            AV_CODEC_ID_DSD_LSBF_PLANAR = 88071,
            AV_CODEC_ID_DSD_MSBF_PLANAR = 88072,
            AV_CODEC_ID_4GV = 88073,
            AV_CODEC_ID_INTERPLAY_ACM = 88074,
            AV_CODEC_ID_XMA1 = 88075,
            AV_CODEC_ID_XMA2 = 88076,
            AV_CODEC_ID_DST = 88077,
            AV_CODEC_ID_ATRAC3AL = 88078,
            AV_CODEC_ID_ATRAC3PAL = 88079,
            AV_CODEC_ID_DOLBY_E = 88080,
            AV_CODEC_ID_APTX = 88081,
            AV_CODEC_ID_APTX_HD = 88082,
            AV_CODEC_ID_SBC = 88083,
            AV_CODEC_ID_ATRAC9 = 88084,
            AV_CODEC_ID_HCOM = 88085,
            AV_CODEC_ID_ACELP_KELVIN = 88086,
            AV_CODEC_ID_MPEGH_3D_AUDIO = 88087,
            AV_CODEC_ID_SIREN = 88088,
            AV_CODEC_ID_HCA = 88089,
            AV_CODEC_ID_FIRST_SUBTITLE = 94208,
            AV_CODEC_ID_DVD_SUBTITLE = 94208,
            AV_CODEC_ID_DVB_SUBTITLE = 94209,
            AV_CODEC_ID_TEXT = 94210,
            AV_CODEC_ID_XSUB = 94211,
            AV_CODEC_ID_SSA = 94212,
            AV_CODEC_ID_MOV_TEXT = 94213,
            AV_CODEC_ID_HDMV_PGS_SUBTITLE = 94214,
            AV_CODEC_ID_DVB_TELETEXT = 94215,
            AV_CODEC_ID_SRT = 94216,
            AV_CODEC_ID_MICRODVD = 96256,
            AV_CODEC_ID_EIA_608 = 96257,
            AV_CODEC_ID_JACOSUB = 96258,
            AV_CODEC_ID_SAMI = 96259,
            AV_CODEC_ID_REALTEXT = 96260,
            AV_CODEC_ID_STL = 96261,
            AV_CODEC_ID_SUBVIEWER1 = 96262,
            AV_CODEC_ID_SUBVIEWER = 96263,
            AV_CODEC_ID_SUBRIP = 96264,
            AV_CODEC_ID_WEBVTT = 96265,
            AV_CODEC_ID_MPL2 = 96266,
            AV_CODEC_ID_VPLAYER = 96267,
            AV_CODEC_ID_PJS = 96268,
            AV_CODEC_ID_ASS = 96269,
            AV_CODEC_ID_HDMV_TEXT_SUBTITLE = 96270,
            AV_CODEC_ID_TTML = 96271,
            AV_CODEC_ID_ARIB_CAPTION = 96272,
            AV_CODEC_ID_FIRST_UNKNOWN = 98304,
            AV_CODEC_ID_TTF = 98304,
            AV_CODEC_ID_SCTE_35 = 98305,
            AV_CODEC_ID_EPG = 98306,
            AV_CODEC_ID_BINTEXT = 100352,
            AV_CODEC_ID_XBIN = 100353,
            AV_CODEC_ID_IDF = 100354,
            AV_CODEC_ID_OTF = 100355,
            AV_CODEC_ID_SMPTE_KLV = 100356,
            AV_CODEC_ID_DVD_NAV = 100357,
            AV_CODEC_ID_TIMED_ID3 = 100358,
            AV_CODEC_ID_BIN_DATA = 100359,
            AV_CODEC_ID_PROBE = 102400,
            AV_CODEC_ID_MPEG2TS = 131072,
            AV_CODEC_ID_MPEG4SYSTEMS = 131073,
            AV_CODEC_ID_FFMETADATA = 135168,
            AV_CODEC_ID_WRAPPED_AVFRAME = 135169
        }

        // Enum @ pixfmt.h:509:6
        //	x86_64-pc-windows-msvc (libavutil\pixfmt.h)
		[AllowDuplicates]
        public enum AVColorSpace : int32
        {
            AVCOL_SPC_RGB = 0,
            AVCOL_SPC_BT709 = 1,
            AVCOL_SPC_UNSPECIFIED = 2,
            AVCOL_SPC_RESERVED = 3,
            AVCOL_SPC_FCC = 4,
            AVCOL_SPC_BT470BG = 5,
            AVCOL_SPC_SMPTE170M = 6,
            AVCOL_SPC_SMPTE240M = 7,
            AVCOL_SPC_YCGCO = 8,
            AVCOL_SPC_YCOCG = 8,
            AVCOL_SPC_BT2020_NCL = 9,
            AVCOL_SPC_BT2020_CL = 10,
            AVCOL_SPC_SMPTE2085 = 11,
            AVCOL_SPC_CHROMA_DERIVED_NCL = 12,
            AVCOL_SPC_CHROMA_DERIVED_CL = 13,
            AVCOL_SPC_ICTCP = 14,
            AVCOL_SPC_NB = 15
        }

        // Enum @ hwcontext.h:27:6
        //	x86_64-pc-windows-msvc (libavutil\hwcontext.h)
        public enum AVHWDeviceType : int32
        {
            AV_HWDEVICE_TYPE_NONE = 0,
            AV_HWDEVICE_TYPE_VDPAU = 1,
            AV_HWDEVICE_TYPE_CUDA = 2,
            AV_HWDEVICE_TYPE_VAAPI = 3,
            AV_HWDEVICE_TYPE_DXVA2 = 4,
            AV_HWDEVICE_TYPE_QSV = 5,
            AV_HWDEVICE_TYPE_VIDEOTOOLBOX = 6,
            AV_HWDEVICE_TYPE_D3D11VA = 7,
            AV_HWDEVICE_TYPE_DRM = 8,
            AV_HWDEVICE_TYPE_OPENCL = 9,
            AV_HWDEVICE_TYPE_MEDIACODEC = 10,
            AV_HWDEVICE_TYPE_VULKAN = 11
        }

        // MacroObject @ swscale.h:96:9
        //	x86_64-pc-windows-msvc (libswscale\swscale.h)
        public const int32 SWS_CS_BT2020 = 9;

        // MacroObject @ avcodec.h:2657:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 AV_SUBTITLE_FLAG_FORCED = 1;

        // MacroObject @ version.h:67:9
        //	x86_64-pc-windows-msvc (libavcodec\version.h)
        public const CBool FF_API_SIDEDATA_ONLY_PKT = 1;

        // MacroObject @ version.h:30:9
        //	x86_64-pc-windows-msvc (libswscale\version.h)
        public const int32 LIBSWSCALE_VERSION_MINOR = 7;

        // MacroObject @ channel_layout.h:50:9
        //	x86_64-pc-windows-msvc (libavutil\channel_layout.h)
        public const int32 AV_CH_FRONT_RIGHT = 2;

        // MacroObject @ opt.h:293:9
        //	x86_64-pc-windows-msvc (libavutil\opt.h)
        public const int32 AV_OPT_FLAG_DEPRECATED = 131072;

        // MacroObject @ codec.h:171:9
        //	x86_64-pc-windows-msvc (libavcodec\codec.h)
        public const int32 AV_CODEC_CAP_ENCODER_FLUSH = 2097152;

        // MacroObject @ avcodec.h:292:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 AV_CODEC_FLAG_DROPCHANGED = 32;

        // MacroObject @ cpu.h:54:9
        //	x86_64-pc-windows-msvc (libavutil\cpu.h)
        public const int32 AV_CPU_FLAG_AVX2 = 32768;

        // MacroObject @ packet.h:296:9
        //	x86_64-pc-windows-msvc (libavcodec\packet.h)
        public static AVPacketSideDataType AV_PKT_DATA_QUALITY_FACTOR = (.)8;

        // MacroObject @ avcodec.h:1671:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 AV_EF_AGGRESSIVE = 262144;

        // MacroObject @ avformat.h:459:9
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        public const int32 AVFMT_NEEDNUMBER = 2;

        // MacroObject @ swscale.h:59:9
        //	x86_64-pc-windows-msvc (libswscale\swscale.h)
        public const int32 SWS_BILINEAR = 2;

        // MacroObject @ cpu.h:43:9
        //	x86_64-pc-windows-msvc (libavutil\cpu.h)
        public const int32 AV_CPU_FLAG_SSSE3 = 128;

        // MacroObject @ avcodec.h:1564:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_BUG_NO_PADDING = 16;

        // MacroObject @ version.h:62:9
        //	x86_64-pc-windows-msvc (libavformat\version.h)
        public const CBool FF_API_OLD_OPEN_CALLBACKS = 1;

        // MacroObject @ avcodec.h:888:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_PRED_MEDIAN = 2;

        // MacroObject @ avcodec.h:1562:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_BUG_XVID_ILACE = 4;

        // MacroObject @ dict.h:72:9
        //	x86_64-pc-windows-msvc (libavutil\dict.h)
        public const int32 AV_DICT_DONT_STRDUP_KEY = 4;

        // MacroObject @ avformat.h:1252:9
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        public const int32 AV_PROGRAM_RUNNING = 1;

        // MacroObject @ channel_layout.h:67:9
        //	x86_64-pc-windows-msvc (libavutil\channel_layout.h)
        public const int32 AV_CH_STEREO_LEFT = 536870912;

        // MacroObject @ avformat.h:824:9
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        public const int32 AV_DISPOSITION_FORCED = 64;

        // MacroObject @ avformat.h:858:9
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        public const int32 AV_PTS_WRAP_SUB_OFFSET = -1;

        // MacroObject @ version.h:118:9
        //	x86_64-pc-windows-msvc (libavutil\version.h)
        public const CBool FF_API_ERROR_FRAME = 1;

        // MacroObject @ avcodec.h:1005:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 SLICE_FLAG_CODED_ORDER = 1;

        // MacroObject @ version.h:121:9
        //	x86_64-pc-windows-msvc (libavcodec\version.h)
        public const CBool FF_API_GETCHROMA = 1;

        // MacroObject @ avio.h:674:9
        //	x86_64-pc-windows-msvc (libavformat\avio.h)
        public const int32 AVIO_FLAG_READ = 1;

        // MacroObject @ channel_layout.h:64:9
        //	x86_64-pc-windows-msvc (libavutil\channel_layout.h)
        public const int32 AV_CH_TOP_BACK_LEFT = 32768;

        // MacroObject @ avformat.h:453:9
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        public const int32 AVPROBE_SCORE_MAX = 100;

        // MacroObject @ avcodec.h:1571:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_BUG_HPEL_CHROMA = 2048;

        // MacroObject @ mathematics.h:52:9
        //	x86_64-pc-windows-msvc (libavutil\mathematics.h)
        public const double M_PI = 3.141592653589793;

        // MacroObject @ avcodec.h:1737:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_IDCT_XVID = 14;

        // MacroObject @ avcodec.h:1931:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_PROFILE_MPEG4_ADVANCED_CORE = 12;

        // MacroObject @ avcodec.h:338:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 AV_CODEC_FLAG_AC_PRED = 16777216;

        // MacroObject @ avcodec.h:1593:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_COMPLIANCE_UNOFFICIAL = -1;

        // MacroObject @ avcodec.h:342:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 AV_CODEC_FLAG_INTERLACED_ME = 536870912;

        // MacroObject @ avcodec.h:1017:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_MB_DECISION_RD = 2;

        // MacroObject @ avcodec.h:1797:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_THREAD_SLICE = 2;

        // MacroObject @ cpu.h:65:9
        //	x86_64-pc-windows-msvc (libavutil\cpu.h)
        public const int32 AV_CPU_FLAG_ARMV6 = 2;

        // MacroObject @ avcodec.h:1563:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_BUG_UMP4 = 8;

        // MacroObject @ avformat.h:1289:9
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        public const int32 AVFMTCTX_UNSEEKABLE = 2;

        // MacroObject @ avcodec.h:1902:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_PROFILE_H264_HIGH = 100;

        // MacroObject @ cpu.h:51:9
        //	x86_64-pc-windows-msvc (libavutil\cpu.h)
        public const int32 AV_CPU_FLAG_XOP = 1024;

        // MacroObject @ swscale.h:89:9
        //	x86_64-pc-windows-msvc (libswscale\swscale.h)
        public const int32 SWS_CS_ITU709 = 1;

        // MacroObject @ swscale.h:85:9
        //	x86_64-pc-windows-msvc (libswscale\swscale.h)
        public const int32 SWS_ERROR_DIFFUSION = 8388608;

        // MacroObject @ avcodec.h:296:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 AV_CODEC_FLAG_PASS1 = 512;

        // MacroObject @ avcodec.h:325:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 AV_CODEC_FLAG_LOW_DELAY = 524288;

        // MacroObject @ codec_desc.h:82:9
        //	x86_64-pc-windows-msvc (libavcodec\codec_desc.h)
        public const int32 AV_CODEC_PROP_LOSSLESS = 4;

        // MacroObject @ avutil.h:225:9
        //	x86_64-pc-windows-msvc (libavutil\avutil.h)
        public const int32 FF_LAMBDA_SHIFT = 7;

        // MacroObject @ avformat.h:814:9
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        public const int32 AV_DISPOSITION_ORIGINAL = 4;

        // MacroObject @ avio.h:675:9
        //	x86_64-pc-windows-msvc (libavformat\avio.h)
        public const int32 AVIO_FLAG_WRITE = 2;

        // MacroObject @ avcodec.h:1896:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_PROFILE_H264_INTRA = 2048;

        // MacroObject @ avformat.h:484:9
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        public const int32 AVFMT_SEEK_TO_PTS = 67108864;

        // MacroObject @ channel_layout.h:87:9
        //	x86_64-pc-windows-msvc (libavutil\channel_layout.h)
        public const int32 AV_CH_LAYOUT_2POINT1 = 11;

        // MacroObject @ avcodec.h:321:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 AV_CODEC_FLAG_INTERLACED_DCT = 262144;

        // MacroObject @ channel_layout.h:71:9
        //	x86_64-pc-windows-msvc (libavutil\channel_layout.h)
        public const ulong AV_CH_SURROUND_DIRECT_LEFT = 8589934592;

        // MacroObject @ avformat.h:460:9
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        public const int32 AVFMT_SHOW_IDS = 8;

        // MacroObject @ avcodec.h:1952:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_PROFILE_AV1_MAIN = 0;

        // MacroObject @ cpu.h:58:9
        //	x86_64-pc-windows-msvc (libavutil\cpu.h)
        public const int32 AV_CPU_FLAG_AVX512 = 1048576;

        // MacroObject @ avcodec.h:1733:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_IDCT_SIMPLEMMX = 3;

        // MacroObject @ avcodec.h:348:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 AV_CODEC_FLAG2_FAST = 1;

        // MacroObject @ cpu.h:41:9
        //	x86_64-pc-windows-msvc (libavutil\cpu.h)
        public const int32 AV_CPU_FLAG_SSE3SLOW = 536870912;

        // MacroObject @ cpu.h:39:9
        //	x86_64-pc-windows-msvc (libavutil\cpu.h)
        public const int32 AV_CPU_FLAG_3DNOWEXT = 32;

        // MacroObject @ version.h:145:9
        //	x86_64-pc-windows-msvc (libavcodec\version.h)
        public const CBool FF_API_UNUSED_CODEC_CAPS = 1;

        // MacroObject @ avcodec.h:1860:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_PROFILE_UNKNOWN = -99;

        // MacroObject @ avcodec.h:1939:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_PROFILE_JPEG2000_DCINEMA_2K = 3;

        // MacroObject @ avcodec.h:215:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 AV_INPUT_BUFFER_PADDING_SIZE = 64;

        // MacroObject @ avcodec.h:1949:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_PROFILE_HEVC_MAIN_STILL_PICTURE = 3;

        // MacroObject @ version.h:29:9
        //	x86_64-pc-windows-msvc (libswscale\version.h)
        public const int32 LIBSWSCALE_VERSION_MAJOR = 5;

        // MacroObject @ avformat.h:827:9
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        public const int32 AV_DISPOSITION_CLEAN_EFFECTS = 512;

        // MacroObject @ channel_layout.h:93:9
        //	x86_64-pc-windows-msvc (libavutil\channel_layout.h)
        public const int32 AV_CH_LAYOUT_2_2 = 1539;

        // MacroObject @ avcodec.h:2125:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_SUB_CHARENC_MODE_DO_NOTHING = -1;

        // MacroObject @ frame.h:525:9
        //	x86_64-pc-windows-msvc (libavutil\frame.h)
        public const int32 AV_FRAME_FLAG_CORRUPT = 1;

        // MacroObject @ avcodec.h:2128:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_SUB_CHARENC_MODE_IGNORE = 2;

        // MacroObject @ avcodec.h:936:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_CMP_BIT = 5;

        // MacroObject @ avcodec.h:1912:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_PROFILE_H264_CAVLC_444 = 44;

        // MacroObject @ frame.h:596:9
        //	x86_64-pc-windows-msvc (libavutil\frame.h)
        public const int32 FF_DECODE_ERROR_INVALID_BITSTREAM = 1;

        // MacroObject @ avcodec.h:1730:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_IDCT_AUTO = 0;

        // MacroObject @ avcodec.h:412:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 AV_CODEC_EXPORT_DATA_VIDEO_ENC_PARAMS = 4;

        // MacroObject @ avcodec.h:1965:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_PROFILE_PRORES_LT = 1;

        // MacroObject @ avcodec.h:1892:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_PROFILE_MPEG2_MAIN = 4;

        // MacroObject @ avcodec.h:946:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_CMP_MEDIAN_SAD = 15;

        // MacroObject @ avcodec.h:1866:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_PROFILE_AAC_LTP = 3;

        // MacroObject @ avcodec.h:2193:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_CODEC_PROPERTY_CLOSED_CAPTIONS = 2;

        // MacroObject @ swscale.h:92:9
        //	x86_64-pc-windows-msvc (libswscale\swscale.h)
        public const int32 SWS_CS_ITU624 = 5;

        // MacroObject @ avcodec.h:1968:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_PROFILE_PRORES_4444 = 4;

        // MacroObject @ avformat.h:1473:9
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        public const int32 AVFMT_FLAG_IGNDTS = 8;

        // MacroObject @ avcodec.h:1924:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_PROFILE_MPEG4_SCALABLE_TEXTURE = 5;

        // MacroObject @ avcodec.h:1665:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 AV_EF_BUFFER = 4;

        // MacroObject @ avformat.h:849:9
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        public const int32 AV_DISPOSITION_METADATA = 262144;

        // MacroObject @ version.h:42:9
        //	x86_64-pc-windows-msvc (libavcodec\version.h)
        public static String LIBAVCODEC_IDENT = "Lavc58.91.100";

        // MacroObject @ channel_layout.h:86:9
        //	x86_64-pc-windows-msvc (libavutil\channel_layout.h)
        public const int32 AV_CH_LAYOUT_STEREO = 3;

        // MacroObject @ codec.h:50:9
        //	x86_64-pc-windows-msvc (libavcodec\codec.h)
        public const int32 AV_CODEC_CAP_DR1 = 2;

        // MacroObject @ avutil.h:226:9
        //	x86_64-pc-windows-msvc (libavutil\avutil.h)
        public const int32 FF_LAMBDA_SCALE = 128;

        // MacroObject @ codec.h:114:9
        //	x86_64-pc-windows-msvc (libavcodec\codec.h)
        public const int32 AV_CODEC_CAP_PARAM_CHANGE = 16384;

        // MacroObject @ avcodec.h:329:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 AV_CODEC_FLAG_GLOBAL_HEADER = 4194304;

        // MacroObject @ version.h:101:9
        //	x86_64-pc-windows-msvc (libavformat\version.h)
        public const CBool FF_API_DASH_MIN_SEG_DURATION = 1;

        // MacroObject @ avformat.h:851:9
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        public const int32 AV_DISPOSITION_STILL_IMAGE = 1048576;

        // MacroObject @ avformat.h:847:9
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        public const int32 AV_DISPOSITION_CAPTIONS = 65536;

        // MacroObject @ channel_layout.h:56:9
        //	x86_64-pc-windows-msvc (libavutil\channel_layout.h)
        public const int32 AV_CH_FRONT_RIGHT_OF_CENTER = 128;

        // MacroObject @ avcodec.h:2160:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_DEBUG_VIS_MV_B_BACK = 4;

        // MacroObject @ version.h:121:9
        //	x86_64-pc-windows-msvc (libavutil\version.h)
        public const CBool FF_API_PKT_PTS = 1;

        // MacroObject @ log.h:197:9
        //	x86_64-pc-windows-msvc (libavutil\log.h)
        public const int32 AV_LOG_DEBUG = 48;

        // MacroObject @ channel_layout.h:63:9
        //	x86_64-pc-windows-msvc (libavutil\channel_layout.h)
        public const int32 AV_CH_TOP_FRONT_RIGHT = 16384;

        // MacroObject @ avcodec.h:1888:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_PROFILE_MPEG2_422 = 0;

        // MacroObject @ codec.h:164:9
        //	x86_64-pc-windows-msvc (libavcodec\codec.h)
        public const int32 AV_CODEC_CAP_ENCODER_REORDERED_OPAQUE = 1048576;

        // MacroObject @ avcodec.h:1602:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_EC_GUESS_MVS = 1;

        // MacroObject @ avcodec.h:934:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_CMP_DCT = 3;

        // MacroObject @ swscale.h:68:9
        //	x86_64-pc-windows-msvc (libswscale\swscale.h)
        public const int32 SWS_SPLINE = 1024;

        // MacroObject @ avcodec.h:1740:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_IDCT_FAAN = 20;

        // MacroObject @ avcodec.h:1879:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_PROFILE_DNXHR_444 = 5;

        // MacroObject @ avformat.h:1654:9
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        public const int32 AVFMT_EVENT_FLAG_METADATA_UPDATED = 1;

        // MacroObject @ avcodec.h:279:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 AV_CODEC_FLAG_4MV = 4;

        // MacroObject @ avcodec.h:1722:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_DCT_FAAN = 6;

        // MacroObject @ version.h:64:9
        //	x86_64-pc-windows-msvc (libavcodec\version.h)
        public const CBool FF_API_CODED_FRAME = 1;

        // MacroObject @ swscale.h:63:9
        //	x86_64-pc-windows-msvc (libswscale\swscale.h)
        public const int32 SWS_AREA = 32;

        // MacroObject @ avcodec.h:937:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_CMP_RD = 6;

        // MacroObject @ avcodec.h:2127:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_SUB_CHARENC_MODE_PRE_DECODER = 1;

        // MacroObject @ opt.h:279:9
        //	x86_64-pc-windows-msvc (libavutil\opt.h)
        public const int32 AV_OPT_FLAG_VIDEO_PARAM = 16;

        // MacroObject @ channel_layout.h:111:9
        //	x86_64-pc-windows-msvc (libavutil\channel_layout.h)
        public const ulong AV_CH_LAYOUT_HEXADECAGONAL = 6442710839;

        // MacroObject @ avcodec.h:1974:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_PROFILE_KLVA_SYNC = 0;

        // MacroObject @ avcodec.h:1668:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 AV_EF_IGNORE_ERR = 32768;

        // MacroObject @ swscale.h:61:9
        //	x86_64-pc-windows-msvc (libswscale\swscale.h)
        public const int32 SWS_X = 8;

        // MacroObject @ avcodec.h:3391:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 PARSER_FLAG_USE_CODEC_TS = 4096;

        // MacroObject @ swscale.h:66:9
        //	x86_64-pc-windows-msvc (libswscale\swscale.h)
        public const int32 SWS_SINC = 256;

        // MacroObject @ codec.h:118:9
        //	x86_64-pc-windows-msvc (libavcodec\codec.h)
        public const int32 AV_CODEC_CAP_AUTO_THREADS = 32768;

        // MacroObject @ avcodec.h:1719:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_DCT_INT = 2;

        // MacroObject @ avcodec.h:1604:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_EC_FAVOR_INTER = 256;

        // MacroObject @ swscale.h:65:9
        //	x86_64-pc-windows-msvc (libswscale\swscale.h)
        public const int32 SWS_GAUSS = 128;

        // MacroObject @ avformat.h:2509:9
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        public const int32 AVSTREAM_INIT_IN_WRITE_HEADER = 0;

        // MacroObject @ avcodec.h:939:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_CMP_VSAD = 8;

        // MacroObject @ avcodec.h:1945:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_PROFILE_VP9_3 = 3;

        // MacroObject @ channel_layout.h:85:9
        //	x86_64-pc-windows-msvc (libavutil\channel_layout.h)
        public const int32 AV_CH_LAYOUT_MONO = 4;

        // MacroObject @ frame.h:597:9
        //	x86_64-pc-windows-msvc (libavutil\frame.h)
        public const int32 FF_DECODE_ERROR_MISSING_REFERENCE = 2;

        // MacroObject @ codec_id.h:224:9
        //	x86_64-pc-windows-msvc (libavcodec\codec_id.h)
        public static AVCodecID AV_CODEC_ID_H265 = (.)173;

        // MacroObject @ channel_layout.h:112:9
        //	x86_64-pc-windows-msvc (libavutil\channel_layout.h)
        public const int32 AV_CH_LAYOUT_STEREO_DOWNMIX = 1610612736;

        // MacroObject @ avcodec.h:1930:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_PROFILE_MPEG4_ADVANCED_CODING = 11;

        // MacroObject @ avcodec.h:2158:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_DEBUG_VIS_MV_P_FOR = 1;

        // MacroObject @ swscale.h:73:9
        //	x86_64-pc-windows-msvc (libswscale\swscale.h)
        public const int32 SWS_PARAM_DEFAULT = 123456;

        // MacroObject @ version.h:31:9
        //	x86_64-pc-windows-msvc (libswscale\version.h)
        public const int32 LIBSWSCALE_VERSION_MICRO = 100;

        // MacroObject @ avcodec.h:1565:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_BUG_AMV = 32;

        // MacroObject @ avformat.h:471:9
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        public const int32 AVFMT_ALLOW_FLUSH = 65536;

        // MacroObject @ avcodec.h:283:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 AV_CODEC_FLAG_OUTPUT_CORRUPT = 8;

        // MacroObject @ avcodec.h:1923:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_PROFILE_MPEG4_N_BIT = 4;

        // MacroObject @ channel_layout.h:109:9
        //	x86_64-pc-windows-msvc (libavutil\channel_layout.h)
        public const int32 AV_CH_LAYOUT_7POINT1_WIDE_BACK = 255;

        // MacroObject @ version.h:59:9
        //	x86_64-pc-windows-msvc (libavformat\version.h)
        public const CBool FF_API_COMPUTE_PKT_FIELDS2 = 1;

        // MacroObject @ avcodec.h:1928:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_PROFILE_MPEG4_ADVANCED_REAL_TIME = 9;

        // MacroObject @ mathematics.h:40:9
        //	x86_64-pc-windows-msvc (libavutil\mathematics.h)
        public const double M_LN2 = 0.6931471805599453;

        // MacroObject @ avcodec.h:932:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_CMP_SSE = 1;

        // MacroObject @ avcodec.h:1731:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_IDCT_INT = 1;

        // MacroObject @ avcodec.h:943:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_CMP_W97 = 12;

        // MacroObject @ avcodec.h:333:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 AV_CODEC_FLAG_BITEXACT = 8388608;

        // MacroObject @ log.h:187:9
        //	x86_64-pc-windows-msvc (libavutil\log.h)
        public const int32 AV_LOG_INFO = 32;

        // MacroObject @ avcodec.h:2159:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_DEBUG_VIS_MV_B_FOR = 2;

        // MacroObject @ avcodec.h:1957:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_PROFILE_MJPEG_HUFFMAN_EXTENDED_SEQUENTIAL_DCT = 193;

        // MacroObject @ avcodec.h:1921:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_PROFILE_MPEG4_CORE = 2;

        // MacroObject @ cpu.h:40:9
        //	x86_64-pc-windows-msvc (libavutil\cpu.h)
        public const int32 AV_CPU_FLAG_SSE3 = 64;

        // MacroObject @ cpu.h:32:9
        //	x86_64-pc-windows-msvc (libavutil\cpu.h)
        public const int32 AV_CPU_FLAG_MMXEXT = 2;

        // MacroObject @ buffer.h:113:9
        //	x86_64-pc-windows-msvc (libavutil\buffer.h)
        public const int32 AV_BUFFER_FLAG_READONLY = 1;

        // MacroObject @ version.h:115:9
        //	x86_64-pc-windows-msvc (libavcodec\version.h)
        public const CBool FF_API_MERGE_SD_API = 1;

        // MacroObject @ avcodec.h:1881:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_PROFILE_DTS = 20;

        // MacroObject @ avcodec.h:1739:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_IDCT_SIMPLEARMV6 = 17;

        // MacroObject @ avcodec.h:1591:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_COMPLIANCE_STRICT = 1;

        // MacroObject @ channel_layout.h:59:9
        //	x86_64-pc-windows-msvc (libavutil\channel_layout.h)
        public const int32 AV_CH_SIDE_RIGHT = 1024;

        // MacroObject @ avutil.h:228:9
        //	x86_64-pc-windows-msvc (libavutil\avutil.h)
        public const int32 FF_LAMBDA_MAX = 32767;

        // MacroObject @ avcodec.h:380:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 AV_CODEC_FLAG2_EXPORT_MVS = 268435456;

        // MacroObject @ cpu.h:44:9
        //	x86_64-pc-windows-msvc (libavutil\cpu.h)
        public const int32 AV_CPU_FLAG_SSSE3SLOW = 67108864;

        // MacroObject @ avcodec.h:935:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_CMP_PSNR = 4;

        // MacroObject @ codec.h:132:9
        //	x86_64-pc-windows-msvc (libavcodec\codec.h)
        public const int32 AV_CODEC_CAP_AVOID_PROBING = 131072;

        // MacroObject @ avcodec.h:1594:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_COMPLIANCE_EXPERIMENTAL = -2;

        // MacroObject @ avcodec.h:1950:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_PROFILE_HEVC_REXT = 4;

        // MacroObject @ channel_layout.h:110:9
        //	x86_64-pc-windows-msvc (libavutil\channel_layout.h)
        public const int32 AV_CH_LAYOUT_OCTAGONAL = 1847;

        // MacroObject @ version.h:136:9
        //	x86_64-pc-windows-msvc (libavcodec\version.h)
        public const CBool FF_API_UNSANITIZED_BITRATES = 1;

        // MacroObject @ avcodec.h:1871:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_PROFILE_MPEG2_AAC_LOW = 128;

        // MacroObject @ avcodec.h:1669:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 AV_EF_CAREFUL = 65536;

        // MacroObject @ codec.h:157:9
        //	x86_64-pc-windows-msvc (libavcodec\codec.h)
        public const int32 AV_CODEC_CAP_HYBRID = 524288;

        // MacroObject @ avformat.h:835:9
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        public const int32 AV_DISPOSITION_ATTACHED_PIC = 1024;

        // MacroObject @ avformat.h:1471:9
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        public const int32 AVFMT_FLAG_IGNIDX = 2;

        // MacroObject @ channel_layout.h:95:9
        //	x86_64-pc-windows-msvc (libavutil\channel_layout.h)
        public const int32 AV_CH_LAYOUT_5POINT0 = 1543;

        // MacroObject @ avcodec.h:1882:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_PROFILE_DTS_ES = 30;

        // MacroObject @ avcodec.h:944:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_CMP_DCTMAX = 13;

        // MacroObject @ avformat.h:1477:9
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        public const int32 AVFMT_FLAG_CUSTOM_IO = 128;

        // MacroObject @ version.h:103:9
        //	x86_64-pc-windows-msvc (libavcodec\version.h)
        public const CBool FF_API_COPY_CONTEXT = 1;

        // MacroObject @ version.h:71:9
        //	x86_64-pc-windows-msvc (libavformat\version.h)
        public const CBool FF_API_HLS_WRAP = 1;

        // MacroObject @ packet.h:395:9
        //	x86_64-pc-windows-msvc (libavcodec\packet.h)
        public const int32 AV_PKT_FLAG_DISCARD = 4;

        // MacroObject @ version.h:74:9
        //	x86_64-pc-windows-msvc (libavformat\version.h)
        public const CBool FF_API_HLS_USE_LOCALTIME = 1;

        // MacroObject @ log.h:170:9
        //	x86_64-pc-windows-msvc (libavutil\log.h)
        public const int32 AV_LOG_FATAL = 8;

        // MacroObject @ cpu.h:69:9
        //	x86_64-pc-windows-msvc (libavutil\cpu.h)
        public const int32 AV_CPU_FLAG_NEON = 32;

        // MacroObject @ version.h:80:9
        //	x86_64-pc-windows-msvc (libavformat\version.h)
        public const CBool FF_API_OLD_ROTATE_API = 1;

        // MacroObject @ avcodec.h:1926:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_PROFILE_MPEG4_BASIC_ANIMATED_TEXTURE = 7;

        // MacroObject @ version.h:130:9
        //	x86_64-pc-windows-msvc (libavutil\version.h)
        public const CBool FF_API_PSEUDOPAL = 1;

        // MacroObject @ avcodec.h:222:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 AV_INPUT_BUFFER_MIN_SIZE = 16384;

        // MacroObject @ avcodec.h:931:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_CMP_SAD = 0;

        // MacroObject @ avcodec.h:1927:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_PROFILE_MPEG4_HYBRID = 8;

        // MacroObject @ cpu.h:64:9
        //	x86_64-pc-windows-msvc (libavutil\cpu.h)
        public const int32 AV_CPU_FLAG_ARMV5TE = 1;

        // MacroObject @ packet.h:402:9
        //	x86_64-pc-windows-msvc (libavcodec\packet.h)
        public const int32 AV_PKT_FLAG_TRUSTED = 8;

        // MacroObject @ avutil.h:248:9
        //	x86_64-pc-windows-msvc (libavutil\avutil.h)
        public static long AV_NOPTS_VALUE = 0;

        // MacroObject @ avformat.h:1010:9
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        public const int32 AVSTREAM_EVENT_FLAG_METADATA_UPDATED = 1;

        // MacroObject @ avcodec.h:300:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 AV_CODEC_FLAG_PASS2 = 1024;

        // MacroObject @ channel_layout.h:73:9
        //	x86_64-pc-windows-msvc (libavutil\channel_layout.h)
        public const ulong AV_CH_LOW_FREQUENCY_2 = 34359738368;

        // MacroObject @ avcodec.h:887:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_PRED_PLANE = 1;

        // MacroObject @ version.h:58:9
        //	x86_64-pc-windows-msvc (libavcodec\version.h)
        public const CBool FF_API_DEBUG_MV = 0;

        // MacroObject @ avio.h:45:9
        //	x86_64-pc-windows-msvc (libavformat\avio.h)
        public const int32 AVIO_SEEKABLE_TIME = 2;

        // MacroObject @ frame.h:599:9
        //	x86_64-pc-windows-msvc (libavutil\frame.h)
        public const int32 FF_DECODE_ERROR_DECODE_SLICES = 8;

        // MacroObject @ avformat.h:1491:9
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        public const int32 AVFMT_FLAG_PRIV_OPT = 131072;

        // MacroObject @ avformat.h:826:9
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        public const int32 AV_DISPOSITION_VISUAL_IMPAIRED = 256;

        // MacroObject @ avcodec.h:1876:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_PROFILE_DNXHR_SQ = 2;

        // MacroObject @ avcodec.h:1944:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_PROFILE_VP9_2 = 2;

        // MacroObject @ avformat.h:1670:9
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        public const int32 AVFMT_AVOID_NEG_TS_AUTO = -1;

        // MacroObject @ avcodec.h:1626:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_DEBUG_ER = 1024;

        // MacroObject @ avconfig.h:5:9
        //	x86_64-pc-windows-msvc (libavutil\avconfig.h)
        public const int32 AV_HAVE_FAST_UNALIGNED = 1;

        // MacroObject @ avcodec.h:1948:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_PROFILE_HEVC_MAIN_10 = 2;

        // MacroObject @ avformat.h:1470:9
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        public const int32 AVFMT_FLAG_GENPTS = 1;

        // MacroObject @ opt.h:566:9
        //	x86_64-pc-windows-msvc (libavutil\opt.h)
        public const int32 AV_OPT_SEARCH_FAKE_OBJ = 2;

        // MacroObject @ avcodec.h:1959:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_PROFILE_MJPEG_HUFFMAN_LOSSLESS = 195;

        // MacroObject @ avcodec.h:599:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_COMPRESSION_DEFAULT = -1;

        // MacroObject @ avcodec.h:933:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_CMP_SATD = 2;

        // MacroObject @ cpu.h:50:9
        //	x86_64-pc-windows-msvc (libavutil\cpu.h)
        public const int32 AV_CPU_FLAG_AVXSLOW = 134217728;

        // MacroObject @ avcodec.h:1911:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_PROFILE_H264_HIGH_444_INTRA = 2292;

        // MacroObject @ version.h:31:9
        //	x86_64-pc-windows-msvc (libavcodec\version.h)
        public const int32 LIBAVCODEC_VERSION_MINOR = 91;

        // MacroObject @ avformat.h:1488:9
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        public const int32 AVFMT_FLAG_MP4A_LATM = 32768;

        // MacroObject @ channel_layout.h:54:9
        //	x86_64-pc-windows-msvc (libavutil\channel_layout.h)
        public const int32 AV_CH_BACK_RIGHT = 32;

        // MacroObject @ version.h:30:9
        //	x86_64-pc-windows-msvc (libavcodec\version.h)
        public const int32 LIBAVCODEC_VERSION_MAJOR = 58;

        // MacroObject @ version.h:42:9
        //	x86_64-pc-windows-msvc (libavdevice\version.h)
        public static String LIBAVDEVICE_IDENT = "Lavd58.10.100";

        // MacroObject @ avcodec.h:940:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_CMP_VSSE = 9;

        // MacroObject @ version.h:83:9
        //	x86_64-pc-windows-msvc (libavutil\version.h)
        public const int32 LIBAVUTIL_VERSION_MICRO = 100;

        // MacroObject @ version.h:55:9
        //	x86_64-pc-windows-msvc (libavcodec\version.h)
        public const CBool FF_API_LOWRES = 1;

        // MacroObject @ avformat.h:475:9
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        public const int32 AVFMT_TS_NEGATIVE = 262144;

        // MacroObject @ opt.h:284:9
        //	x86_64-pc-windows-msvc (libavutil\opt.h)
        public const int32 AV_OPT_FLAG_EXPORT = 64;

        // MacroObject @ avcodec.h:1954:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_PROFILE_AV1_PROFESSIONAL = 2;

        // MacroObject @ avcodec.h:1972:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_PROFILE_ARIB_PROFILE_C = 1;

        // MacroObject @ avcodec.h:1867:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_PROFILE_AAC_HE = 4;

        // MacroObject @ codec.h:44:9
        //	x86_64-pc-windows-msvc (libavcodec\codec.h)
        public const int32 AV_CODEC_CAP_DRAW_HORIZ_BAND = 1;

        // MacroObject @ avcodec.h:1437:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_CODER_TYPE_RAW = 2;

        // MacroObject @ avcodec.h:1625:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_DEBUG_STARTCODE = 256;

        // MacroObject @ codec.h:75:9
        //	x86_64-pc-windows-msvc (libavcodec\codec.h)
        public const int32 AV_CODEC_CAP_DELAY = 32;

        // MacroObject @ avcodec.h:938:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_CMP_ZERO = 7;

        // MacroObject @ mathematics.h:49:9
        //	x86_64-pc-windows-msvc (libavutil\mathematics.h)
        public const double M_PHI = 1.618033988749895;

        // MacroObject @ avformat.h:1475:9
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        public const int32 AVFMT_FLAG_NOPARSE = 32;

        // MacroObject @ opt.h:579:9
        //	x86_64-pc-windows-msvc (libavutil\opt.h)
        public const int32 AV_OPT_MULTI_COMPONENT_RANGE = 4096;

        // MacroObject @ avio.h:539:9
        //	x86_64-pc-windows-msvc (libavformat\avio.h)
        public const int32 AVSEEK_FORCE = 131072;

        // MacroObject @ version.h:32:9
        //	x86_64-pc-windows-msvc (libavdevice\version.h)
        public const int32 LIBAVDEVICE_VERSION_MICRO = 100;

        // MacroObject @ channel_layout.h:100:9
        //	x86_64-pc-windows-msvc (libavutil\channel_layout.h)
        public const int32 AV_CH_LAYOUT_6POINT0_FRONT = 1731;

        // MacroObject @ avcodec.h:1947:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_PROFILE_HEVC_MAIN = 1;

        // MacroObject @ avcodec.h:1575:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_BUG_IEDGE = 32768;

        // MacroObject @ channel_layout.h:70:9
        //	x86_64-pc-windows-msvc (libavutil\channel_layout.h)
        public const ulong AV_CH_WIDE_RIGHT = 4294967296;

        // MacroObject @ avcodec.h:2606:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 AV_HWACCEL_FLAG_ALLOW_PROFILE_MISMATCH = 4;

        // MacroObject @ avformat.h:803:9
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        public const int32 AVINDEX_KEYFRAME = 1;

        // MacroObject @ avformat.h:2510:9
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        public const int32 AVSTREAM_INIT_IN_INIT_OUTPUT = 1;

        // MacroObject @ avcodec.h:403:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 AV_CODEC_EXPORT_DATA_MVS = 1;

        // MacroObject @ version.h:139:9
        //	x86_64-pc-windows-msvc (libavcodec\version.h)
        public const CBool FF_API_OPENH264_SLICE_MODE = 1;

        // MacroObject @ version.h:104:9
        //	x86_64-pc-windows-msvc (libavformat\version.h)
        public const CBool FF_API_LAVF_MP4A_LATM = 1;

        // MacroObject @ avcodec.h:271:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 AV_CODEC_FLAG_UNALIGNED = 1;

        // MacroObject @ channel_layout.h:52:9
        //	x86_64-pc-windows-msvc (libavutil\channel_layout.h)
        public const int32 AV_CH_LOW_FREQUENCY = 8;

        // MacroObject @ avcodec.h:1890:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_PROFILE_MPEG2_SS = 2;

        // MacroObject @ version.h:91:9
        //	x86_64-pc-windows-msvc (libavcodec\version.h)
        public const CBool FF_API_STAT_BITS = 1;

        // MacroObject @ cpu.h:53:9
        //	x86_64-pc-windows-msvc (libavutil\cpu.h)
        public const int32 AV_CPU_FLAG_CMOV = 4096;

        // MacroObject @ avcodec.h:1623:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_DEBUG_DCT_COEFF = 64;

        // MacroObject @ version.h:107:9
        //	x86_64-pc-windows-msvc (libavformat\version.h)
        public const CBool FF_API_AVIOFORMAT = 1;

        // MacroObject @ avcodec.h:1624:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_DEBUG_SKIP = 128;

        // MacroObject @ channel_layout.h:60:9
        //	x86_64-pc-windows-msvc (libavutil\channel_layout.h)
        public const int32 AV_CH_TOP_CENTER = 2048;

        // MacroObject @ codec.h:80:9
        //	x86_64-pc-windows-msvc (libavcodec\codec.h)
        public const int32 AV_CODEC_CAP_SMALL_LAST_FRAME = 64;

        // MacroObject @ version.h:130:9
        //	x86_64-pc-windows-msvc (libavcodec\version.h)
        public const CBool FF_API_LOCKMGR = 1;

        // MacroObject @ opt.h:291:9
        //	x86_64-pc-windows-msvc (libavutil\opt.h)
        public const int32 AV_OPT_FLAG_RUNTIME_PARAM = 32768;

        // MacroObject @ avcodec.h:1898:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_PROFILE_H264_BASELINE = 66;

        // MacroObject @ cpu.h:72:9
        //	x86_64-pc-windows-msvc (libavutil\cpu.h)
        public const int32 AV_CPU_FLAG_SETEND = 65536;

        // MacroObject @ channel_layout.h:102:9
        //	x86_64-pc-windows-msvc (libavutil\channel_layout.h)
        public const int32 AV_CH_LAYOUT_6POINT1 = 1807;

        // MacroObject @ avcodec.h:1916:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_PROFILE_VC1_COMPLEX = 2;

        // MacroObject @ channel_layout.h:98:9
        //	x86_64-pc-windows-msvc (libavutil\channel_layout.h)
        public const int32 AV_CH_LAYOUT_5POINT1_BACK = 63;

        // MacroObject @ swscale.h:67:9
        //	x86_64-pc-windows-msvc (libswscale\swscale.h)
        public const int32 SWS_LANCZOS = 512;

        // MacroObject @ avformat.h:860:9
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        public const int32 MAX_STD_TIMEBASES = 399;

        // MacroObject @ dict.h:77:9
        //	x86_64-pc-windows-msvc (libavutil\dict.h)
        public const int32 AV_DICT_APPEND = 32;

        // MacroObject @ avcodec.h:1015:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_MB_DECISION_SIMPLE = 0;

        // MacroObject @ swscale.h:60:9
        //	x86_64-pc-windows-msvc (libswscale\swscale.h)
        public const int32 SWS_BICUBIC = 4;

        // MacroObject @ avcodec.h:371:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 AV_CODEC_FLAG2_IGNORE_CROP = 65536;

        // MacroObject @ avformat.h:2501:9
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        public const int32 AVSEEK_FLAG_ANY = 4;

        // MacroObject @ avcodec.h:1893:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_PROFILE_MPEG2_SIMPLE = 5;

        // MacroObject @ swscale.h:95:9
        //	x86_64-pc-windows-msvc (libswscale\swscale.h)
        public const int32 SWS_CS_DEFAULT = 5;

        // MacroObject @ version.h:46:9
        //	x86_64-pc-windows-msvc (libavformat\version.h)
        public static String LIBAVFORMAT_IDENT = "Lavf58.45.100";

        // MacroObject @ avformat.h:469:9
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        public const int32 AVFMT_NOGENSEARCH = 16384;

        // MacroObject @ avcodec.h:1634:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_DEBUG_THREADS = 65536;

        // MacroObject @ log.h:374:9
        //	x86_64-pc-windows-msvc (libavutil\log.h)
        public const int32 AV_LOG_PRINT_LEVEL = 2;

        // MacroObject @ channel_layout.h:96:9
        //	x86_64-pc-windows-msvc (libavutil\channel_layout.h)
        public const int32 AV_CH_LAYOUT_5POINT1 = 1551;

        // MacroObject @ channel_layout.h:61:9
        //	x86_64-pc-windows-msvc (libavutil\channel_layout.h)
        public const int32 AV_CH_TOP_FRONT_LEFT = 4096;

        // MacroObject @ cpu.h:35:9
        //	x86_64-pc-windows-msvc (libavutil\cpu.h)
        public const int32 AV_CPU_FLAG_SSE = 8;

        // MacroObject @ channel_layout.h:51:9
        //	x86_64-pc-windows-msvc (libavutil\channel_layout.h)
        public const int32 AV_CH_FRONT_CENTER = 4;

        // MacroObject @ avcodec.h:1741:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_IDCT_SIMPLENEON = 22;

        // MacroObject @ avcodec.h:317:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 AV_CODEC_FLAG_TRUNCATED = 65536;

        // MacroObject @ channel_layout.h:99:9
        //	x86_64-pc-windows-msvc (libavutil\channel_layout.h)
        public const int32 AV_CH_LAYOUT_6POINT0 = 1799;

        // MacroObject @ avformat.h:848:9
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        public const int32 AV_DISPOSITION_DESCRIPTIONS = 131072;

        // MacroObject @ version.h:36:9
        //	x86_64-pc-windows-msvc (libavformat\version.h)
        public const int32 LIBAVFORMAT_VERSION_MICRO = 100;

        // MacroObject @ avformat.h:451:9
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        public const int32 AVPROBE_SCORE_EXTENSION = 50;

        // MacroObject @ version.h:109:9
        //	x86_64-pc-windows-msvc (libavutil\version.h)
        public const CBool FF_API_VAAPI = 1;

        // MacroObject @ avcodec.h:1953:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_PROFILE_AV1_HIGH = 1;

        // MacroObject @ version.h:142:9
        //	x86_64-pc-windows-msvc (libavcodec\version.h)
        public const CBool FF_API_OPENH264_CABAC = 1;

        // MacroObject @ opt.h:558:9
        //	x86_64-pc-windows-msvc (libavutil\opt.h)
        public const int32 AV_OPT_SEARCH_CHILDREN = 1;

        // MacroObject @ avcodec.h:1869:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_PROFILE_AAC_LD = 22;

        // MacroObject @ version.h:94:9
        //	x86_64-pc-windows-msvc (libavcodec\version.h)
        public const CBool FF_API_PRIVATE_OPT = 1;

        // MacroObject @ version.h:41:9
        //	x86_64-pc-windows-msvc (libswscale\version.h)
        public static String LIBSWSCALE_IDENT = "SwS5.7.100";

        // MacroObject @ cpu.h:49:9
        //	x86_64-pc-windows-msvc (libavutil\cpu.h)
        public const int32 AV_CPU_FLAG_AVX = 16384;

        // MacroObject @ avcodec.h:312:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 AV_CODEC_FLAG_PSNR = 32768;

        // MacroObject @ codec.h:138:9
        //	x86_64-pc-windows-msvc (libavcodec\codec.h)
        public const int32 AV_CODEC_CAP_INTRA_ONLY = 1073741824;

        // MacroObject @ avcodec.h:1720:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_DCT_MMX = 3;

        // MacroObject @ log.h:176:9
        //	x86_64-pc-windows-msvc (libavutil\log.h)
        public const int32 AV_LOG_ERROR = 16;

        // MacroObject @ codec.h:110:9
        //	x86_64-pc-windows-msvc (libavcodec\codec.h)
        public const int32 AV_CODEC_CAP_SLICE_THREADS = 8192;

        // MacroObject @ version.h:112:9
        //	x86_64-pc-windows-msvc (libavformat\version.h)
        public const int32 FF_API_R_FRAME_RATE = 1;

        // MacroObject @ codec_desc.h:97:9
        //	x86_64-pc-windows-msvc (libavcodec\codec_desc.h)
        public const int32 AV_CODEC_PROP_BITMAP_SUB = 65536;

        // MacroObject @ avcodec.h:304:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 AV_CODEC_FLAG_LOOP_FILTER = 2048;

        // MacroObject @ avcodec.h:1932:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_PROFILE_MPEG4_ADVANCED_SCALABLE_TEXTURE = 13;

        // MacroObject @ channel_layout.h:90:9
        //	x86_64-pc-windows-msvc (libavutil\channel_layout.h)
        public const int32 AV_CH_LAYOUT_3POINT1 = 15;

        // MacroObject @ codec.h:51:9
        //	x86_64-pc-windows-msvc (libavcodec\codec.h)
        public const int32 AV_CODEC_CAP_TRUNCATED = 8;

        // MacroObject @ log.h:158:9
        //	x86_64-pc-windows-msvc (libavutil\log.h)
        public const int32 AV_LOG_QUIET = -8;

        // MacroObject @ cpu.h:48:9
        //	x86_64-pc-windows-msvc (libavutil\cpu.h)
        public const int32 AV_CPU_FLAG_AESNI = 524288;

        // MacroObject @ avcodec.h:1920:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_PROFILE_MPEG4_SIMPLE_SCALABLE = 1;

        // MacroObject @ version.h:124:9
        //	x86_64-pc-windows-msvc (libavutil\version.h)
        public const CBool FF_API_CRYPTO_SIZE_T = 1;

        // MacroObject @ avformat.h:465:9
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        public const int32 AVFMT_FPS = 1024;

        // MacroObject @ opt.h:292:9
        //	x86_64-pc-windows-msvc (libavutil\opt.h)
        public const int32 AV_OPT_FLAG_FILTERING_PARAM = 65536;

        // MacroObject @ avcodec.h:1925:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_PROFILE_MPEG4_SIMPLE_FACE_ANIMATION = 6;

        // MacroObject @ log.h:202:9
        //	x86_64-pc-windows-msvc (libavutil\log.h)
        public const int32 AV_LOG_TRACE = 56;

        // MacroObject @ cpu.h:71:9
        //	x86_64-pc-windows-msvc (libavutil\cpu.h)
        public const int32 AV_CPU_FLAG_VFP_VM = 128;

        // MacroObject @ opt.h:280:9
        //	x86_64-pc-windows-msvc (libavutil\opt.h)
        public const int32 AV_OPT_FLAG_SUBTITLE_PARAM = 32;

        // MacroObject @ version.h:32:9
        //	x86_64-pc-windows-msvc (libavcodec\version.h)
        public const int32 LIBAVCODEC_VERSION_MICRO = 100;

        // MacroObject @ avcodec.h:1861:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_PROFILE_RESERVED = -100;

        // MacroObject @ avcodec.h:1910:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_PROFILE_H264_HIGH_444_PREDICTIVE = 244;

        // MacroObject @ channel_layout.h:78:9
        //	x86_64-pc-windows-msvc (libavutil\channel_layout.h)
        public const ulong AV_CH_LAYOUT_NATIVE = 9223372036854775808;

        // MacroObject @ log.h:366:9
        //	x86_64-pc-windows-msvc (libavutil\log.h)
        public const int32 AV_LOG_SKIP_REPEATED = 1;

        // MacroObject @ avcodec.h:1966:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_PROFILE_PRORES_STANDARD = 2;

        // MacroObject @ avcodec.h:1938:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_PROFILE_JPEG2000_CSTREAM_NO_RESTRICTION = 32768;

        // MacroObject @ avformat.h:1479:9
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        public const int32 AVFMT_FLAG_FLUSH_PACKETS = 512;

        // MacroObject @ frame.h:301:9
        //	x86_64-pc-windows-msvc (libavutil\frame.h)
        public const int32 AV_NUM_DATA_POINTERS = 8;

        // MacroObject @ avcodec.h:1904:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_PROFILE_H264_HIGH_10_INTRA = 2158;

        // MacroObject @ cpu.h:57:9
        //	x86_64-pc-windows-msvc (libavutil\cpu.h)
        public const int32 AV_CPU_FLAG_BMI2 = 262144;

        // MacroObject @ avcodec.h:388:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 AV_CODEC_FLAG2_RO_FLUSH_NOOP = 1073741824;

        // MacroObject @ avcodec.h:2586:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 AV_HWACCEL_FLAG_IGNORE_LEVEL = 1;

        // MacroObject @ avformat.h:470:9
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        public const int32 AVFMT_NO_BYTE_SEEK = 32768;

        // MacroObject @ avformat.h:1671:9
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        public const int32 AVFMT_AVOID_NEG_TS_MAKE_NON_NEGATIVE = 1;

        // MacroObject @ avcodec.h:2576:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 AV_HWACCEL_CODEC_CAP_EXPERIMENTAL = 512;

        // MacroObject @ avformat.h:1490:9
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        public const int32 AVFMT_FLAG_SORT_DTS = 65536;

        // MacroObject @ avcodec.h:1633:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_DEBUG_BUFFERS = 32768;

        // MacroObject @ channel_layout.h:65:9
        //	x86_64-pc-windows-msvc (libavutil\channel_layout.h)
        public const int32 AV_CH_TOP_BACK_CENTER = 65536;

        // MacroObject @ avcodec.h:1635:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_DEBUG_GREEN_MD = 8388608;

        // MacroObject @ avcodec.h:1572:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_BUG_DC_CLIP = 4096;

        // MacroObject @ avformat.h:448:9
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        public const int32 AVPROBE_SCORE_RETRY = 25;

        // MacroObject @ avcodec.h:1905:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_PROFILE_H264_MULTIVIEW_HIGH = 118;

        // MacroObject @ codec_desc.h:102:9
        //	x86_64-pc-windows-msvc (libavcodec\codec_desc.h)
        public const int32 AV_CODEC_PROP_TEXT_SUB = 131072;

        // MacroObject @ avcodec.h:1717:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_DCT_AUTO = 0;

        // MacroObject @ version.h:109:9
        //	x86_64-pc-windows-msvc (libavcodec\version.h)
        public const CBool FF_API_NVENC_OLD_NAME = 1;

        // MacroObject @ version.h:115:9
        //	x86_64-pc-windows-msvc (libavutil\version.h)
        public const CBool FF_API_PLUS1_MINUS1 = 1;

        // MacroObject @ avformat.h:825:9
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        public const int32 AV_DISPOSITION_HEARING_IMPAIRED = 128;

        // MacroObject @ avcodec.h:1870:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_PROFILE_AAC_ELD = 38;

        // MacroObject @ dict.h:70:9
        //	x86_64-pc-windows-msvc (libavutil\dict.h)
        public const int32 AV_DICT_IGNORE_SUFFIX = 2;

        // MacroObject @ avcodec.h:942:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_CMP_W53 = 11;

        // MacroObject @ channel_layout.h:89:9
        //	x86_64-pc-windows-msvc (libavutil\channel_layout.h)
        public const int32 AV_CH_LAYOUT_SURROUND = 7;

        // MacroObject @ error.h:83:9
        //	x86_64-pc-windows-msvc (libavutil\error.h)
        public const int32 AV_ERROR_MAX_STRING_SIZE = 64;

        // MacroObject @ cpu.h:62:9
        //	x86_64-pc-windows-msvc (libavutil\cpu.h)
        public const int32 AV_CPU_FLAG_POWER8 = 4;

        // MacroObject @ version.h:118:9
        //	x86_64-pc-windows-msvc (libavcodec\version.h)
        public const CBool FF_API_TAG_STRING = 1;

        // MacroObject @ channel_layout.h:91:9
        //	x86_64-pc-windows-msvc (libavutil\channel_layout.h)
        public const int32 AV_CH_LAYOUT_4POINT0 = 263;

        // MacroObject @ avcodec.h:1734:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_IDCT_ARM = 7;

        // MacroObject @ dict.h:76:9
        //	x86_64-pc-windows-msvc (libavutil\dict.h)
        public const int32 AV_DICT_DONT_OVERWRITE = 16;

        // MacroObject @ avcodec.h:941:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_CMP_NSSE = 10;

        // MacroObject @ swscale.h:90:9
        //	x86_64-pc-windows-msvc (libswscale\swscale.h)
        public const int32 SWS_CS_FCC = 4;

        // MacroObject @ avcodec.h:1942:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_PROFILE_VP9_0 = 0;

        // MacroObject @ avcodec.h:1964:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_PROFILE_PRORES_PROXY = 0;

        // MacroObject @ codec_desc.h:78:9
        //	x86_64-pc-windows-msvc (libavcodec\codec_desc.h)
        public const int32 AV_CODEC_PROP_LOSSY = 2;

        // MacroObject @ avcodec.h:1875:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_PROFILE_DNXHR_LB = 1;

        // MacroObject @ avio.h:701:9
        //	x86_64-pc-windows-msvc (libavformat\avio.h)
        public const int32 AVIO_FLAG_DIRECT = 32768;

        // MacroObject @ version.h:81:9
        //	x86_64-pc-windows-msvc (libavutil\version.h)
        public const int32 LIBAVUTIL_VERSION_MAJOR = 56;

        // MacroObject @ cpu.h:61:9
        //	x86_64-pc-windows-msvc (libavutil\cpu.h)
        public const int32 AV_CPU_FLAG_VSX = 2;

        // MacroObject @ avcodec.h:886:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_PRED_LEFT = 0;

        // MacroObject @ avformat.h:1474:9
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        public const int32 AVFMT_FLAG_NOFILLIN = 16;

        // MacroObject @ version.h:127:9
        //	x86_64-pc-windows-msvc (libavcodec\version.h)
        public const CBool FF_API_USER_VISIBLE_AVHWACCEL = 1;

        // MacroObject @ error.h:74:9
        //	x86_64-pc-windows-msvc (libavutil\error.h)
        public const int32 AVERROR_OUTPUT_CHANGED = -1668179714;

        // MacroObject @ avcodec.h:1917:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_PROFILE_VC1_ADVANCED = 3;

        // MacroObject @ avcodec.h:2236:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_SUB_TEXT_FMT_ASS_WITH_TIMINGS = 1;

        // MacroObject @ avcodec.h:1891:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_PROFILE_MPEG2_SNR_SCALABLE = 3;

        // MacroObject @ cpu.h:60:9
        //	x86_64-pc-windows-msvc (libavutil\cpu.h)
        public const int32 AV_CPU_FLAG_ALTIVEC = 1;

        // MacroObject @ channel_layout.h:101:9
        //	x86_64-pc-windows-msvc (libavutil\channel_layout.h)
        public const int32 AV_CH_LAYOUT_HEXAGONAL = 311;

        // MacroObject @ avformat.h:1496:9
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        public const int32 AVFMT_FLAG_SHORTEST = 1048576;

        // MacroObject @ opt.h:290:9
        //	x86_64-pc-windows-msvc (libavutil\opt.h)
        public const int32 AV_OPT_FLAG_BSF_PARAM = 256;

        // MacroObject @ avcodec.h:1983:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_LEVEL_UNKNOWN = -99;

        // MacroObject @ version.h:73:9
        //	x86_64-pc-windows-msvc (libavcodec\version.h)
        public const CBool FF_API_CONVERGENCE_DURATION = 1;

        // MacroObject @ avcodec.h:1738:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_IDCT_SIMPLEARMV5TE = 16;

        // MacroObject @ avformat.h:1493:9
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        public const int32 AVFMT_FLAG_KEEP_SIDE_DATA = 262144;

        // MacroObject @ version.h:65:9
        //	x86_64-pc-windows-msvc (libavformat\version.h)
        public const CBool FF_API_LAVF_AVCTX = 1;

        // MacroObject @ avformat.h:2499:9
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        public const int32 AVSEEK_FLAG_BACKWARD = 1;

        // MacroObject @ avcodec.h:1614:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_DEBUG_BITSTREAM = 4;

        // MacroObject @ avcodec.h:1906:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_PROFILE_H264_HIGH_422 = 122;

        // MacroObject @ avcodec.h:2592:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 AV_HWACCEL_FLAG_ALLOW_HIGH_DEPTH = 2;

        // MacroObject @ avformat.h:1287:9
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        public const int32 AVFMTCTX_NOHEADER = 1;

        // MacroObject @ avio.h:693:9
        //	x86_64-pc-windows-msvc (libavformat\avio.h)
        public const int32 AVIO_FLAG_NONBLOCK = 8;

        // MacroObject @ avformat.h:856:9
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        public const int32 AV_PTS_WRAP_IGNORE = 0;

        // MacroObject @ frame.h:598:9
        //	x86_64-pc-windows-msvc (libavutil\frame.h)
        public const int32 FF_DECODE_ERROR_CONCEALMENT_ACTIVE = 4;

        // MacroObject @ opt.h:277:9
        //	x86_64-pc-windows-msvc (libavutil\opt.h)
        public const int32 AV_OPT_FLAG_DECODING_PARAM = 2;

        // MacroObject @ error.h:72:9
        //	x86_64-pc-windows-msvc (libavutil\error.h)
        public const int32 AVERROR_EXPERIMENTAL = -733130664;

        // MacroObject @ mathematics.h:43:9
        //	x86_64-pc-windows-msvc (libavutil\mathematics.h)
        public const double M_LN10 = 2.302585092994046;

        // MacroObject @ channel_layout.h:53:9
        //	x86_64-pc-windows-msvc (libavutil\channel_layout.h)
        public const int32 AV_CH_BACK_LEFT = 16;

        // MacroObject @ avformat.h:462:9
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        public const int32 AVFMT_NOTIMESTAMPS = 128;

        // MacroObject @ avcodec.h:947:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_CMP_CHROMA = 256;

        // MacroObject @ avcodec.h:1435:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_CODER_TYPE_VLC = 0;

        // MacroObject @ avcodec.h:1436:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_CODER_TYPE_AC = 1;

        // MacroObject @ cpu.h:45:9
        //	x86_64-pc-windows-msvc (libavutil\cpu.h)
        public const int32 AV_CPU_FLAG_ATOM = 268435456;

        // MacroObject @ avcodec.h:1742:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_IDCT_NONE = 24;

        // MacroObject @ channel_layout.h:104:9
        //	x86_64-pc-windows-msvc (libavutil\channel_layout.h)
        public const int32 AV_CH_LAYOUT_6POINT1_FRONT = 1739;

        // MacroObject @ opt.h:294:9
        //	x86_64-pc-windows-msvc (libavutil\opt.h)
        public const int32 AV_OPT_FLAG_CHILD_CONSTS = 262144;

        // MacroObject @ avcodec.h:1899:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_PROFILE_H264_CONSTRAINED_BASELINE = 578;

        // MacroObject @ avcodec.h:1864:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_PROFILE_AAC_LOW = 1;

        // MacroObject @ avcodec.h:1907:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_PROFILE_H264_HIGH_422_INTRA = 2170;

        // MacroObject @ log.h:192:9
        //	x86_64-pc-windows-msvc (libavutil\log.h)
        public const int32 AV_LOG_VERBOSE = 40;

        // MacroObject @ avformat.h:1495:9
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        public const int32 AVFMT_FLAG_FAST_SEEK = 524288;

        // MacroObject @ avcodec.h:1666:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 AV_EF_EXPLODE = 8;

        // MacroObject @ avcodec.h:384:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 AV_CODEC_FLAG2_SKIP_MANUAL = 536870912;

        // MacroObject @ version.h:82:9
        //	x86_64-pc-windows-msvc (libavcodec\version.h)
        public const CBool FF_API_RTP_CALLBACK = 1;

        // MacroObject @ cpu.h:33:9
        //	x86_64-pc-windows-msvc (libavutil\cpu.h)
        public const int32 AV_CPU_FLAG_MMX2 = 2;

        // MacroObject @ avformat.h:467:9
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        public const int32 AVFMT_NOSTREAMS = 4096;

        // MacroObject @ avcodec.h:1592:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_COMPLIANCE_NORMAL = 0;

        // MacroObject @ cpu.h:31:9
        //	x86_64-pc-windows-msvc (libavutil\cpu.h)
        public const int32 AV_CPU_FLAG_MMX = 1;

        // MacroObject @ avcodec.h:367:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 AV_CODEC_FLAG2_CHUNKS = 32768;

        // MacroObject @ packet.h:407:9
        //	x86_64-pc-windows-msvc (libavcodec\packet.h)
        public const int32 AV_PKT_FLAG_DISPOSABLE = 16;

        // MacroObject @ avcodec.h:1908:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_PROFILE_H264_STEREO_HIGH = 128;

        // MacroObject @ avcodec.h:1903:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_PROFILE_H264_HIGH_10 = 110;

        // MacroObject @ cpu.h:70:9
        //	x86_64-pc-windows-msvc (libavutil\cpu.h)
        public const int32 AV_CPU_FLAG_ARMV8 = 64;

        // MacroObject @ avcodec.h:1612:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_DEBUG_PICT_INFO = 1;

        // MacroObject @ avformat.h:857:9
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        public const int32 AV_PTS_WRAP_ADD_OFFSET = 1;

        // MacroObject @ avcodec.h:1909:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_PROFILE_H264_HIGH_444 = 144;

        // MacroObject @ avcodec.h:361:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 AV_CODEC_FLAG2_DROP_FRAME_TIMECODE = 8192;

        // MacroObject @ version.h:79:9
        //	x86_64-pc-windows-msvc (libavcodec\version.h)
        public const CBool FF_API_AVPACKET_OLD_API = 1;

        // MacroObject @ avcodec.h:1895:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_PROFILE_H264_CONSTRAINED = 512;

        // MacroObject @ channel_layout.h:88:9
        //	x86_64-pc-windows-msvc (libavutil\channel_layout.h)
        public const int32 AV_CH_LAYOUT_2_1 = 259;

        // MacroObject @ avcodec.h:1732:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_IDCT_SIMPLE = 2;

        // MacroObject @ avcodec.h:343:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const uint32 AV_CODEC_FLAG_CLOSED_GOP = 2147483648;

        // MacroObject @ avcodec.h:1929:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_PROFILE_MPEG4_CORE_SCALABLE = 10;

        // MacroObject @ avcodec.h:1883:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_PROFILE_DTS_96_24 = 40;

        // MacroObject @ avcodec.h:1016:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_MB_DECISION_BITS = 1;

        // MacroObject @ swscale.h:87:9
        //	x86_64-pc-windows-msvc (libswscale\swscale.h)
        public const double SWS_MAX_REDUCE_CUTOFF = 0.002;

        // MacroObject @ avutil.h:227:9
        //	x86_64-pc-windows-msvc (libavutil\avutil.h)
        public const int32 FF_QP2LAMBDA = 118;

        // MacroObject @ avcodec.h:1863:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_PROFILE_AAC_MAIN = 0;

        // MacroObject @ opt.h:572:9
        //	x86_64-pc-windows-msvc (libavutil\opt.h)
        public const int32 AV_OPT_ALLOW_NULL = 4;

        // MacroObject @ channel_layout.h:105:9
        //	x86_64-pc-windows-msvc (libavutil\channel_layout.h)
        public const int32 AV_CH_LAYOUT_7POINT0 = 1591;

        // MacroObject @ avcodec.h:1960:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_PROFILE_MJPEG_JPEG_LS = 247;

        // MacroObject @ avcodec.h:3388:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 PARSER_FLAG_ONCE = 2;

        // MacroObject @ cpu.h:66:9
        //	x86_64-pc-windows-msvc (libavutil\cpu.h)
        public const int32 AV_CPU_FLAG_ARMV6T2 = 4;

        // MacroObject @ avformat.h:463:9
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        public const int32 AVFMT_GENERIC_INDEX = 256;

        // MacroObject @ avio.h:531:9
        //	x86_64-pc-windows-msvc (libavformat\avio.h)
        public const int32 AVSEEK_SIZE = 65536;

        // MacroObject @ avcodec.h:1915:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_PROFILE_VC1_MAIN = 1;

        // MacroObject @ avcodec.h:2192:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_CODEC_PROPERTY_LOSSLESS = 1;

        // MacroObject @ avcodec.h:1943:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_PROFILE_VP9_1 = 1;

        // MacroObject @ version.h:133:9
        //	x86_64-pc-windows-msvc (libavcodec\version.h)
        public const CBool FF_API_NEXT = 1;

        // MacroObject @ avcodec.h:1438:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_CODER_TYPE_RLE = 3;

        // MacroObject @ version.h:112:9
        //	x86_64-pc-windows-msvc (libavcodec\version.h)
        public const CBool FF_API_STRUCT_VAAPI_CONTEXT = 1;

        // MacroObject @ version.h:50:9
        //	x86_64-pc-windows-msvc (libswscale\version.h)
        public const CBool FF_API_SWS_VECTOR = 1;

        // MacroObject @ avformat.h:840:9
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        public const int32 AV_DISPOSITION_TIMED_THUMBNAILS = 2048;

        // MacroObject @ opt.h:276:9
        //	x86_64-pc-windows-msvc (libavutil\opt.h)
        public const int32 AV_OPT_FLAG_ENCODING_PARAM = 1;

        // MacroObject @ version.h:61:9
        //	x86_64-pc-windows-msvc (libavcodec\version.h)
        public const CBool FF_API_AVCTX_TIMEBASE = 1;

        // MacroObject @ avformat.h:1472:9
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        public const int32 AVFMT_FLAG_NONBLOCK = 4;

        // MacroObject @ swscale.h:70:9
        //	x86_64-pc-windows-msvc (libswscale\swscale.h)
        public const int32 SWS_SRC_V_CHR_DROP_MASK = 196608;

        // MacroObject @ avcodec.h:509:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 AV_GET_BUFFER_FLAG_REF = 1;

        // MacroObject @ avcodec.h:1006:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 SLICE_FLAG_ALLOW_FIELD = 2;

        // MacroObject @ version.h:34:9
        //	x86_64-pc-windows-msvc (libavformat\version.h)
        public const int32 LIBAVFORMAT_VERSION_MAJOR = 58;

        // MacroObject @ codec_desc.h:92:9
        //	x86_64-pc-windows-msvc (libavcodec\codec_desc.h)
        public const int32 AV_CODEC_PROP_REORDER = 8;

        // MacroObject @ avcodec.h:1007:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 SLICE_FLAG_ALLOW_PLANE = 4;

        // MacroObject @ avformat.h:1622:9
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        public const int32 FF_FDEBUG_TS = 1;

        // MacroObject @ avcodec.h:1569:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_BUG_DIRECT_BLOCKSIZE = 512;

        // MacroObject @ avcodec.h:1663:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 AV_EF_CRCCHECK = 1;

        // MacroObject @ dict.h:69:9
        //	x86_64-pc-windows-msvc (libavutil\dict.h)
        public const int32 AV_DICT_MATCH_CASE = 1;

        // MacroObject @ swscale.h:84:9
        //	x86_64-pc-windows-msvc (libswscale\swscale.h)
        public const int32 SWS_BITEXACT = 524288;

        // MacroObject @ swscale.h:91:9
        //	x86_64-pc-windows-msvc (libswscale\swscale.h)
        public const int32 SWS_CS_ITU601 = 5;

        // MacroObject @ codec_desc.h:72:9
        //	x86_64-pc-windows-msvc (libavcodec\codec_desc.h)
        public const int32 AV_CODEC_PROP_INTRA_ONLY = 1;

        // MacroObject @ avformat.h:1094:9
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        public const int32 MAX_REORDER_DELAY = 16;

        // MacroObject @ avcodec.h:945:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_CMP_DCT264 = 14;

        // MacroObject @ codec.h:150:9
        //	x86_64-pc-windows-msvc (libavcodec\codec.h)
        public const int32 AV_CODEC_CAP_HARDWARE = 262144;

        // MacroObject @ pixfmt.h:32:9
        //	x86_64-pc-windows-msvc (libavutil\pixfmt.h)
        public const int32 AVPALETTE_SIZE = 1024;

        // MacroObject @ cpu.h:55:9
        //	x86_64-pc-windows-msvc (libavutil\cpu.h)
        public const int32 AV_CPU_FLAG_FMA3 = 65536;

        // MacroObject @ avcodec.h:352:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 AV_CODEC_FLAG2_NO_OUTPUT = 4;

        // MacroObject @ avcodec.h:1743:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_IDCT_SIMPLEAUTO = 128;

        // MacroObject @ avcodec.h:1958:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_PROFILE_MJPEG_HUFFMAN_PROGRESSIVE_DCT = 194;

        // MacroObject @ channel_layout.h:66:9
        //	x86_64-pc-windows-msvc (libavutil\channel_layout.h)
        public const int32 AV_CH_TOP_BACK_RIGHT = 131072;

        // MacroObject @ channel_layout.h:58:9
        //	x86_64-pc-windows-msvc (libavutil\channel_layout.h)
        public const int32 AV_CH_SIDE_LEFT = 512;

        // MacroObject @ avcodec.h:1567:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_BUG_STD_QPEL = 128;

        // MacroObject @ codec.h:122:9
        //	x86_64-pc-windows-msvc (libavcodec\codec.h)
        public const int32 AV_CODEC_CAP_FRAME_SIZE = 65536;

        // MacroObject @ version.h:97:9
        //	x86_64-pc-windows-msvc (libavcodec\version.h)
        public const CBool FF_API_ASS_TIMING = 1;

        // MacroObject @ avcodec.h:1616:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_DEBUG_QP = 16;

        // MacroObject @ version.h:93:9
        //	x86_64-pc-windows-msvc (libavutil\version.h)
        public static String LIBAVUTIL_IDENT = "Lavu56.51.100";

        // MacroObject @ avcodec.h:1971:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_PROFILE_ARIB_PROFILE_A = 0;

        // MacroObject @ swscale.h:58:9
        //	x86_64-pc-windows-msvc (libswscale\swscale.h)
        public const int32 SWS_FAST_BILINEAR = 1;

        // MacroObject @ cpu.h:34:9
        //	x86_64-pc-windows-msvc (libavutil\cpu.h)
        public const int32 AV_CPU_FLAG_3DNOW = 4;

        // MacroObject @ avformat.h:815:9
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        public const int32 AV_DISPOSITION_COMMENT = 8;

        // MacroObject @ opt.h:278:9
        //	x86_64-pc-windows-msvc (libavutil\opt.h)
        public const int32 AV_OPT_FLAG_AUDIO_PARAM = 8;

        // MacroObject @ channel_layout.h:94:9
        //	x86_64-pc-windows-msvc (libavutil\channel_layout.h)
        public const int32 AV_CH_LAYOUT_QUAD = 51;

        // MacroObject @ swscale.h:75:9
        //	x86_64-pc-windows-msvc (libswscale\swscale.h)
        public const int32 SWS_PRINT_INFO = 4096;

        // MacroObject @ version.h:70:9
        //	x86_64-pc-windows-msvc (libavcodec\version.h)
        public const CBool FF_API_VDPAU_PROFILE = 1;

        // MacroObject @ avcodec.h:1721:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_DCT_ALTIVEC = 5;

        // MacroObject @ channel_layout.h:57:9
        //	x86_64-pc-windows-msvc (libavutil\channel_layout.h)
        public const int32 AV_CH_BACK_CENTER = 256;

        // MacroObject @ avcodec.h:356:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 AV_CODEC_FLAG2_LOCAL_HEADER = 8;

        // MacroObject @ avcodec.h:1796:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_THREAD_FRAME = 1;

        // MacroObject @ avformat.h:850:9
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        public const int32 AV_DISPOSITION_DEPENDENT = 524288;

        // MacroObject @ cpu.h:67:9
        //	x86_64-pc-windows-msvc (libavutil\cpu.h)
        public const int32 AV_CPU_FLAG_VFP = 8;

        // MacroObject @ avcodec.h:1590:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_COMPLIANCE_VERY_STRICT = 2;

        // MacroObject @ codec.h:102:9
        //	x86_64-pc-windows-msvc (libavcodec\codec.h)
        public const int32 AV_CODEC_CAP_CHANNEL_CONF = 1024;

        // MacroObject @ avcodec.h:2126:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_SUB_CHARENC_MODE_AUTOMATIC = 0;

        // MacroObject @ avcodec.h:275:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 AV_CODEC_FLAG_QSCALE = 2;

        // MacroObject @ swscale.h:82:9
        //	x86_64-pc-windows-msvc (libswscale\swscale.h)
        public const int32 SWS_DIRECT_BGR = 32768;

        // MacroObject @ version.h:95:9
        //	x86_64-pc-windows-msvc (libavformat\version.h)
        public const CBool FF_API_OLD_RTSP_OPTIONS = 1;

        // MacroObject @ avformat.h:1497:9
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        public const int32 AVFMT_FLAG_AUTO_BSF = 2097152;

        // MacroObject @ opt.h:844:9
        //	x86_64-pc-windows-msvc (libavutil\opt.h)
        public const int32 AV_OPT_SERIALIZE_SKIP_DEFAULTS = 1;

        // MacroObject @ avcodec.h:1940:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_PROFILE_JPEG2000_DCINEMA_4K = 4;

        // MacroObject @ avcodec.h:287:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 AV_CODEC_FLAG_QPEL = 16;

        // MacroObject @ avcodec.h:1664:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 AV_EF_BITSTREAM = 2;

        // MacroObject @ dict.h:79:9
        //	x86_64-pc-windows-msvc (libavutil\dict.h)
        public const int32 AV_DICT_MULTIKEY = 64;

        // MacroObject @ channel_layout.h:103:9
        //	x86_64-pc-windows-msvc (libavutil\channel_layout.h)
        public const int32 AV_CH_LAYOUT_6POINT1_BACK = 319;

        // MacroObject @ avformat.h:1672:9
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        public const int32 AVFMT_AVOID_NEG_TS_MAKE_ZERO = 2;

        // MacroObject @ version.h:100:9
        //	x86_64-pc-windows-msvc (libavcodec\version.h)
        public const CBool FF_API_OLD_BSF = 1;

        // MacroObject @ avcodec.h:1975:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_PROFILE_KLVA_ASYNC = 1;

        // MacroObject @ version.h:92:9
        //	x86_64-pc-windows-msvc (libavformat\version.h)
        public const CBool FF_API_FORMAT_FILENAME = 1;

        // MacroObject @ channel_layout.h:69:9
        //	x86_64-pc-windows-msvc (libavutil\channel_layout.h)
        public const ulong AV_CH_WIDE_LEFT = 2147483648;

        // MacroObject @ avcodec.h:1670:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 AV_EF_COMPLIANT = 131072;

        // MacroObject @ codec.h:93:9
        //	x86_64-pc-windows-msvc (libavcodec\codec.h)
        public const int32 AV_CODEC_CAP_SUBFRAMES = 256;

        // MacroObject @ avformat.h:804:9
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        public const int32 AVINDEX_DISCARD_FRAME = 2;

        // MacroObject @ version.h:31:9
        //	x86_64-pc-windows-msvc (libavdevice\version.h)
        public const int32 LIBAVDEVICE_VERSION_MINOR = 10;

        // MacroObject @ avcodec.h:1566:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_BUG_QPEL_CHROMA = 64;

        // MacroObject @ avcodec.h:1627:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_DEBUG_MMCO = 2048;

        // MacroObject @ avcodec.h:1962:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_PROFILE_SBC_MSBC = 1;

        // MacroObject @ avcodec.h:1885:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_PROFILE_DTS_HD_MA = 60;

        // MacroObject @ avformat.h:2500:9
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        public const int32 AVSEEK_FLAG_BYTE = 2;

        // MacroObject @ channel_layout.h:62:9
        //	x86_64-pc-windows-msvc (libavutil\channel_layout.h)
        public const int32 AV_CH_TOP_FRONT_CENTER = 8192;

        // MacroObject @ avformat.h:466:9
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        public const int32 AVFMT_NODIMENSIONS = 2048;

        // MacroObject @ codec_id.h:186:9
        //	x86_64-pc-windows-msvc (libavcodec\codec_id.h)
        public static AVCodecID AV_CODEC_ID_IFF_BYTERUN1 = (.)136;

        // MacroObject @ version.h:127:9
        //	x86_64-pc-windows-msvc (libavutil\version.h)
        public const CBool FF_API_FRAME_GET_SET = 1;

        // MacroObject @ avcodec.h:1934:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_PROFILE_MPEG4_ADVANCED_SIMPLE = 15;

        // MacroObject @ channel_layout.h:108:9
        //	x86_64-pc-windows-msvc (libavutil\channel_layout.h)
        public const int32 AV_CH_LAYOUT_7POINT1_WIDE = 1743;

        // MacroObject @ avcodec.h:1937:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_PROFILE_JPEG2000_CSTREAM_RESTRICTION_1 = 2;

        // MacroObject @ avcodec.h:1933:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_PROFILE_MPEG4_SIMPLE_STUDIO = 14;

        // MacroObject @ codec.h:98:9
        //	x86_64-pc-windows-msvc (libavcodec\codec.h)
        public const int32 AV_CODEC_CAP_EXPERIMENTAL = 512;

        // MacroObject @ version.h:82:9
        //	x86_64-pc-windows-msvc (libavutil\version.h)
        public const int32 LIBAVUTIL_VERSION_MINOR = 51;

        // MacroObject @ log.h:182:9
        //	x86_64-pc-windows-msvc (libavutil\log.h)
        public const int32 AV_LOG_WARNING = 24;

        // MacroObject @ swscale.h:94:9
        //	x86_64-pc-windows-msvc (libswscale\swscale.h)
        public const int32 SWS_CS_SMPTE240M = 7;

        // MacroObject @ avformat.h:812:9
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        public const int32 AV_DISPOSITION_DEFAULT = 1;

        // MacroObject @ cpu.h:37:9
        //	x86_64-pc-windows-msvc (libavutil\cpu.h)
        public const int32 AV_CPU_FLAG_SSE2SLOW = 1073741824;

        // MacroObject @ version.h:76:9
        //	x86_64-pc-windows-msvc (libavcodec\version.h)
        public const CBool FF_API_AVPICTURE = 1;

        // MacroObject @ avcodec.h:3380:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 AV_PARSER_PTS_NB = 4;

        // MacroObject @ avio.h:676:9
        //	x86_64-pc-windows-msvc (libavformat\avio.h)
        public const int32 AVIO_FLAG_READ_WRITE = 3;

        // MacroObject @ avcodec.h:1865:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_PROFILE_AAC_SSR = 2;

        // MacroObject @ avcodec.h:1573:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_BUG_MS = 8192;

        // MacroObject @ avformat.h:461:9
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        public const int32 AVFMT_GLOBALHEADER = 64;

        // MacroObject @ version.h:85:9
        //	x86_64-pc-windows-msvc (libavcodec\version.h)
        public const CBool FF_API_VBV_DELAY = 1;

        // MacroObject @ avformat.h:817:9
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        public const int32 AV_DISPOSITION_KARAOKE = 32;

        // MacroObject @ avcodec.h:1956:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_PROFILE_MJPEG_HUFFMAN_BASELINE_DCT = 192;

        // MacroObject @ cpu.h:28:9
        //	x86_64-pc-windows-msvc (libavutil\cpu.h)
        public const uint32 AV_CPU_FLAG_FORCE = 2147483648;

        // MacroObject @ error.h:73:9
        //	x86_64-pc-windows-msvc (libavutil\error.h)
        public const int32 AVERROR_INPUT_CHANGED = -1668179713;

        // MacroObject @ avcodec.h:1603:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_EC_DEBLOCK = 2;

        // MacroObject @ avcodec.h:3390:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 PARSER_FLAG_FETCHED_OFFSET = 4;

        // MacroObject @ avformat.h:1476:9
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        public const int32 AVFMT_FLAG_NOBUFFER = 64;

        // MacroObject @ mathematics.h:46:9
        //	x86_64-pc-windows-msvc (libavutil\mathematics.h)
        public const double M_LOG2_10 = 3.321928094887362;

        // MacroObject @ swscale.h:83:9
        //	x86_64-pc-windows-msvc (libswscale\swscale.h)
        public const int32 SWS_ACCURATE_RND = 262144;

        // MacroObject @ opt.h:845:9
        //	x86_64-pc-windows-msvc (libavutil\opt.h)
        public const int32 AV_OPT_SERIALIZE_OPT_FLAGS_EXACT = 2;

        // MacroObject @ swscale.h:71:9
        //	x86_64-pc-windows-msvc (libswscale\swscale.h)
        public const int32 SWS_SRC_V_CHR_DROP_SHIFT = 16;

        // MacroObject @ avcodec.h:1613:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_DEBUG_RC = 2;

        // MacroObject @ avformat.h:2893:9
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        public const int32 AV_FRAME_FILENAME_FLAGS_MULTIPLE = 1;

        // MacroObject @ avcodec.h:1884:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_PROFILE_DTS_HD_HRA = 50;

        // MacroObject @ version.h:89:9
        //	x86_64-pc-windows-msvc (libavformat\version.h)
        public const CBool FF_API_LAVF_FFSERVER = 1;

        // MacroObject @ avcodec.h:1574:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_BUG_TRUNCATED = 16384;

        // MacroObject @ frame.h:529:9
        //	x86_64-pc-windows-msvc (libavutil\frame.h)
        public const int32 AV_FRAME_FLAG_DISCARD = 4;

        // MacroObject @ codec.h:142:9
        //	x86_64-pc-windows-msvc (libavcodec\codec.h)
        public const uint32 AV_CODEC_CAP_LOSSLESS = 2147483648;

        // MacroObject @ avcodec.h:1872:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_PROFILE_MPEG2_AAC_HE = 131;

        // MacroObject @ avcodec.h:3387:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 PARSER_FLAG_COMPLETE_FRAMES = 1;

        // MacroObject @ avcodec.h:1878:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_PROFILE_DNXHR_HQX = 4;

        // MacroObject @ avformat.h:468:9
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        public const int32 AVFMT_NOBINSEARCH = 8192;

        // MacroObject @ version.h:83:9
        //	x86_64-pc-windows-msvc (libavformat\version.h)
        public const CBool FF_API_FORMAT_GET_SET = 1;

        // MacroObject @ avcodec.h:308:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 AV_CODEC_FLAG_GRAY = 8192;

        // MacroObject @ packet.h:388:9
        //	x86_64-pc-windows-msvc (libavcodec\packet.h)
        public const int32 AV_PKT_FLAG_KEY = 1;

        // MacroObject @ avformat.h:464:9
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        public const int32 AVFMT_TS_DISCONT = 512;

        // MacroObject @ packet.h:389:9
        //	x86_64-pc-windows-msvc (libavcodec\packet.h)
        public const int32 AV_PKT_FLAG_CORRUPT = 2;

        // MacroObject @ version.h:77:9
        //	x86_64-pc-windows-msvc (libavformat\version.h)
        public const CBool FF_API_LAVF_KEEPSIDE_FLAG = 1;

        // MacroObject @ mathematics.h:61:9
        //	x86_64-pc-windows-msvc (libavutil\mathematics.h)
        public const double M_SQRT2 = 1.4142135623730951;

        // MacroObject @ cpu.h:52:9
        //	x86_64-pc-windows-msvc (libavutil\cpu.h)
        public const int32 AV_CPU_FLAG_FMA4 = 2048;

        // MacroObject @ pixfmt.h:33:9
        //	x86_64-pc-windows-msvc (libavutil\pixfmt.h)
        public const int32 AVPALETTE_COUNT = 256;

        // MacroObject @ avcodec.h:1561:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_BUG_AUTODETECT = 1;

        // MacroObject @ avformat.h:2502:9
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        public const int32 AVSEEK_FLAG_FRAME = 8;

        // MacroObject @ avcodec.h:1901:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_PROFILE_H264_EXTENDED = 88;

        // MacroObject @ version.h:68:9
        //	x86_64-pc-windows-msvc (libavformat\version.h)
        public const CBool FF_API_HTTP_USER_AGENT = 1;

        // MacroObject @ avcodec.h:1889:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_PROFILE_MPEG2_HIGH = 1;

        // MacroObject @ log.h:163:9
        //	x86_64-pc-windows-msvc (libavutil\log.h)
        public const int32 AV_LOG_PANIC = 0;

        // MacroObject @ cpu.h:68:9
        //	x86_64-pc-windows-msvc (libavutil\cpu.h)
        public const int32 AV_CPU_FLAG_VFPV3 = 16;

        // MacroObject @ avformat.h:455:9
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        public const int32 AVPROBE_PADDING_SIZE = 32;

        // MacroObject @ avcodec.h:1967:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_PROFILE_PRORES_HQ = 3;

        // MacroObject @ avcodec.h:1900:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_PROFILE_H264_MAIN = 77;

        // MacroObject @ log.h:204:9
        //	x86_64-pc-windows-msvc (libavutil\log.h)
        public const int32 AV_LOG_MAX_OFFSET = 64;

        // MacroObject @ avcodec.h:1868:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_PROFILE_AAC_HE_V2 = 28;

        // MacroObject @ version.h:35:9
        //	x86_64-pc-windows-msvc (libavformat\version.h)
        public const int32 LIBAVFORMAT_VERSION_MINOR = 45;

        // MacroObject @ version.h:106:9
        //	x86_64-pc-windows-msvc (libavcodec\version.h)
        public const CBool FF_API_GET_CONTEXT_DEFAULTS = 1;

        // MacroObject @ dict.h:74:9
        //	x86_64-pc-windows-msvc (libavutil\dict.h)
        public const int32 AV_DICT_DONT_STRDUP_VAL = 8;

        // MacroObject @ channel_layout.h:92:9
        //	x86_64-pc-windows-msvc (libavutil\channel_layout.h)
        public const int32 AV_CH_LAYOUT_4POINT1 = 271;

        // MacroObject @ avformat.h:472:9
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        public const int32 AVFMT_TS_NONSTRICT = 131072;

        // MacroObject @ avcodec.h:1636:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_DEBUG_NOMC = 16777216;

        // MacroObject @ avutil.h:346:9
        //	x86_64-pc-windows-msvc (libavutil\avutil.h)
        public const int32 AV_FOURCC_MAX_STRING_SIZE = 32;

        // MacroObject @ avcodec.h:1919:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_PROFILE_MPEG4_SIMPLE = 0;

        // MacroObject @ avformat.h:449:9
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        public const int32 AVPROBE_SCORE_STREAM_RETRY = 24;

        // MacroObject @ avcodec.h:407:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 AV_CODEC_EXPORT_DATA_PRFT = 2;

        // MacroObject @ swscale.h:81:9
        //	x86_64-pc-windows-msvc (libswscale\swscale.h)
        public const int32 SWS_FULL_CHR_H_INP = 16384;

        // MacroObject @ avformat.h:452:9
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        public const int32 AVPROBE_SCORE_MIME = 75;

        // MacroObject @ mathematics.h:58:9
        //	x86_64-pc-windows-msvc (libavutil\mathematics.h)
        public const double M_SQRT1_2 = 0.7071067811865476;

        // MacroObject @ version.h:86:9
        //	x86_64-pc-windows-msvc (libavformat\version.h)
        public const CBool FF_API_OLD_AVIO_EOF_0 = 1;

        // MacroObject @ cpu.h:46:9
        //	x86_64-pc-windows-msvc (libavutil\cpu.h)
        public const int32 AV_CPU_FLAG_SSE4 = 256;

        // MacroObject @ cpu.h:36:9
        //	x86_64-pc-windows-msvc (libavutil\cpu.h)
        public const int32 AV_CPU_FLAG_SSE2 = 16;

        // MacroObject @ avconfig.h:4:9
        //	x86_64-pc-windows-msvc (libavutil\avconfig.h)
        public const int32 AV_HAVE_BIGENDIAN = 0;

        // MacroObject @ avcodec.h:1969:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_PROFILE_PRORES_XQ = 5;

        // MacroObject @ avcodec.h:1936:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_PROFILE_JPEG2000_CSTREAM_RESTRICTION_0 = 1;

        // MacroObject @ version.h:88:9
        //	x86_64-pc-windows-msvc (libavcodec\version.h)
        public const CBool FF_API_CODER_TYPE = 1;

        // MacroObject @ avcodec.h:1914:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_PROFILE_VC1_SIMPLE = 0;

        // MacroObject @ channel_layout.h:68:9
        //	x86_64-pc-windows-msvc (libavutil\channel_layout.h)
        public const int32 AV_CH_STEREO_RIGHT = 1073741824;

        // MacroObject @ avformat.h:816:9
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        public const int32 AV_DISPOSITION_LYRICS = 16;

        // MacroObject @ avformat.h:813:9
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        public const int32 AV_DISPOSITION_DUB = 2;

        // MacroObject @ avcodec.h:1628:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_DEBUG_BUGS = 4096;

        // MacroObject @ swscale.h:64:9
        //	x86_64-pc-windows-msvc (libswscale\swscale.h)
        public const int32 SWS_BICUBLIN = 64;

        // MacroObject @ swscale.h:79:9
        //	x86_64-pc-windows-msvc (libswscale\swscale.h)
        public const int32 SWS_FULL_CHR_H_INT = 8192;

        // MacroObject @ version.h:30:9
        //	x86_64-pc-windows-msvc (libavdevice\version.h)
        public const int32 LIBAVDEVICE_VERSION_MAJOR = 58;

        // MacroObject @ avformat.h:458:9
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        public const int32 AVFMT_NOFILE = 1;

        // MacroObject @ avio.h:40:9
        //	x86_64-pc-windows-msvc (libavformat\avio.h)
        public const int32 AVIO_SEEKABLE_NORMAL = 1;

        // MacroObject @ channel_layout.h:49:9
        //	x86_64-pc-windows-msvc (libavutil\channel_layout.h)
        public const int32 AV_CH_FRONT_LEFT = 1;

        // MacroObject @ swscale.h:62:9
        //	x86_64-pc-windows-msvc (libswscale\swscale.h)
        public const int32 SWS_POINT = 16;

        // MacroObject @ mathematics.h:37:9
        //	x86_64-pc-windows-msvc (libavutil\mathematics.h)
        public const double M_E = 2.718281828459045;

        // MacroObject @ codec.h:106:9
        //	x86_64-pc-windows-msvc (libavcodec\codec.h)
        public const int32 AV_CODEC_CAP_FRAME_THREADS = 4096;

        // MacroObject @ channel_layout.h:106:9
        //	x86_64-pc-windows-msvc (libavutil\channel_layout.h)
        public const int32 AV_CH_LAYOUT_7POINT0_FRONT = 1735;

        // MacroObject @ version.h:112:9
        //	x86_64-pc-windows-msvc (libavutil\version.h)
        public const CBool FF_API_FRAME_QP = 1;

        // MacroObject @ opt.h:289:9
        //	x86_64-pc-windows-msvc (libavutil\opt.h)
        public const int32 AV_OPT_FLAG_READONLY = 128;

        // MacroObject @ avutil.h:254:9
        //	x86_64-pc-windows-msvc (libavutil\avutil.h)
        public const int32 AV_TIME_BASE = 1000000;

        // MacroObject @ avcodec.h:1736:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_IDCT_SIMPLEARM = 10;

        // MacroObject @ avcodec.h:1922:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_PROFILE_MPEG4_MAIN = 3;

        // MacroObject @ channel_layout.h:72:9
        //	x86_64-pc-windows-msvc (libavutil\channel_layout.h)
        public const ulong AV_CH_SURROUND_DIRECT_RIGHT = 17179869184;

        // MacroObject @ swscale.h:93:9
        //	x86_64-pc-windows-msvc (libswscale\swscale.h)
        public const int32 SWS_CS_SMPTE170M = 5;

        // MacroObject @ cpu.h:47:9
        //	x86_64-pc-windows-msvc (libavutil\cpu.h)
        public const int32 AV_CPU_FLAG_SSE42 = 512;

        // MacroObject @ cpu.h:56:9
        //	x86_64-pc-windows-msvc (libavutil\cpu.h)
        public const int32 AV_CPU_FLAG_BMI1 = 131072;

        // MacroObject @ avcodec.h:376:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 AV_CODEC_FLAG2_SHOW_ALL = 4194304;

        // MacroObject @ avformat.h:1478:9
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        public const int32 AVFMT_FLAG_DISCARD_CORRUPT = 256;

        // MacroObject @ avcodec.h:1874:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_PROFILE_DNXHD = 0;

        // MacroObject @ version.h:124:9
        //	x86_64-pc-windows-msvc (libavcodec\version.h)
        public const CBool FF_API_CODEC_GET_SET = 1;

        // MacroObject @ mathematics.h:55:9
        //	x86_64-pc-windows-msvc (libavutil\mathematics.h)
        public const double M_PI_2 = 1.5707963267948966;

        // MacroObject @ avcodec.h:1735:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_IDCT_ALTIVEC = 8;

        // MacroObject @ avformat.h:1486:9
        //	x86_64-pc-windows-msvc (libavformat\avformat.h)
        public const int32 AVFMT_FLAG_BITEXACT = 1024;

        // MacroObject @ avcodec.h:1568:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_BUG_QPEL_CHROMA2 = 256;

        // MacroObject @ avcodec.h:1718:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_DCT_FASTINT = 1;

        // MacroObject @ avcodec.h:2234:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_SUB_TEXT_FMT_ASS = 0;

        // MacroObject @ avcodec.h:1877:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_PROFILE_DNXHR_HQ = 3;

        // MacroObject @ channel_layout.h:55:9
        //	x86_64-pc-windows-msvc (libavutil\channel_layout.h)
        public const int32 AV_CH_FRONT_LEFT_OF_CENTER = 64;

        // MacroObject @ avcodec.h:1570:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_BUG_EDGE = 1024;

        // MacroObject @ avcodec.h:1886:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_PROFILE_DTS_EXPRESS = 70;

        // MacroObject @ channel_layout.h:107:9
        //	x86_64-pc-windows-msvc (libavutil\channel_layout.h)
        public const int32 AV_CH_LAYOUT_7POINT1 = 1599;

        // MacroObject @ avcodec.h:1615:9
        //	x86_64-pc-windows-msvc (libavcodec\avcodec.h)
        public const int32 FF_DEBUG_MB_TYPE = 8;

        // MacroObject @ channel_layout.h:97:9
        //	x86_64-pc-windows-msvc (libavutil\channel_layout.h)
        public const int32 AV_CH_LAYOUT_5POINT0_BACK = 55;

        #endregion
    }
}