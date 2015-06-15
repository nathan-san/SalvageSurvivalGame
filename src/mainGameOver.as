package
{
import flash.display.Sprite;
import flash.events.Event;
import flash.display.Bitmap;
//import flash.events.KeyboardEvent;
import flash.ui.Mouse;
import flash.events.MouseEvent;
//import flash.media.Sound;
//import flash.net.URLRequest;
//import flash.media.SoundChannel;
/**
* ...
* @author Nathan Nieuwenhuizen
*/
	public class mainGameOver extends Sprite
	{
		//private var button:PlayButton;
		private var menu:Menu;
		
		private var gameOver: GameOver;
		private var main:mainGame;
		private var black:Black;
		public var endScore:Scoreboard;
		
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
		

		
			public function mainGameOver():void
			{
				
				if (stage) init();
				else addEventListener(Event.ADDED_TO_STAGE, init);
				
			}
			
			public function init(e:Event = null):void
			{	
				removeEventListener(Event.ADDED_TO_STAGE, init);
				
				bgImage = new backgroundImage();
				addChild(bgImage);
				mImage = new meshgroundImage();
				addChild(mImage);
				
				gameOver = new GameOver();
				addChild(gameOver);
				
				mImage.width = bgImage.width = 1920;
				mImage.height = bgImage.height= 1080;
				
				
				
			}
			
	}
}