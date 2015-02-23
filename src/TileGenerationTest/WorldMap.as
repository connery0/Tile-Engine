package TileGenerationTest
{
	import AssetFolder.TileAssets;
	import Entity.Character;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	import Tiles.*;
	
	/**
	 * ...
	 * @author ...
	 */
	public class WorldMap extends Entity
	{
		
		protected var Currentmap:Array;
		
		public function WorldMap(LoadMap:Array = null)
		{
			super();
			Currentmap = [];
			if (LoadMap != null)
			{
				for (var i:int = 0; i < LoadMap.length; i++)
				{
					Currentmap.push([]);
					for (var j:int = 0; j < LoadMap[i].length; j++)
					{
						
						var CurrentTile:Tile;
						
						CurrentTile = GenerateTile(LoadMap[i][j]);
						
						CurrentTile.x += 345 + 45 * j - 44 * i;
						CurrentTile.y += 300 + 23 * j + 22 * i;
						add(CurrentTile);
						
						Currentmap[i].push(CurrentTile);
					}
				}
			}		
			add(new Character(Currentmap[2][1]));
			var a:Tile = Currentmap[2][1];
			a.ActiveOverlay.visible = true;
		}
		
		override public function added():void 
		{
			/* add monsters? add base */
			
			super.added();
		}
		
		protected function GenerateTile(Arguments:Array):Tile
		{
			var Name:String = Arguments[0];
			var height:Number = -1;
			var xPos:Number = 0;
			var yPos:Number = 0;
			
			for (var i:int = 0; i < Arguments.length; i++)
			{
				if (i == 1)
					height = Arguments[i];
				
					/* MONSTER CODE */
				if (i == 2)
					trace(Arguments[i]);
				
				if (i == 3)
					trace(Arguments[i]);
			}
			
			var returnTile:Tile = null
			var returnTileGraphic:TileGraphic = null;
			
			returnTileGraphic = new TileGraphic(height, TileAssets[Name], TileAssets[Name + "INFO"]);
			
			returnTile = new Tile(returnTileGraphic, xPos, yPos);
			return returnTile;
			
		}
		
		protected function add(ToAdd:Entity):void
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
			world.getClass(Character,i);
			if (i != null)
			{
				for (j= 0; j < i.length; j++)
				{
					temp = i[j];
					world.remove(i[j]);
				}
			}
			
			super.removed();
		
		}
		
		
	
	}

}