package entities
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	import net.flashpunk.graphics.Spritemap;
	
	public class PlusMinButton extends Entity
	{
		public var spriteSheet:Spritemap;
		
		public var state:String;
		
		//posisi tujuan
		public var xt:Number;
		public var yt:Number;
		
		[Embed (source="res/btn.png")] public static const PLUSMIN_SPR:Class;
		public function PlusMinButton()
		{
			super(x, y, graphic, mask);
			
			spriteSheet = new Spritemap(PLUSMIN_SPR, 33, 33);
			
			spriteSheet.add("min", [0]);
			spriteSheet.add("plus", [1]);
			
			setHitbox(33, 33);
			
			graphic = spriteSheet;
			
			width = 33;
			height = 33;
			
				
			
		}
		
		public function goto(s:String):void{
			spriteSheet.play(s);	
		}
		
	}
}