package
{
	import mx.core.ButtonAsset;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Stamp;
	import net.flashpunk.World;
	import TileGenerationTest.RandomMap;
	import Tiles.TileGraphic;
	import Tiles.Tile;
	import Tiles.TileGrow;
	import TileGenerationTest.WorldMap;
	import UI.Button;
	import AssetFolder.TileAssets
	
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
		
		protected var Map:WorldMap;
		override public function begin():void
		{
			super.begin()
			/*
			   Tilething = new Tile(200,300,new TileGraphic(50));
			   add(Tilething);
			   add (new TileGrow(350, 200, true,"",GrowTile,10));
			   add(new TileGrow(350, 400, false,"",GrowTile,-10));
			 */
			   Map=new WorldMap(MapClass.Map1)
			add(Map);
			add(new Button(10, 10, "", RedrawMap, null, Assets.RESET_BUTTON))
			
			
			
			
		}
		
		private function RedrawMap():void {
			remove(Map)
			Map = null;
			Map=new RandomMap()
			add(Map);
		}
		
		
		
		
		public function GrowTile(amount:Number):void
		{
			if (amount > 0 || (Tilething.size + amount) > 1)
			{
				Tilething.size += amount;
			}
		}
		
		
		override public function update():void 
		{
			super.update();

		}
		
	/*	override public function update():void {
			super.update();
			
			if (mouseX >= FP.stage.width+camera.x -100) {
				camera.x += 5;
			}
			else if(mouseX <= camera.x +100) {
				camera.x += -5;
			}
			
		}
	*/	
	
	}

}