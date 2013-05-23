package worlds
{
	import entities.Button;
	import entities.Head;
	import entities.Tape;
	import entities.bgWood;
	
	import net.flashpunk.World;
	
	
	public class TuringGame extends World
	{
		
		private var arr_tape:Array = new Array();
		private var e_head:Head = new Head();
		
		private var banyakTape:int = 100;
		private var tw:int = 33; //tape width, lebar dari sebuah tape
		private var plus_btn:Button;
		private var min_btn:Button;
		private var reset_btn:Button;
		private var one_btn:Button;
		private var zero_btn:Button;
		private var none_btn:Button;
		private var allone_btn:Button;
		private var allzero_btn:Button;
		private var allnone_btn:Button;
		private var current_head:int; //posisi head sekarang
		
		public function TuringGame()
		{
			super();

			trace("Turing Game");
	
			//initialization
			createTapes();
			plus_btn = new Button(this);
			min_btn = new Button(this); 
			reset_btn = new Button(this);
			one_btn = new Button(this);
			zero_btn = new Button(this);
			none_btn = new Button(this);
			allone_btn = new Button(this);
			allzero_btn = new Button(this);
			allnone_btn = new Button(this);
			
			//add to world
			addBackground();
			addTapes();
			add(e_head);
			add(plus_btn);
			add(min_btn);
			add(reset_btn);
			add(one_btn);
			add(zero_btn);
			add(none_btn);
			add(allone_btn);
			add(allzero_btn);
			add(allnone_btn);
			
			
			//set
			setTapesY(50);
			e_head.y = 50;
			
			//taruh head di posisi 56
			setTapesX(tw*-50);	//geser sejauh 50 blok
			e_head.x = tw*6;	//kemudian taruh di tengahnya (nomor 6)
			
			current_head = 50+6;	//posisi head ada di 56
			
			plus_btn.y 	= 100;
			min_btn.y 	= 100;
			reset_btn.y = 100;
			one_btn.y 	= 133;
			zero_btn.y 	= 133;
			none_btn.y 	= 133;
			allone_btn.y 	= 166;
			allzero_btn.y 	= 166;
			allnone_btn.y 	= 166;
			
			min_btn.x 	= 300;
			plus_btn.x 	= 333;
			reset_btn.x = 366;
			one_btn.x 	= 300;
			zero_btn.x 	= 333;
			none_btn.x 	= 366;
			allone_btn.x 	= 300;
			allzero_btn.x 	= 333;
			allnone_btn.x 	= 366;
			
			plus_btn.goto("plus");
			min_btn.goto("min");
			reset_btn.goto("reset");
			one_btn.goto("one");
			zero_btn.goto("zero");
			none_btn.goto("none");
			allone_btn.goto("allone");
			allzero_btn.goto("allzero");
			allnone_btn.goto("allnone");
			
			//mengisi semua tape jadi none
			setTapesValue("none");
			
			setTapesValueByArray([0,1,2,0,1,0,1,0,1,0,1,
						   0,1,2,0,1,0,1,0,1,0,1,
						   0,1,2,0,1,0,1,0,1,0,1,
						   0,1,2,0,1,0,1,0,1,0,1,
						   0,1,2,0,1,0,1,0,1,0,1,
						   0,1,2,0,1,0,1,0,1,0,1,
						   0,1,2,0,1,0,1,0,1,0,1,
						   0,1,2,0,1,0,1,0,1,0,1,
						   0,1,2,0,1,0,1,0,1,0,1,
						   0,1,2,0,1,0,1,0,1,0,1]);
			
		}
				
		public function setAllNone():void{
			var i:int;
			for (i = 0 ; i <banyakTape; i++) {
				var tape:Tape = (Tape)(arr_tape[i]);
				tape.goto("NONE");
			}
		}
		
		
		private function setTapesValueByArray(konten:Array):void{
			var i:int;
			for (i = 0 ; i <banyakTape; i++) {
				if (konten[i] == 0) {
					(Tape)(arr_tape[i]).goto("0");	
				}else if (konten[i] == 1) {
					(Tape)(arr_tape[i]).goto("1");	
				}else if (konten[i] == 2) {
					(Tape)(arr_tape[i]).goto("NONE");	
				}
				
			}
		}
		
		public function setTapesValue(value:String):void{
			var i:int;
			for (i = 0 ; i <banyakTape; i++) {
				var tape:Tape = (Tape)(arr_tape[i]);
				tape.goto(value);
			}
		}
		
		public function moveTapesX(step:int):void{
			var i:int;
			for (i = 0 ; i <banyakTape; i++) {
				var tape:Tape = (Tape)(arr_tape[i]);
				tape.xt += step*tape.width;
			}
			
			current_head += step*-1;
		}
		
		
		public function setTapesX(x:int):void{
			var i:int;
			for (i = 0 ; i <banyakTape; i++) {
				var tape:Tape = (Tape)(arr_tape[i]);
				tape.x = (i*tape.width)+x;
				tape.xt = tape.x;
			}
		}
		
		
		//set tapi animasi smooth
		public function setTapesXSmooth(x:int):void{
			var i:int;
			for (i = 0 ; i < banyakTape; i++) {
				var tape:Tape = (Tape)(arr_tape[i]);
				tape.xt = (i*tape.width)+x;
			}
		}
		
		public function setTapesY(y:int):void{
			var i:int;
			for (i = 0 ; i <banyakTape; i++) {
				var tape:Tape = (Tape)(arr_tape[i]);
				tape.y = y;
				tape.yt = tape.y; 
			}
		}
		
		public function createTapes():void{
			var i:int = 0;
			for (i = 0 ; i <banyakTape; i++) {
				var tape:Tape = new Tape();
				
				arr_tape[i] = tape;
			}
		}
		
		public function addTapes():void{
			var i:int = 0;
			for (i = 0 ; i <banyakTape; i++) {
				var tape:Tape = arr_tape[i];
				tape.x = i*tape.width;
				tape.y = 0;
				add(tape);
			}
		}
		
		private function addBackground():void{
			trace("add background");
			var i:int = 0;
			var j:int = 0;
			for (i = 0 ; i < 5; i++) {
				for (j = 0; j < 30; j++) {
					var e_bgWood:bgWood = new bgWood();
					e_bgWood.x = i*e_bgWood.width;
					e_bgWood.y = j*e_bgWood.height;
					add(e_bgWood);
					trace(e_bgWood);
				}
			}
		}
		
		//mengisi nilai tape
		public function setTape(value:String):void{
			if (current_head < banyakTape && current_head >=0) {
				var tape:Tape = arr_tape[current_head];
				tape.goto(value);	
			}
			
		}
		
		/*	CUSTOM CODE GOES FROM HERE */
		
		public function resetTapesPosition():void{
			setTapesXSmooth(tw*-50);
			current_head = 56;
		}
		
	}
}