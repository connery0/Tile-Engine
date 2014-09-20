package TileGenerationTest
{
	import flash.geom.Point;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Stamp;
	import net.flashpunk.Mask;
	import net.flashpunk.masks.Pixelmask;
	
	import flash.utils.getDefinitionByName;
	import flash.utils.getQualifiedClassName;
	
	/**
	 * ...
	 * @author Connery0
	 */
	public class Tile extends Entity
	{
		protected var TileSprite:TileGraphic;
		protected const ActiveOverlay:Stamp = new Stamp(TileAssets.ACTIVETILE);
		
		protected static var ActiveTile:Tile = null;
		
		public function Tile(x:Number = 0, y:Number = 0, TileImage:TileGraphic = null)
		{
			
			super(x, y);
			if (TileImage != null)
			{
				TileSprite = TileImage
				graphic = TileSprite;
				ActiveOverlay.y = -TileSprite.size;
				//setHitboxTo(ActiveOverlay);
				ActiveOverlay.visible = false;
				mask = new Pixelmask(TileAssets.ACTIVETILE, 0, -TileSprite.size)
			}
		}
		
		public function get size():Number
		{
			return TileSprite.size;
		}
		
		public function set size(amount:Number):void
		{
			
			TileSprite.size = amount;
			graphic = TileSprite;
		}
		
		override public function render():void
		{
			super.render();
			
			renderGraphic(ActiveOverlay);
		}
		
		protected var _point:Point = FP.point;
		protected var _camera:Point = FP.point2;
		
		protected function renderGraphic(graphic:Graphic):void
		{
			if (graphic && graphic.visible)
			{
				_point.x = x;
				_point.y = y
				
				_camera.x = world ? world.camera.x : FP.camera.x;
				_camera.y = world ? world.camera.y : FP.camera.y;
				graphic.render(renderTarget ? renderTarget : FP.buffer, _point, _camera);
				
			}
		}
		
		override public function update():void
		{
			super.update();
			
			var mouseover:Boolean;
			
			if (collidePoint(x, y, world.mouseX, world.mouseY))
			{
				mouseover = true;
			}
			else
			{
				mouseover = false;
			}
			
			if (ActiveTile == this)
			{
				if (!mouseover) {
				ActiveTile = null;
				}
			}
			else {
				if (ActiveTile == null && mouseover) {
					ActiveTile = this;
				}
			}
			
			if (ActiveTile == this) {
				ActiveOverlay.visible = true;
			}
			else {
				
				ActiveOverlay.visible = false;
			}
			
			
		}
	
	}

}