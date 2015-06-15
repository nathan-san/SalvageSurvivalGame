package  
{
	/**
	 * ...
	 * @author Nathan Nieuwenhuizen
	 */
	import flash.display.Bitmap;
	import flash.display.FrameLabel;
	import flash.display.Graphics;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	
	
	public class endShip extends MovieClip
	{
		private var art:MovieClip;
		public var g:Graphics;
			public function endShip() 
			{
			addEventListener(Event.ADDED_TO_STAGE, init);
			}
			
			
			private function init(e:Event = null):void
			{
			
			
			art = new MotherShipArt();
			addChild(art);
			art.x = -1100;
			art.y = -400;
			this.x = 2800;
			this.y = 1000;
		
			//g = this.graphics;
			//g.beginFill(0xFFFFFF,0.5);
			//g.drawCircle(100, 100, 1000);
			
			
			
			
			
			this.scaleX = this.scaleY = 0.7;
			}
			public function startMoving():void
			{
				addEventListener(Event.ENTER_FRAME, loop);
			}
			public function stopMoving():void
			{
				removeEventListener(Event.ENTER_FRAME, loop);
			}
			private function loop(e:Event):void
			{
				this.x -= 6;
				
			}
			
	}

}