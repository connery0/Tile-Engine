package 
{
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	import TileTest;
	
	
	/**
	 * ...
	 * @author Connery0
	 */
	public class Main extends Engine 
	{
		
		public function Main() 
		{
			super(700, 700, 60, false);
			FP.console.enable();
		}
		
		override public function init():void {
			FP.world = new TileTest();
		}
		
		
		
		
	}
	
}