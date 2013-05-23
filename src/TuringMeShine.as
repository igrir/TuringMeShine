package
{	
	import entities.Tape;
	
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	import net.flashpunk.World;
	
	import worlds.TuringGame;
	
	[SWF(width="550", height="400")]
	
	public class TuringMeShine extends Engine
	{
		
		public var w_turingGame:TuringGame;
		
		public var tepo:Tape = new Tape();
		
		public function TuringMeShine()
		{
			super(550,400);
			
			
			w_turingGame = new TuringGame();
			FP.world = w_turingGame;
		}
	}
}