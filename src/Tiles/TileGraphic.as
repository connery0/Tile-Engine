package Tiles {
	import flash.display.BitmapData;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import AssetFolder.TileAssets;
	
	/**
	 * ...
	 * @author Connery0
	 */
	public class TileGraphic extends Image
	{
		protected var topTile:BitmapData;
		protected var middleTile:BitmapData;
		protected var bottomTile:BitmapData;
		
		protected var topHeight:Number = 48;
		protected var middleHeight:Number = 52;
		protected var botttomHeight:Number = 24;
		protected var tileWidth:Number = 90;
		
		protected var _height:Number;
		
		protected var sprite:Class;
		protected var sourceBitmapData:BitmapData;
		
		public var ExtraHeight:Number;
		
		public function TileGraphic(Height:Number = -1, TileSprite:Class = null, TileMeasurements:Object = null)
		{
			
			if (TileSprite != null)
			{
				sprite = TileSprite;
			}
			else
			{
				sprite = TileAssets.GRASS;
			}
			
			if (TileMeasurements != null)
			{
				this.topHeight = TileMeasurements.topHeight;
				this.middleHeight = TileMeasurements.middleHeight;
				this.botttomHeight = TileMeasurements.bottomHeight;
				this.tileWidth = TileMeasurements.tileWidth;
			}
			
			if (Height<0) {
				Height = middleHeight;
			}
			
			super(sprite);
			
			sourceBitmapData = _source;
			_height = Height;
			size = Height;
			ExtraHeight = topHeight + botttomHeight;
		
		}
		
		public function get fullsize():Number {
		return _height + ExtraHeight;	
		}
		
		public function get size():Number
		{
			return _height;
		}
		
		public function set size(height:Number):void
		{
			ChangeHeight(height);
			_height = height;
		}
		
		protected function ChangeHeight(tileHeight:Number):void
		{
			_source = sourceBitmapData;
			var Zero:Point = new Point();
			
			var TempBitmap:BitmapData = new BitmapData(tileWidth, topHeight);
			
			var Result:BitmapData = new BitmapData(tileWidth, topHeight + tileHeight + botttomHeight);
			
			TempBitmap.copyPixels(source, new Rectangle(0, 0, tileWidth, topHeight), Zero);
			topTile = TempBitmap;
			
			if (tileHeight > 0)
			{
				
				TempBitmap = new BitmapData(tileWidth, tileHeight);
				
				for (var TempHeight:int = tileHeight; TempHeight > 0; )
				{
					if (TempHeight > middleHeight)
					{
						TempBitmap.copyPixels(source, new Rectangle(0, topHeight, tileWidth, middleHeight), new Point(0, tileHeight - TempHeight));
						TempHeight = TempHeight - middleHeight;
					}
					else
					{
						TempBitmap.copyPixels(source,new Rectangle(0, topHeight, tileWidth, TempHeight), new Point(0, tileHeight - TempHeight));
						TempHeight = TempHeight - middleHeight;
						
					}
				}
				
				middleTile = TempBitmap;
				
			}
			
			TempBitmap = new BitmapData(tileWidth,botttomHeight);
			TempBitmap.copyPixels(source, new Rectangle(0,topHeight+middleHeight, tileWidth,topHeight+tileHeight+botttomHeight), Zero);
			bottomTile = TempBitmap;
			
			Result.copyPixels(topTile, new Rectangle(0, 0, topTile.width, topTile.height), Zero);
			
			if (tileHeight > 0)
			{
				Result.copyPixels(middleTile, new Rectangle(0, 0, middleTile.width, middleTile.height), new Point(0, topTile.height));
			}
			
			
			Result.copyPixels(bottomTile, new Rectangle(0, 0, bottomTile.width, bottomTile.height + tileHeight), new Point(0, topTile.height + tileHeight));
			
			_source = Result;
			_sourceRect = _source.rect;
			createBuffer();
			updateBuffer();
			x = -45
			y = -tileHeight-topHeight-botttomHeight;
		}
	
	}

}