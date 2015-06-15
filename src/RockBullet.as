package  
{
	/**
	 * ...
	 * @author Nathan Nieuwenhuizen
	 */
	import flash.display.Bitmap;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.display.MovieClip;
	
	
	public class RockBullet extends MovieClip
	{
		//[Embed(source = "../img/rock1.png")]
		//
		//private var BackgroundImage:Class;
		//private var bgImage:Bitmap;
		private var bgImage:MovieClip;
		private var xMove:Number;
		private var yMove:Number;
		public var speed:Number;
		
			public function RockBullet(xpos:Number, ypos:Number, rot:Number)
			{
			
			//this.addEventListener(Event.ADDED_TO_STAGE, init);
			this.rotation = rot;
			bgImage = new RockArt2();
			addChild(bgImage);
			bgImage.x = this.width/2 ;
			bgImage.y = -50;
			
			var r:Number = this.rotation * Math.PI / 180;
			xMove= Math.cos(r);
			yMove = Math.sin(r);
			speed = 15;
			this.x = xpos +(xMove * 300)* 0.2;
			this.y = ypos +(yMove * 300) * 0.2;
			
			
			this.addEventListener(Event.ENTER_FRAME, loop);
			this.scaleX = this.scaleY = 0.3;
			}
			
			
			private function init(e:Event = null):void
			{
			
			}
			private function loop(e:Event):void
			{
				
				this.x += xMove * speed;
				this.y += yMove * speed;
				if (this.x >=2000 || this.x <=0 || this.y >=1080|| this.y <=0)
				{
				}
			}
			
	}

}