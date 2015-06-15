package  
{
	/**
	 * ...
	 * @author Nathan Nieuwenhuizen
	 */
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.ui.Mouse;

	
	
	public class ReturnButton extends Sprite
	{
		[Embed(source="../img/menu button.png")]
		private var BackgroundImage:Class;
		
		//[Embed(source = "../img/menubutton.png")]
		//[Embed(source = "../img/start.png")]
		[Embed(source="../img/Menu button hover over.png")]
		private var BackgroundImage2:Class;
		
		private var bgImage:Bitmap;
		private var bgImage2:Bitmap;
		public var hoover:Boolean = false;
		
		public function ReturnButton()
		{
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
			
			
		private function init(e:Event = null):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			bgImage = new BackgroundImage();
			bgImage2 = new BackgroundImage2();
			
			addChild(bgImage);
			addChild(bgImage2);
			bgImage2.scaleX = bgImage2.scaleY = 0.55;
			bgImage2.x = bgImage.x -50;
			bgImage2.y = bgImage.y -30;
			bgImage2.alpha = 0;
			
			this.x = 20;
			this.y = 100;
			addEventListener(MouseEvent.CLICK, onClick);
			addEventListener(Event.ENTER_FRAME, Loop);
		}
		private function onClick(e:MouseEvent):void 
		{
			if (mouseX >= this.x && mouseX <= this.x +this.width && mouseY >= this.y && mouseY <= this.y +this.height)
			{
				trace("wsferfh");
			}

		}
		public function endPosition():void
		{
			this.y = 650;
			this.x = 800;
		}
		private function Loop(e:Event):void
		{
			//if (this.hitTestObject(mouseX))
			//if (mouseX >= this.x && mouseX <= this.x +this.width && mouseY >= this.y -100 && mouseY <= this.y +this.height - 100)
			if (mouseX >= 0 && mouseX <= 200 && mouseY >= 0 && mouseY <= 100)
			{
				
				bgImage.alpha = 0;
				bgImage2.alpha = 1;
			}
			else
			{
				bgImage.alpha = 1;
				bgImage2.alpha = 0;
				this.scaleX = this.scaleY = 1;
			}
			
		}
		
	}
}