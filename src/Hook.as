package  
{
	import flash.display.Bitmap;
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author Nathan Nieuwenhuizen
	 */
	public class Hook extends Player
	{
		//[Embed(source="../img/hook.png")]
		//private var hookImage:Class;
		//private var hImage:Bitmap;
		
		private var art:MovieClip;
		public function Hook() 
		{
			//hImage = new hookImage();
			art = new hookArt();
			addChild(art);
			art.x = -230;
			art.y = -800;
			//addChild(hImage);
			this.scaleX = this.scaleY = 0.25;
		}
		
	}

}