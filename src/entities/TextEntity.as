package entities
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	import net.flashpunk.graphics.Text;
	
	public class TextEntity extends Entity
	{
		public var textScore:Text;
		
		public var texts:String = "";
		
		[Embed(source = 'res/EuphemiaCASBold.ttf', embedAsCFF="false", fontFamily = 'My Font')]
		private const MY_FONT:Class;
		
		public function TextEntity()
		{
			Text.font = "My Font";
			setHitbox(500,30);
			textScore = new Text("                                                          ", 0, 0);
			super(x, y, textScore);
			
			
			
			
			
		}
		
		public function setTexts(_texts:String):void{this.texts= _texts}
		public function getTexts():String{return this.texts}
		
		public function updateText():void
		{
			textScore.text = String(texts);
		}
	}
}