package  
{
	import flash.display.Bitmap;
	import flash.display.MovieClip;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import flash.display.Sprite;
	import flash.events.Event;
	 /**
	 * ...
	 * @author Pim Horeman
	 */
	public class Player extends MovieClip
	{
		/*[Embed(source="../img/spaceship2.png")]
		private var playerImage:Class;
		private var plImage:Bitmap;*/
		
		public var topSpeed:Number = 7;
		private var rotateSpeed:Number = 5;
		private var speedUp:Number = .9;
		private var speedDown:Number = .99;   
		
		private var speed:Number = 0;
		private var speedX:Number = 0;
		private var speedY:Number = 0;
		
		public var moveUp:Boolean = false;
        public var moveLeft:Boolean = false;
        public var moveRight:Boolean = false;
		public var moveDown:Boolean = false;
		
		public function Player() 
		{
			//Old Player Style:
			//this.graphics.beginFill(0xFF00FF, 1);
			//this.graphics.drawRect(-50,-50, 100, 100);
			//this.graphics.endFill();
		 
			this.addEventListener(Event.ADDED_TO_STAGE, init);
			this.x = 1200;
			this.y = 700;
		}	
		
		private function init(e:Event = null):void 
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, init);           
            //stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDown); 
			stage.addEventListener(KeyboardEvent.KEY_UP, keyUp); 
			
			this.addEventListener(Event.ENTER_FRAME, loop);
		}
		
		private function loop(e:Event):void
		{
			if (moveRight)
            {
                this.rotation += rotateSpeed;
            }
            if (moveLeft)
            {
                this.rotation -= rotateSpeed;
            }
            if (moveUp)
            {
                speedX += speedUp * Math.sin(this.rotation * (Math.PI / 180));
                speedY += speedUp * Math.cos(this.rotation * (Math.PI / 180));
            } 
			if (moveDown)
            {
                speedX += speedUp / Math.sin(this.rotation * (Math.PI / 180));
                speedY += speedUp / Math.cos(this.rotation * (Math.PI / 180));
            } 			
            else{
                // Deccelerate when Up Arrow key is released
                speedX *= speedDown;
                speedY *= speedDown;
            }
 
            // Maintain speed limit
            speed = Math.sqrt((speedX * speedX) + (speedY * speedY));
 
            if (speed > topSpeed)
            {
                speedX *= topSpeed/speed;
                speedY *= topSpeed/speed;
            }
 
            // Move _player based on calculations above
            this.y -= speedY;
            this.x += speedX;
			
			if (this.x - this.width / 2 < 200)
				this.x = this.width / 2 +200 ;
			if (this.x + this.width / 2 > 1920)
				this.x = 1920 - this.width / 2;
				
			if (this.y - this.width / 2 < 0)
				this.y = this.width / 2 ;
			if (this.y + this.width / 2 > 1080)
				this.y = 1080 - this.width / 2;
		}
		 
			public function keyDown(event:KeyboardEvent):void
        {
            //switch( event.keyCode )
            //{
                //case Keyboard.UP:
                    //moveUp = true;
                    //break;
 //
                //case Keyboard.LEFT:
                   //moveLeft = true;
                   //break;
 //
                //case Keyboard.RIGHT:
                    //moveRight = true;
                    //break;
					//
				//case Keyboard.DOWN:
                    //moveDown = true;
                    //break;
					//
				//case Keyboard.W:
                    //moveUp = true;
                    //break;
 //
                //case Keyboard.A:
                    //moveLeft = true;
                    //break;
 //
                //case Keyboard.D:
					//moveRight = true;
                    //break;
					//
				//case Keyboard.S:
					//moveDown = true;
                    //break;
            //}
        }
		
        public function keyUp(event:KeyboardEvent):void
        {
            switch( event.keyCode )
            {
                case Keyboard.W:
                    moveUp = false;
                    break;
 
                case Keyboard.A:
                    moveLeft = false;
                    break;
 
                case Keyboard.D:
					moveRight = false;
                    break;
					
				case Keyboard.S:
					moveDown = false;
					
				case Keyboard.UP:
                    moveUp = false;
                    break;
 
                case Keyboard.LEFT:
                    moveLeft = false;
                    break;
 
                case Keyboard.RIGHT:
					moveRight = false;
                    break;
					
				case Keyboard.DOWN:
					moveDown = false;
            }
        }
		
		/*
		public function keyDown(e:KeyboardEvent):void
		{
			
			if (e.keyCode == 65)//Left
			{ 
				this.rotation -= rotateSpeed;
			}
			if (e.keyCode == 68)//Right
			{
				this.rotation += rotateSpeed;
			}
			if (e.keyCode == 83)//Down
			{
				this.y += 10;
			}
			if (e.keyCode == 87)//Up
			{
				speedX += speedUp * Math.sin(this.rotation * (Math.PI / 180));
                speedY += speedUp * Math.cos(this.rotation * (Math.PI / 180));
			}
			
		}
		*/
		
	}

}
