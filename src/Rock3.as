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
	
	import flash.display.Graphics;

	
	public class Rock3 extends MovieClip
	{
		
		private var art:MovieClip;
		
		public var xSpeed:int;
		public var ySpeed:int;
		public var minSpeed:int;
		
		private var inField:Boolean;
		public var g:Graphics;
			public function Rock3()
			{
			addEventListener(Event.ADDED_TO_STAGE, init);
			 
			}
			
			
			private function init(e:Event = null):void
			{
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
			/*
			if (Math.random() <= 0.0)
			{
				//art = new RockArt4();
				//bgImage = new rockImage1();
			}
			else if (Math.random() <= 0.0 && Math.random() > 0.1)
			{
				//art = new RockArt3();
			}
			else if (Math.random() >= 0.75)
			{
				art = new RockArt2();
				//bgImage = new rockImage2();
			}
			else 
			{
				art = new RockArt();
				//bgImage = new rockImage3();
			}	
			//addChild(bgImage);
			addChild(art);*/
			
			inField = false;
			minSpeed = 300;
			this.y = -this.height;
			this.x = this.width + 20+ (Math.random() * 1920) - this.width *2;
			determineSpeed();
			this.scaleX = this.scaleY = 0.5;
			addEventListener(Event.ENTER_FRAME, loop);
			}
			
			private function determineSpeed():void
			{
				if (Math.random() <= 0.5)
				{
					xSpeed =  minSpeed + (Math.random() * 400) ;	
				}
				else
				{
					xSpeed =  -minSpeed - (Math.random() * 400) ;	
				}
				if (Math.random() <= 0.5)
				{
					ySpeed =  minSpeed + (Math.random() * 400) ;	
					
				}
				else
				{
					ySpeed =  -minSpeed - (Math.random() * 400) ;	
				}
				
				//ySpeed = maxSpeed + (Math.random() * 600) ;	
				//trace (ySpeed);
				
			}
			
			public function loop(e:Event):void
			{
				this.x += xSpeed/100;
				this.y += ySpeed/100;
				if (this.y>= 1080 + this.height*2)
				{
					this.y = 0 - this.height;
				}
				if (this.y <= 0 - this.height*2)
				{
					this.y = 1080 +this.height;
				}
				if (this.x >= 1920 + this.width*2)
				{
					this.x = 0 -this.width;

				}
				if (this.x <= 0 -this.width*2)
				{
					this.x = 1920 + this.width;

				}
			}
			
			
			
	}

}