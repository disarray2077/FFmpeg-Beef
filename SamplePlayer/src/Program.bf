using System;
using SDL2;

namespace SamplePlayer;

class Program
{
	public static int Main(String[] args)
	{
		if (args.IsEmpty)
			return 0;
		let app = scope PlayerApp(args[0]);
		app.Init();
		app.Run();
		return 0;
	}
}