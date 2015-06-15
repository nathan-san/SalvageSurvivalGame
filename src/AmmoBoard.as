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
	public class AmmoBoard extends TextField
	{
		public var _ammo:int = 9;
		public var _maxAmmo:int = 10;
		
		public function Ammo(s:int):void
		{
			_ammo = s;
			if (_ammo < 0)_ammo = 0;
			this.text = "Ammo: " + _ammo+"/"+_maxAmmo;
		}
		
		public function get score():int
		{
			return _ammo;
		}
		
		public function AmmoBoard()
		{
			addEventListener(Event.ADDED_TO_STAGE, init)
		}
		
		private function init(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			this.defaultTextFormat = new TextFormat("Copperplate Gothic Bold", 35, 0x000000, true);
			this.width = stage.stageWidth;
			this.text = "Ammo: " + _ammo+"/"+_maxAmmo;
			this.x = 30;
			this.y = 350;
			_ammo = 9;
			_maxAmmo = 10;
		}
		public function Update():void
		{	
			this.text = "Ammo: " + _ammo + "/" + _maxAmmo;
			if (_ammo == 10)
			{
				this.defaultTextFormat = new TextFormat("Copperplate Gothic Bold", 35, 0xff0000, true);
				this.text = "Ammo: " + _ammo + "/" + _maxAmmo;
			}
			else
			{
				this.defaultTextFormat = new TextFormat("Copperplate Gothic Bold", 35, 0x000000, true);
				this.text = "Ammo: " + _ammo + "/" + _maxAmmo;
			}
			
		}
		
		
	}

}