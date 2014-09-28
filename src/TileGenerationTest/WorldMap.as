package TileGenerationTest
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	
	/**
	 * ...
	 * @author ...
	 */
	public class WorldMap extends Entity
	{
		
		protected var Map:Array;
		
		public function WorldMap(x:Number = 0, y:Number = 0, graphic:Graphic = null, mask:Mask = null)
		{
			Map = MapClass.Map1;
			super(x, y, graphic, mask);
			for (var i:int = 0; i < Map.length; i++)
			{
				for (var j:int = 0; j < Map[i].length; j++)
				{	
					
					var CurrentTile:Tile;
					if (Map[i][j].length == 1) {
					CurrentTile = TileSwitch( Map[i][j][0]);
					}
					if (Map[i][j].length == 2) {
						
					CurrentTile = TileSwitch( Map[i][j][0], Map[i][j][1]);
					}
					if (Map[i][j].length == 3 ) {
						
					CurrentTile = TileSwitch( Map[i][j][0], Map[i][j][1]);
					}
					
					if (Map[i][j].length == 5) {
						
					CurrentTile = TileSwitch( Map[i][j][0], Map[i][j][1],Map[i][j][3], Map[i][j][4]);
					}
					
					
					CurrentTile.x = 300 + 45 * j - 44 * i;
					CurrentTile.y = 200 + 23 * j + 22 * i;
					add(CurrentTile);
				}
			}
		
		}
		
		public function add(ToAdd:Entity):void
		{
			FP.world.add(ToAdd);
		}
		
		override public function removed():void
		{
			
			var i:Array = new Array();
			world.getClass(Tile, i);
			if (i != null)
			{
				for (var j:int = 0; j < i.length; j++)
				{
					var temp:Entity = i[j];
					world.remove(i[j]);
				}
			}
			super.removed();
		
		}
		;
		
		protected function TileSwitch(Name:String, height:Number = -1, X:Number = 0, Y:Number = 0):Tile
		{
			
			var returnTile:Tile = null
			var returnTileGraphic:TileGraphic = null;
			
			switch (Name)
			{
				case "Grass":
					returnTileGraphic = new TileGraphic(height, TileAssets.GRASSTILE_img, TileAssets.GRASSTILEINFO);
					break;
				case "Water":
					returnTileGraphic = new TileGraphic(height,TileAssets.WATER,TileAssets.WATERINFO);
					break;
				default: 
			}
			
			
			
			
			returnTile = new Tile(returnTileGraphic, X, Y);
			return returnTile;
		}
	
	}

}