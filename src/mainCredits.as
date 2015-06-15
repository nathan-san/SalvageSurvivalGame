package  
{
	/**
	 * ...
	 * @author Pim Horeman
	 */
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	
	public class mainCredits extends Sprite
	{
		
		[Embed(source="../img/credits_screen_bg.png")]
		
		private var backgroundImage:Class;
		private var bgImage:Bitmap;
		
		[Embed(source = "../img/tekstTest.png")]
		
		private var forgroundImage:Class;
		private var fgImage:Bitmap;
		
		private var main:Main;
		
		
		public function mainCredits()
			{
			this.addEventListener(Event.ADDED_TO_STAGE, init);
			 
			}
			
			private function init(e:Event = null):void
			{
			bgImage = new backgroundImage();
			addChild(bgImage);
			
			fgImage = new forgroundImage();
			addChild(fgImage);
			
			main = new Main();
			fgImage.x = 300;
			fgImage.y = 300;
			
			addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
			addEventListener(Event.ENTER_FRAME, loop);
			//this.scaleX = this.scaleY = 1;
			
			
			}
			private function loop(e:Event):void
			{
				
				fgImage.y -= 2;
				if (fgImage.y >=1080 || fgImage.y <=0)
				{
					addChild(main);
					//removeChild(mainCredits);
					
				}
			
			}
			
			
			public function keyDown(e:KeyboardEvent):void
			{
				if (e.keyCode == 32) {
					
					removeChild(this);
					
				}
			}
	}

}