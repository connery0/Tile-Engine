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
	public class RandomMap extends WorldMap
	{
		
		public function RandomMap()
		{
			var RandMap:Array = [];
			
			for (var i:int = 0; i < 10; i++)
			{
				RandMap.push([]);
				for (var j:int = 0; j < 10; j++)
				{
					var tileType:String;
					switch (FP.rand(5))
					{
						case 0: 
							if (j > 0)
							{								
								RandMap[i].push(["GRASS", RandMap[i][j-1][1] + FP.rand(50) - 25]);
							}
							else
							{
								if (i > 0) {
									
								RandMap[i].push(["GRASS", RandMap[i-1][j][1] + FP.rand(50) - 25]);
								}else
								RandMap[i].push(["GRASS", FP.rand(100) + 50]);
							}
							break;
						case 1: 
									if (j > 0)
							{								
								RandMap[i].push(["GRASS", RandMap[i][j-1][1] + FP.rand(50) - 25]);
							}
							else
							{
								if (i > 0) {
									
								RandMap[i].push(["GRASS", RandMap[i-1][j][1] + FP.rand(50) - 25]);
								}else
								RandMap[i].push(["GRASS", FP.rand(100) + 50]);
							}
							break;
						case 2: 
									if (j > 0)
							{								
								RandMap[i].push(["GRASS", RandMap[i][j-1][1] + FP.rand(50) - 25]);
							}
							else
							{
								if (i > 0) {
									
								RandMap[i].push(["GRASS", RandMap[i-1][j][1] + FP.rand(50) - 25]);
								}else
								RandMap[i].push(["GRASS", FP.rand(100) + 50]);
							}
							break;
						
						case 3: 
							RandMap[i].push(["WATER", -1]);
							if (j < 9)
							{
								
								RandMap[i].push(["WATER", -1]);
								j++;
							}
							break;
						
						case 4: 
									if (j > 0)
							{								
								RandMap[i].push(["PILLAR", RandMap[i][j-1][1] + FP.rand(50) - 25]);
							}
							else
							{
								if (i > 0) {
									
								RandMap[i].push(["PILLAR", RandMap[i-1][j][1] + FP.rand(50) - 25]);
								}else
								RandMap[i].push(["PILLAR", FP.rand(100) + 50]);
							}
							break;
					
					}
				}
			}
			super(RandMap);
		
		}
	
	}

}