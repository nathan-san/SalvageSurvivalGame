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
	public class Scoreboard extends TextField
	{
		public var _score:int;
		//var myFormat:TextFormat = new TextFormat();
		
		public function Score(s:int):void
		{
			_score = s;
			if (_score < 0)_score = 0;
			this.text = "Score : " + _score;
		}
		
		public function get score():int
		{
			return _score;
		}
		
		public function Scoreboard()
		{
			addEventListener(Event.ADDED_TO_STAGE, init)
		}
		
		private function init(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			/*myFormat.font = "Arial";
			myFormat.size = 35;
			myFormat.color = 0xff0000;
			myFormat.bold = true;*/
			this.defaultTextFormat =  new TextFormat("Copperplate Gothic Bold", 35, 0x000000, true);
			this.width = stage.stageWidth;
			this.text = "Score : " + _score;
			this.x = 30;
			this.y = 250;
		}
		public function Bigger():void
		{
			this.defaultTextFormat = new TextFormat("Copperplate Gothic Bold", 60, 0xffffff, true);
			this.text = "Your final score = " + _score;
			this.y = 750;
			this.x = 530;
		}
		public function Update():void
		{
			this.text = "Score : " + _score;
		}
		
	}

}