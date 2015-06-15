package
{
import flash.display.Sprite;
import flash.display.MovieClip;
import flash.events.Event;
/**
* ...
* @author Nathan Nieuwenhuizen
*/
	public class Main extends Sprite
	{
		public var mainmenu:mainMenu;
			public function Main():void
			{
				
				if (stage) init();
				else addEventListener(Event.ADDED_TO_STAGE, init);
				
			}
			
			public function init(e:Event = null):void
			{	
				removeEventListener(Event.ADDED_TO_STAGE, init);
				
				mainmenu = new mainMenu();
				addChild(mainmenu);
				
				//this.addEventListener(Event.ENTER_FRAME, Loop);
				//this.addEventListener(MouseEvent.CLICK, onClick);
			}
			public function Loop(e:Event):void
			{
			}
			
	}
}