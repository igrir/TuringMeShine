package entities
{
	import flash.ui.Mouse;
	
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	import net.flashpunk.World;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.utils.Input;
	
	import worlds.TuringGame;
	
	public class Button extends Entity
	{
		public var spriteSheet:Spritemap;
		
		public var state:String;
		
		//posisi tujuan
		public var xt:Number;
		public var yt:Number;
		
		public var listener:World;
		
		[Embed (source="res/btn.png")] public static const PLUSMIN_SPR:Class;
		public function Button(listener:World)
		{
			super(x, y, graphic, mask);
			
			this.listener = listener;
			
			spriteSheet = new Spritemap(PLUSMIN_SPR, 33, 33);
			
			spriteSheet.add("min", [0]);
			spriteSheet.add("plus", [1]);
			spriteSheet.add("reset", [2]);
			spriteSheet.add("one", [3]);
			spriteSheet.add("zero", [4]);
			spriteSheet.add("none", [5]);
			spriteSheet.add("allone", [6]);
			spriteSheet.add("allzero", [7]);
			spriteSheet.add("allnone", [8]);
			
			
			setHitbox(33, 33);
			
			graphic = spriteSheet;
			
			width = 33;
			height = 33;
			
				
			
		}
		
		public function goto(s:String):void{
			spriteSheet.play(s);	
		}
		
		override public function update():void{
			if (collidePoint(x,y, Input.mouseX, Input.mouseY)) {
				
				//mouseDown
				if (Input.mouseReleased) {
					if (spriteSheet.currentAnim == "min") {
						((TuringGame)(listener)).moveTapesX(-1);
					}else if (spriteSheet.currentAnim == "plus") {
						((TuringGame)(listener)).moveTapesX(1);
					}else if (spriteSheet.currentAnim == "reset") {
						((TuringGame)(listener)).resetTapesPosition();
					}else if (spriteSheet.currentAnim == "zero") {
						((TuringGame)(listener)).setTape("0");
					}else if (spriteSheet.currentAnim == "one") {
						((TuringGame)(listener)).setTape("1");
					}else if (spriteSheet.currentAnim == "none") {
						((TuringGame)(listener)).setTape("NONE");
					}else if (spriteSheet.currentAnim == "allnone") {
						((TuringGame)(listener)).setTapesValue("NONE");
					}else if (spriteSheet.currentAnim == "allone") {
						((TuringGame)(listener)).setTapesValue("1");
					}else if (spriteSheet.currentAnim == "allzero") {
						((TuringGame)(listener)).setTapesValue("0");
					}
					
				}
				
			}
		}
		
	}
}