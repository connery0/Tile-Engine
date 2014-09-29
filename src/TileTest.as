package
{
	import mx.core.ButtonAsset;
	import net.flashpunk.World;
	import TileGenerationTest.TileGraphic;
	import TileGenerationTest.Tile;
	import TileGenerationTest.TileGrow;
	import UI.Button;
	import TileGenerationTest.TileAssets
	
	/**
	 * ...
	 * @author Connery0
	 */
	public class TileTest extends World
	{
		
		public function TileTest()
		{
			super();
		
		}
		
		private var Tilething:Tile;
		
		override public function begin():void
		{
			super.begin()
			/*
			   Tilething = new Tile(200,300,new TileGraphic(50));
			   add(Tilething);
			   add (new TileGrow(350, 200, true,"",GrowTile,10));
			   add(new TileGrow(350, 400, false,"",GrowTile,-10));
			 */
			var Xpos:Number;
			var Ypox:Number;
			var Xstart:Number = 300;
			var Ystart:Number = 200;
			for (var i:int = 0; i < 8; i++)
			{
				for (var j:int = 0; j < 8; j++)
				{
					
					var stuff:Tile = new Tile(Xstart + 45 * j - 44 * i, Ystart + 23 * j + 22 * i, new TileGraphic(((Math.random() * 50) + 42), TileAssets.GRASSTILE_img, TileAssets.GRASSTILEINFO));
					
					if (j == 6 || i == 6)
						stuff = new Tile(Xstart + 45 * j - 44 * i, Ystart + 23 * j + 22 * i, new TileGraphic(-1, TileAssets.WATER, TileAssets.WATERINFO));
					
					add(stuff);
				}
			}
		
		}
		
		public function GrowTile(amount:Number):void
		{
			if (amount > 0 || (Tilething.size + amount) > 1)
			{
				Tilething.size += amount;
			}
		}
	
	}

}