package  
{
	/**
	 * ...
	 * @author Nathan Nieuwenhuizen
	 */
	//import flash.display.Bitmap;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.KeyboardEvent;
	
	
	public class Bar extends Sprite
	{
		private var art:MovieClip;
		
			public function Bar()
			{
			art = new  inGameUI();
			
			addChild(art);
			//this.addEventListener(Event.ENTER_FRAME, loop);
			this.scaleX = this.scaleY = 2;
			this.alpha = 0.7;
			//addEventListener(Event.ADDED_TO_STAGE, init);
			 
			}
			
			
			//private function init(e:Event = null):void
			//{
			//bgImage = new BackgroundImage();
			//addChild(bgImage);
			//
			//}
			//private function loop(e:Event):void
			//{
				//
			//}
			
	}

}