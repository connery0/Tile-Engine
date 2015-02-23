package Entity
{
	import AssetFolder.EntityAssets;
	import flash.geom.Point;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import TileGenerationTest.RandomMap;
	import Tiles.Tile;
	
	/**
	 * ...
	 * @author ...
	 */
	public class Character extends Entity
	{
		protected var _image:Image;
		public function Character(CurrentTile:Tile)
		{
			//public static const SLIMEINFO:Object = {Width: 90, Xcenter: 45, Height:112, Ycenter:112};
			var info:Object = EntityAssets.SLIMEINFO;
			_image=new Image(EntityAssets.SLIME);
			_image.originX = info.Xcenter;
			_image.originY = info.Ycenter;
			
			super(CurrentTile.x,CurrentTile.y-CurrentTile.actualHeight+23);
			trace(CurrentTile.size);
			graphic = _image;
		
		}
	
	}
}