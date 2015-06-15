package
{
import flash.display.Sprite;
import flash.events.Event;
//import flash.events.KeyboardEvent;
import flash.ui.Mouse;
import flash.events.MouseEvent;
import flash.display.Bitmap;
import flash.media.Sound;
import flash.net.URLRequest;
import flash.media.SoundChannel;
/**
* ...
* @author Nathan Nieuwenhuizen
*/
	public class mainMenu extends Sprite
	{
		
		[Embed(source="../img/titel.jpg")]
		private var BackgroundImage:Class;
		private var bgImage:Bitmap;
		
		private var bg:Menu;
		
		private var button:PlayButton;
		private var credit:CreditButton;
		private var menu:Menu;
		
		private var main:mainGame;
		private var black:Black;
		
		private var mainCredit:Credits;
		private var black2:Black;
		
		private var backMusic:Sound;
		private var load:URLRequest;
		private var myChannel:SoundChannel;
		
			public function mainMenu():void
			{
				
				if (stage) init();
				else addEventListener(Event.ADDED_TO_STAGE, init);
				
			}
			
			public function init(e:Event = null):void
			{	
				removeEventListener(Event.ADDED_TO_STAGE, init);

				//bgImage = new BackgroundImage();
				//addChild(bgImage);
				bg = new Menu();
				addChild(bg);
				button = new PlayButton();
				addChild(button);
				credit = new CreditButton();
				addChild(credit);
				var masker:Masker = new Masker();
				addChild(masker);
				this.mask = masker;
				black = new Black();
				black2 = new Black();

				this.addEventListener(MouseEvent.CLICK, onClick);
			}
			
			public function Loop(e:Event):void
			{
				
				if (black != null)
				{
					if (black.alpha >= 0.99)
					{
						myChannel.stop();
						
						removeChild(bg);
						removeChild(credit);
						removeEventListener(Event.ENTER_FRAME, Loop);
						removeChild(button);
						//button = null;
						main = new mainGame();
						addChild(main);
						removeChild(black);
					}
				}
			}
			public function Loop3(e:Event):void
			{
				
				//if (black2 != null)
				//{
					if (black2.alpha >= 0.99)
					{
						myChannel.stop();
						
						removeChild(bg);
						removeChild(credit);
						removeEventListener(Event.ENTER_FRAME, Loop3);
						removeChild(button);
						//button = null;
						mainCredit = new Credits();
						addChild(mainCredit);
						removeChild(black2);
						//removeEventListener(Event.ENTER_FRAME, Loop3);
						
					}
				//}
			}
			
			private function onClick(e:MouseEvent):void 
			{
				if (mouseX >= button.x && mouseX <= button.x +button.width && mouseY >= button.y && mouseY <= button.y +button.height)
				{
					addChild(black);
					var backMusic:Sound = new Sound(new URLRequest("../sounds/button2.mp3")); 
					myChannel = backMusic.play();
					removeEventListener(MouseEvent.CLICK, onClick);
					this.addEventListener(Event.ENTER_FRAME, Loop);
					
					
					
				}
				if (mouseX >= credit.x && mouseX <= credit.x +credit.width && mouseY >= credit.y && mouseY <= credit.y +credit.height)
				{
					addChild(black2);
					var backMusic:Sound = new Sound(new URLRequest("../sounds/button2.mp3")); 
					myChannel = backMusic.play();
					removeEventListener(MouseEvent.CLICK, onClick);
					this.addEventListener(Event.ENTER_FRAME, Loop3);
					
					
					
				}
			}		
	}
}