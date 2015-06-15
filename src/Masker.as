package 
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author ...
	 */
	public class Masker extends Sprite
	{
		
		public function Masker() 
		{
			this.graphics.beginFill(0x000000, 1);
			
			this.graphics.drawRect(0, 0, 1920, 1080);
			//this.graphics.drawRect(0, 0, 520, 480);
			this.graphics.endFill();
			
		}
		
	}

}