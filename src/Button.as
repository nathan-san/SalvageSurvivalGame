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
	
	
	public class Button extends Sprite
	{
		[Embed(source="../img/playbutton.png")]
		private var BackgroundImage:Class;
		private var bgImage:Bitmap;
		
		
		public function Button()
		{
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
			
			
		private function init(e:Event = null):void
		{
			bgImage = new BackgroundImage();
			addChild(bgImage);
			this.scaleX = this.scaleY = 0.5;
			this.x = 40;
			this.y = 100;
		}	
	}
}