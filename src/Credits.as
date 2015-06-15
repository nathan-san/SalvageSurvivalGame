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
	
	
	
	public class Credits extends Sprite
	{
		[Embed(source="../img/credits_screen_bg.png")]
		private var backgroundImage:Class;
		private var bgImage:Bitmap;
		
		[Embed(source = "../img/tekstTest.png")]
		private var forgroundImage:Class;
		public var fgImage:Bitmap;
		
		[Embed(source = "../img/tekstTest.png")]
		private var forgroundImage2:Class;
		public var fgImage2:Bitmap;
		
		[Embed(source = "../img/logoandoutlines.png")]
		private var logogroundImage:Class;
		public var logoImage:Bitmap;
		
		[Embed(source = "../img/mesh_layer.png")]
		private var meshgroundImage:Class;
		public var mImage:Bitmap;
		
		private var main:mainMenu;

		
		public function Credits()
			{
				this.addEventListener(Event.ADDED_TO_STAGE, init);
				
			
			}
			
			
			private function init(e:Event = null):void
			{
				fgImage = new forgroundImage();
				addChild(fgImage);
				bgImage = new backgroundImage();
				addChild(bgImage);
				mImage = new meshgroundImage();
				addChild(mImage);
				fgImage2 = new forgroundImage2();
				addChild(fgImage2);
				logoImage = new logogroundImage();
				addChild(logoImage);
				
				
				fgImage.scaleX = fgImage.scaleY =fgImage2.scaleX = fgImage2.scaleY = 1.7;
				logoImage.width = bgImage.width = 1920;
				logoImage.height = bgImage.height = 1080;
				mImage.width = 1920;
				mImage.height = 1080;
				fgImage.x =fgImage2.x = 300;
				fgImage.y =fgImage2.y= 800;
				
				main = new mainMenu();
				addEventListener(Event.ENTER_FRAME, loop);
				//this.scaleX = this.scaleY = 1;
				
			}
			private function loop(e:Event):void
			{
				fgImage.y -= 4;
				if (fgImage2.y >= 180)
				{
					fgImage2.y -= 8;
				}
				if (fgImage.y >=1080 || fgImage.y <=-100)
				{
					addChild(main);
					//removeChild(mainCredits);
					
				}
			}
			
	}

}



