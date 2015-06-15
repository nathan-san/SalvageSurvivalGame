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
	
	
	public class Black extends Sprite
	{
		[Embed(source="../img/black.png")]
		private var BackgroundImage:Class;
		private var bgImage:Bitmap;
		public var fadeSpeed:Number = 0.02;
		
			public function Black()
			{
			this.addEventListener(Event.ADDED_TO_STAGE, init);
			 
			}
			
			
			private function init(e:Event = null):void
			{
			bgImage = new BackgroundImage();
			addChild(bgImage);
			this.addEventListener(Event.ENTER_FRAME, loop);
			this.scaleX = this.scaleY = 8;
			this.alpha = 0.1;
			}
			private function loop(e:Event):void
			{
				this.alpha += fadeSpeed;
				
			}
			
	}

}