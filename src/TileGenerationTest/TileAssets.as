package TileGenerationTest
{
	
	/**
	 * ...
	 * @author Connery0
	 */
	public class TileAssets
	{
		[Embed(source = "../../assets/gfx/Active.png")] public static const ACTIVETILE:Class;
		
		[Embed(source="../../assets/gfx/GrasTile.png")]	public static const GRASSTILE_img:Class;
		public static const GRASSTILEINFO:Object = {topHeight: 48, middleHeight: 52, bottomHeight: 24, tileWidth: 90};
		
		[Embed(source="../../assets/gfx/water.png")] public static const WATER:Class;
		public static const WATERINFO:Object = {topHeight: 48, middleHeight: 42, bottomHeight: 22, tileWidth: 90};
	}

}