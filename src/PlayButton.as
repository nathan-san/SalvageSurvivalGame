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
	
	public class PlayButton extends Sprite
	{
		[Embed(source="../img/start.png")]
		private var BackgroundImage:Class;
		
		private var bgImage:Bitmap;
		
		[Embed(source="../img/start2.png")]
		private var BackgroundImage2:Class;
		
		
		private var bgImage2:Bitmap;
		
		
		public function PlayButton()
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
			bgImage2.x = bgImage.x -18;
			bgImage2.y = bgImage.y -15;
			bgImage2.alpha = 1;
			
			
			
			//this.scaleX = this.scaleY = 0.5;
			this.x = 800;
			this.y = 480;
			addEventListener(Event.ENTER_FRAME, Loop);
		}	
		private function Loop(e:Event):void
		{
			//if (this.hitTestObject(mouseX))
			//if(this.hitTestPoint(mouseX,mouseY))
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