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
	
	
	public class Red extends Sprite
	{
		[Embed(source="../img/red2.png")]
		private var BackgroundImage:Class;
		private var bgImage:Bitmap;
		public var fadeSpeed:Number = 0.02;
		
			public function Red()
			{
			this.addEventListener(Event.ADDED_TO_STAGE, init);
			 
			}
			
			
			private function init(e:Event = null):void
			{
			bgImage = new BackgroundImage();
			addChild(bgImage);
			//this.addEventListener(Event.ENTER_FRAME, loop);
			//this.scaleX = this.scaleY = 8;
			this.alpha = 0.0;
			}
			private function loop(e:Event):void
			{
				this.alpha += fadeSpeed;
				
			}
			
	}

}