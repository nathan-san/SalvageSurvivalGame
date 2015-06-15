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
	
	
	public class Explosion extends Sprite
	{
		[Embed(source="../img/explosion.png")]
		private var BackgroundImage:Class;
		private var bgImage:Bitmap;
		
		
			public function Explosion()
			{
			this.addEventListener(Event.ADDED_TO_STAGE, init);
			 
			}
			
			
			private function init(e:Event = null):void
			{
				
			bgImage = new BackgroundImage();
			addChild(bgImage);
			bgImage.x = -100;
			bgImage.y = -100;
			
			this.addEventListener(Event.ENTER_FRAME, loop);
			this.scaleX = this.scaleY = 0.6;
			}
			private function loop(e:Event):void
			{
				this.alpha -= 0.05;
				this.scaleX = this.scaleY += 0.1;
				if (this.alpha <= 0.10)
				{
					this.removeEventListener(Event.ENTER_FRAME, loop);
					this.parent.removeChild(this);
				}
			}
			
	}

}