package entities
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	import net.flashpunk.graphics.Spritemap;
	
	public class Head extends Entity
	{
		public var spriteSheet:Spritemap;
		
		public var state:String;
		
		
		[Embed (source="res/head.png")] public static const TAPE_SPR:Class;
		public function Head()
		{
			super(x, y, graphic, mask);
			
			spriteSheet = new Spritemap(TAPE_SPR, 33, 42);

			graphic = spriteSheet;
			
			width = 33;
			height = 42;
			
				
			
		}
		
		public function goto(s:String):void{
			spriteSheet.play(s);	
		}

	}
}