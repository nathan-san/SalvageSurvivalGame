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
	
	public class Menu extends Sprite
	{
		[Embed(source="../img/titel.jpg")]
		private var BackgroundImage:Class;
		private var bgImage:Bitmap;
		
		[Embed(source="../img/tutorial2a.png")]
		private var BackgroundImage1:Class;
		private var bgImage1:Bitmap;
		
		[Embed(source="../img/tutorial2b.png")]
		private var BackgroundImage2:Class;
		private var bgImage2:Bitmap;
		
			public function Menu()
			{
			this.addEventListener(Event.ADDED_TO_STAGE, init);
			 
			}
			
			
			private function init(e:Event = null):void
			{
			bgImage = new BackgroundImage();
			addChild(bgImage);
			bgImage1 = new BackgroundImage1();
			addChild(bgImage1);
			bgImage1.scaleX = bgImage1.scaleY = 0.7;
			bgImage1.x = 50;
			bgImage1.y = 800;
			bgImage2 = new BackgroundImage2();
			addChild(bgImage2);
			bgImage2.scaleX = bgImage2.scaleY = 0.9;
			bgImage2.x = 2000;
			bgImage2.y = 800;
			this.addEventListener(Event.ENTER_FRAME, loop);
			this.y = -300;
			this.height = 1380;
			this.width = 1920;
			
			}
			private function loop(e:Event):void
			{
				//if (bgImage1.y <= 800)
				//{
					//bgImage1.y += 20;
				//}
				
				//this.removeEventListener(Event.ENTER_FRAME, loop);
			}
	}

}