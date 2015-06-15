package  
{
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	/**
	 * ...
	 * @author Pim Horeman
	 */
	public class WaveCounter extends TextField
	{
		public var _waves:int;
		
		/*public function Wave(s:int)
		{
			_waves = s;
			if (_waves < 1)_waves = 1;
			this.text = "Wave: " + _waves;
		}*/
		
		public function get score():int
		{
			return _waves;
		}
		
		public function WaveCounter()
		{
			addEventListener(Event.ADDED_TO_STAGE, init)
		}
		
		private function init(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			this.defaultTextFormat = new TextFormat("Copperplate Gothic Bold", 35, 0x000000, true);
			this.width = stage.stageWidth;
			_waves = 1;
			this.text = "Wave: " + _waves;
			this.x = 30;
			this.y = 300;
		}
		public function Big():void
		{
			this.defaultTextFormat = new TextFormat("Copperplate Gothic Bold", 100, 0x00ff00, true);
			
			this.text = "Wave: " + _waves;
			this.x = 2000;
			this.y = 10;
		}
		public function Bigger():void
		{
			this.defaultTextFormat = new TextFormat("Copperplate Gothic Bold", 60, 0xffffff, true);
			this.text = "You've lasted until wave " + _waves+".";
			this.y = 850;
			this.x = 450;
		}
		public function Update():void
		{
			_waves += 1;
			this.text = "Wave: " + _waves;
		}
		public function startMoving():void
		{
			this.x = 2000;
			addEventListener(Event.ENTER_FRAME, loop);
		}
		public function stopMoving():void
		{
			removeEventListener(Event.ENTER_FRAME, loop);
		}
		private function loop(e:Event):void
		{
			this.x -= 10;
		}
		
	}

}