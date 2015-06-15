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
	import flash.ui.Mouse;
	import flash.events.MouseEvent;
	import flash.display.MovieClip;

	
	public class RockCollission extends Rock3
	{
		
		private var art:MovieClip;
		

		
		
			public function RockCollission()
			{
			addEventListener(Event.ADDED_TO_STAGE, init);
			 
			}
			
			
			private function init(e:Event = null):void
			{
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
			//if (Math.random() <= 0.25)
			//{
				////art = new RockArt4();
				////art.scaleX = art.scaleY = 0.4;
			//}
			//else if (Math.random() <= 0.50 && Math.random() > 0.25)
			//{
				////art = new RockArt3();
				////art.scaleX = art.scaleY = 0.3;
			//}
			if (Math.random() >= 0.55)
			{
				art = new RockArt2();
			}
			else 
			{
				art = new RockArt();
			}	
			addChild(art);
		}
	}
}