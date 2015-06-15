package  
{
	import flash.display.Bitmap;
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author Nathan Nieuwenhuizen
	 */
	public class Tail extends Player
	{
		//[Embed(source="../img/spaceship2.png")]
		//private var playerImage:Class;
		//private var plImage:Bitmap;
		private var art:MovieClip;
		
		public function Tail() 
		{
			art = new tailArt();
			addChild(art);
			
			//plImage = new playerImage();
			//addChild(plImage);
			art.x = -130;
			art.y = -240;
			this.scaleX = this.scaleY = 0.35;
		}
		
	}

}