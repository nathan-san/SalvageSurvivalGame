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
	
	public class GameOver extends Sprite
	{
		[Embed(source = "../img/Gmae Over screen.png")]
		
		//[Embed(source="../img/gameover.png")]
		private var BackgroundImage:Class;
		private var bgImage:Bitmap;
		public var score:Scoreboard = new Scoreboard();
			public function GameOver()
			{
			this.addEventListener(Event.ADDED_TO_STAGE, init);
			 
			}
			
			
			private function init(e:Event = null):void
			{
			bgImage = new BackgroundImage();
			addChild(bgImage);
			this.addEventListener(Event.ENTER_FRAME, loop);
			this.scaleX = this.scaleY = 1.5;
			trace(score._score);
			}
			private function loop(e:Event):void
			{
				
			}
			public function keyDown(e:KeyboardEvent):void
			{
				if (e.keyCode == 32) {
					removeChild(this);
				}
			}
	}

}