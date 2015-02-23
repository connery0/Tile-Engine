package AssetFolder {
	
	/**
	 * ...
	 * @author Connery0
	 */
	public class TileAssets
	{
		[Embed(source = "../../assets/Images/Active.png")] public static const ACTIVETILE:Class;
		
		[Embed(source="../../assets/Images/Tiles/GrasTile.png")]	public static const GRASS:Class;
		public static const GRASSINFO:Object = {topHeight: 48, middleHeight: 52, bottomHeight: 24, tileWidth: 90};
		
		[Embed(source="../../assets/Images/Tiles/water.png")] public static const WATER:Class;
		public static const WATERINFO:Object = {topHeight: 48, middleHeight: 42, bottomHeight: 22, tileWidth: 90};

		[Embed(source="../../assets/Images/Tiles/StoneTile.png")] public static const STONE:Class;
		public static const STONEINFO:Object = { topHeight: 48, middleHeight: 42, bottomHeight: 22, tileWidth: 90 };
		
		[Embed(source="../../assets/Images/Tiles/Pillar.png")] public static const PILLAR:Class;
		public static const PILLARINFO:Object = { topHeight: 57, middleHeight: 17, bottomHeight: 38, tileWidth: 90 };
	}

}