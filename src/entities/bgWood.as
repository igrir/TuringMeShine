package entities
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	import net.flashpunk.graphics.Spritemap;
	
	public class bgWood extends Entity
	{
		
		public var spriteSheet:Spritemap;
		
		public var state:String;
		
		[Embed (source="/../res/bg.png")] public static const BG:Class;
		
		public function bgWood()
		{
//			super(x, y, graphic, mask);
			
			
			spriteSheet = new Spritemap(BG, 130, 62);			
			graphic = spriteSheet;
			
			width= 130;
			height = 62;
			
		}
	}
}