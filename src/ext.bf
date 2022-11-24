namespace FFmpeg;

extension ffmpeg
{
	extension AVRational
	{
		public double Value => av_q2d(this);
	}

	public static double av_q2d(AVRational a)
	{
		return a.num / (double)a.den;
	}
}