package
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.ui.Mouse;
	import flash.events.MouseEvent;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import vplayer;
	
	import flash.events.TimerEvent
	import flash.utils.Timer;
	
	import flash.media.Sound;
	import flash.net.URLRequest;
	import flash.media.SoundChannel;
	
	/**
	 * ...
	 * @author Nathan Nieuwenhuizen
	 */
	public class mainGame extends Sprite
	{
		[Embed(source="../img/black.png")]
		private var BackgroundImage:Class;
		private var bgImage:Bitmap;

		private var game:mainGame;
		
		private var uiLayer:Sprite = new Sprite();
		private var shootMusic:Sound;
		private var explosionMusic:Sound;
		private var collectMusic:Sound;
		private var waveMusic:Sound;
		private var load:URLRequest;
		private var myChannel:SoundChannel;
		private var myChannel2:SoundChannel;
		
		private var video:vplayer = new vplayer();
		
		private var timer:Timer = new Timer(1000);
		private var red:Red = new Red();
		private var button:ReturnButton = new ReturnButton();
		private var playButton:PlayButton = new PlayButton();
		private var bar:Bar = new Bar();
		private var endship:endShip;
		private var player:Player = new Tail();
		private var hook:Hook = new Hook();
		
		private var rocks:Array;
		private var smallRocks:Array;
		private var bigRocks:Array;
		private var rock2:RockCollission;
		
		private var bullets:Array;
		private var bullet:RockBullet;
		private var explosion:Explosion;
		
		private var ammountRocks:int;
		private var maxRocks:int = 300;
		public var score:Scoreboard = new Scoreboard();
		public var wave:WaveCounter = new WaveCounter();
		public var ammo:AmmoBoard = new AmmoBoard();
		public var bigWave:WaveCounter = new WaveCounter();
		private var End:mainGameOver = new mainGameOver();
		public var xPos:int;
		public var yPos:int;
		public var menu:mainMenu;
		
		public function mainGame():void
		{
			
			if (stage)
				init();
			else
				addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void
		{
			
			//---game instantieren---
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDown2);
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
			var backMusic:Sound = new Sound(new URLRequest("../sounds/bg.mp3"));
			explosionMusic = new Sound(new URLRequest("../sounds/explosion.mp3"));
			collectMusic = new Sound(new URLRequest("../sounds/collect.mp3"));
			waveMusic = new Sound(new URLRequest("../sounds/button.mp3"));
			shootMusic = new Sound(new URLRequest("../sounds/shoot.mp3"));
			
			myChannel2 = backMusic.play(0, 99);
			
			stage.addChild(uiLayer);
			
			endship = new endShip();
			addChild(End);
			
			addChild(video);
			video.playVideo00();
			
			addChild(red);
			
			addChild(hook);
			addChild(player);
			player.topSpeed = hook.topSpeed = 10 - ammo._ammo / 4;
			
			addChild(endship);
			
			ammountRocks = 0
			bigRocks = new Array();
			rocks = new Array();
			smallRocks = new Array();
			
			bullets = new Array();
			wave._waves = 1;
			spawnRock();
			
			addChild(bigWave);
			bigWave.Big();
			bigWave.startMoving();
			uiLayer.addChild(bar);
			uiLayer.addChild(score);
			uiLayer.addChild(ammo);
			uiLayer.addChild(wave);
			
			myChannel = waveMusic.play();
			uiLayer.addChild(button);
			button.scaleX = button.scaleY = 0.5;
			
			uiLayer.addEventListener(MouseEvent.CLICK, onClick);
			this.addEventListener(Event.ENTER_FRAME, Loop);
		
		}
		
		private function removeObjectsInGame():void
		{
			
			myChannel2.stop();
			myChannel.stop();
			removeEventListener(MouseEvent.CLICK, onClick);
			removeEventListener(Event.ENTER_FRAME, Loop);
			removeEventListener(KeyboardEvent.KEY_DOWN, keyDown2);
			//removeChild(button);
			removeChild(player);
			removeChild(hook);
			removeChild(endship);
			uiLayer.removeChild(bar);
			//removeChild(wave);
			removeChild(bigWave);
			uiLayer.removeChild(ammo);
			ammo._ammo = 0;
			removeChild(video);
			for (var i:int = 0; i < rocks.length; i++)
			{
				removeChild(rocks[i]);
					//rocks.splice(i, 1);
			}
			for (var i:int = 0; i < bigRocks.length; i++)
			{
				removeChild(bigRocks[i]);
					//rocks.splice(i, 1);
			}
			for (var i:int = 0; i < smallRocks.length; i++)
			{
				removeChild(smallRocks[i]);
					//smallRocks.splice(i, 1);
			}
		
		}
		
		private function spawnRock():void
		{
			//---bij elke wave genereert hij een aantal rocks met minimaal een kleine rock---
			for (var i:int = 0; i < wave._waves * 1; i++)
			{
				if (Math.random() <= 0.7)
				{
					rock2 = new RockCollission();
					addChild(rock2);
					rocks.push(rock2);
					rock2.scaleX = rock2.scaleY = 0.6;
					ammountRocks++;
					
				}
				
				else
				{
					rock2 = new RockCollission();
					addChild(rock2);	
					smallRocks.push(rock2);
					rock2.scaleX = rock2.scaleY = 0.3;
					rock2.minSpeed = 250;
					ammountRocks++;
				}
				
				
			}
			if (wave._waves >= 3)
			{
				rock2 = new RockCollission();
				addChild(rock2);
				bigRocks.push(rock2);
				rock2.scaleX = rock2.scaleY = 1.2;
				rock2.minSpeed = 100;
				ammountRocks++;
			}
			rock2 = new RockCollission();
			addChild(rock2);
			smallRocks.push(rock2);
			rock2.scaleX = rock2.scaleY = 0.3;
			ammountRocks++;
		}
		
		public function Loop(e:Event):void
		{
			
			//---Speler zet kogels om in punten---
			if (player.hitTestObject(endship))
			{
				for (var a:int = 0; a < ammo._ammo; a++)
				{
					if (a == 1)
					{
						myChannel = collectMusic.play();
					}
					score._score += 15;
					score.Update();
					ammo._ammo -= 1;
					ammo.Update();
				}
			}
			//---als de speler en haak een grote rock raakt---
			for (var i:int = rocks.length - 1; i >= 0; i--)
			{
				if (rocks[i].hitTestObject(player) || rocks[i].hitTestObject(hook) )
				//if (rocks[i].hitTestPoint(player.x, player.y) || rocks[i].hitTestPoint(hook.x, hook.y ))
				//if (rocks[i].x >= player.x -50 && rocks[i].x <= player.x +50 && rocks[i].y >= player.y -50 && rocks[i].y <= player.y +50 )
				{
					removeObjectsInGame();
					Ending();
					trace("you died!");
				}
			}
			for (var i:int = bigRocks.length - 1; i >= 0; i--)
			{
				if (bigRocks[i].hitTestObject(player) || bigRocks[i].hitTestObject(hook) )
				//if (rocks[i].hitTestPoint(player.x, player.y) || rocks[i].hitTestPoint(hook.x, hook.y ))
				//if (rocks[i].x >= player.x -50 && rocks[i].x <= player.x +50 && rocks[i].y >= player.y -50 && rocks[i].y <= player.y +50 )
				{
					removeObjectsInGame();
					Ending();
					trace("you died!");
				}
			}
			//---als de haak een kleine rock pakt---
			for (var s:int = smallRocks.length - 1; s >= 0; s--)
			{
				if (smallRocks[s].hitTestObject(hook))
				{
					if (ammo._ammo < ammo._maxAmmo)
					{
						
						
						ammo._ammo += 1;
						ammo.Update();
						
						
					}
					
					myChannel = collectMusic.play();
					removeChild(smallRocks[s]);
					smallRocks.splice(s, 1);
					ammountRocks--;
					trace(ammountRocks);
					if (ammountRocks == 0)
					{
						endship.startMoving();
					}
				}
				else if (smallRocks[s].hitTestObject(player))
				{
					removeObjectsInGame();
					Ending();
				}
			}
			//---als de bullet een kleine of grote rock raakt---
			for (var b:int = bullets.length - 1; b >= 0; b--)
			{
				if (bullets[b].hitTestObject(endship))
				{
					
					bullets[b].x = 5000;
					score._score += 10;
					score.Update();
					myChannel = collectMusic.play();
				}
				for (var s:int = smallRocks.length - 1; s >= 0; s--)
				{
					if (bullets[b].hitTestObject(smallRocks[s]))
					{
						explosion = new Explosion();
						addChild(explosion);
						myChannel = explosionMusic.play();
						explosion.x = smallRocks[s].x;
						explosion.y = smallRocks[s].y;
						removeChild(smallRocks[s]);
						smallRocks.splice(s, 1);
						ammountRocks--;
						trace(ammountRocks);
						if (ammountRocks == 0)
						{
							endship.startMoving();
						}
						bullets[b].x += 3000;
					}
				}
				
				for (var i:int = rocks.length - 1; i >= 0; i--)
				{
					if (bullets[b].hitTestObject(rocks[i]))
					{
						explosion = new Explosion();
						addChild(explosion);
						myChannel = explosionMusic.play();
						//---splits de grote rock in twee small rocks---
						for (var w:int = 0; w < 2; w++)
						{
							
							rock2 = new RockCollission();
							addChild(rock2);
							smallRocks.push(rock2);
							rock2.x = explosion.x = rocks[i].x;
							rock2.y = explosion.y = rocks[i].y;
							rock2.scaleX = rock2.scaleY = 0.3;
							ammountRocks++;
						}
						
						removeChild(rocks[i]);
						rocks.splice(i, 1);
						ammountRocks--;
						bullets[b].x += 3000;
					}
				}
				for (var i:int = bigRocks.length - 1; i >= 0; i--)
				{
					if (bullets[b].hitTestObject(bigRocks[i]))
					{
						explosion = new Explosion();
						addChild(explosion);
						myChannel = explosionMusic.play();
						//---splits de grote rock in twee small rocks---
						for (var w:int = 0; w < 3; w++)
						{
							
							rock2 = new RockCollission();
							addChild(rock2);
							rocks.push(rock2);
							rock2.x = explosion.x = bigRocks[i].x;
							rock2.y = explosion.y = bigRocks[i].y;
							rock2.scaleX = rock2.scaleY = 0.6;
							ammountRocks++;
						}
						
						removeChild(bigRocks[i]);
						bigRocks.splice(i, 1);
						ammountRocks--;
						bullets[b].x += 3000;
					}
				}
				
				
				//---als bullet buiten scherm gaat---
				if (bullets[b].x >= 2000 || bullets[b].x <= 0 || bullets[b].y >= 1080 || bullets[b].y <= 0)
				{
					removeChild(bullets[b]);
					bullets.splice(b, 1);
				}
			}
			
			if (bigWave.x <= -1000)
			{
				bigWave.stopMoving();
			}
			if (endship.x <= 0)
			{
				myChannel = waveMusic.play();
				wave.Update();
				bigWave.x = 2000;
				bigWave.Update();
				
				bigWave.startMoving();
				endship.stopMoving();
				endship.x = 2800;
				if (red.alpha <= 0.4)
					
				{
					red.alpha += 0.025;
				}
				spawnRock();
			}
		}
		
		private function keyDown2(event:KeyboardEvent):void
		{
			//---schiet rock terug---
			switch (event.keyCode)
			{
				case Keyboard.SPACE: 
					trace("key");
					if (ammo._ammo > 0)
					{
						myChannel = shootMusic.play();
						bullet = new RockBullet(player.x, player.y, player.rotation - 90);
						addChild(bullet);
						bullets.push(bullet);
						
						ammo._ammo--
						ammo.Update();
						
						//---vertraagt speler met hoeveel rocks/ammo hij heeft opgeslagen.---
						player.topSpeed = hook.topSpeed = 10 - ammo._ammo / 4;
						
					}
					break;
				case Keyboard.UP: 
					player.moveUp = hook.moveUp = true;
					break;
				
				case Keyboard.LEFT: 
					player.moveLeft = hook.moveLeft = true;
					break;
				
				case Keyboard.RIGHT: 
					player.moveRight = hook.moveRight = true;
					break;
				
				case Keyboard.W: 
					player.moveUp = hook.moveUp = true;
					break;
				
				case Keyboard.A: 
					player.moveLeft = hook.moveLeft = true;
					break;
				
				case Keyboard.D: 
					player.moveRight = hook.moveRight = true;
					break;
			}
		}
		
		private function Ending():void
		{
			addChild(playButton);
			//red.alpha = 0.4;
			playButton.y = 550;
			playButton.x = 800;
			button.endPosition();
			//button.y = 650;
			//button.x = 800;
			button.scaleX = button.scaleY = 1;
			score.Bigger();
			wave.Bigger();
			myChannel = explosionMusic.play();
			
			addEventListener(MouseEvent.CLICK, onClick2);
		}
		
		public function onClick2(e:MouseEvent):void
		{
			if (mouseX >= playButton.x && mouseX <= playButton.x + playButton.width && mouseY >= playButton.y && mouseY <= playButton.y + playButton.height)
			{
				removeChild(End);
				uiLayer.removeChild(score);
				uiLayer.removeChild(wave);
				removeChild(playButton);
				uiLayer.removeChild(button);
				//uiLayer.removeChild(button);
				removeChild(red);
				game = new mainGame();
				addChild(game);
				removeEventListener(MouseEvent.CLICK, onClick2);
			}
			//if (mouseX >= button.x && mouseX <= button.x + button.width && mouseY >= button.y && mouseY <= button.y + button.height)
			//{
				//removeChild(End);
				//uiLayer.removeChild(button);
				//uiLayer.removeChild(score);
				//uiLayer.removeChild(wave);
				//removeChild(playButton);
				//uiLayer.removeChild(button);
				//removeChild(red);
				//menu = new mainMenu();
				//addChild(menu);
				//removeEventListener(MouseEvent.CLICK, onClick2);
			//}
		}
		
		public function onClick(e:MouseEvent):void
		{
			//--als je op de knop klikt om naar het menu te gaan---
			if (mouseX >= button.x && mouseX <= button.x + button.width && mouseY >= button.y && mouseY <= button.y + button.height)
			{
				removeObjectsInGame();
				uiLayer.removeChild(score);
				removeChild(End);
				uiLayer.removeChild(wave);
				uiLayer.removeChild(button);
				menu = new mainMenu();
				addChild(menu);
			}
		}
	}
}