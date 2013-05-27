package entities
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	import net.flashpunk.graphics.Spritemap;
	
	public class Tape extends Entity
	{
		public var spriteSheet:Spritemap;
		
		public var state:String;
		
		//posisi tujuan
		public var xt:Number;
		public var yt:Number;
		
		[Embed (source="/../res/tape_spr.png")] public static const TAPE_SPR:Class;
		public function Tape()
		{
			super(x, y, graphic, mask);
			
			spriteSheet = new Spritemap(TAPE_SPR, 33, 100);
			
			spriteSheet.add("NONE", [0]);
			spriteSheet.add("1", [1]);
			spriteSheet.add("0", [2]);
			
			setHitbox(100, 100);
			
			graphic = spriteSheet;
			
			width = 33;
			height = 33;
			
				
			
		}
		
		public function goto(s:String):void{
			spriteSheet.play(s);	
			this.state = s;
		}
		
		override public function update():void{
			this.x = this.x-(this.x-xt)/5;
			this.y = this.y-(this.y-yt)/5;
		}
	}
}