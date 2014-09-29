package TileGenerationTest 
{
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	
	/**
	 * ...
	 * @author ...
	 */
	public class RandomMap extends WorldMap 
	{
		
		public function RandomMap(x:Number=0, y:Number=0, graphic:Graphic=null, mask:Mask=null) 
		{
			super(x, y, graphic, mask);
			var Xpos:Number;
			var Ypox:Number;
			var Xstart:Number = 300;
			var Ystart:Number = 200;
			for (var i:int = 0; i < 8; i++)
			{
				for (var j:int = 0; j < 8; j++)
				{
					
					var stuff:Tile = new Tile(new TileGraphic(((Math.random() * 50) + 42), TileAssets.GRASS, TileAssets.GRASSINFO),Xstart + 45 * j - 44 * i, Ystart + 23 * j + 22 * i);
					
					if (j == 6 || i == 6)
						stuff = new Tile(new TileGraphic(-1, TileAssets.WATER, TileAssets.WATERINFO),Xstart + 45 * j - 44 * i, Ystart + 23 * j + 22 * i);
					
					add(stuff);
				}
			}
		}
		
		
	}

}