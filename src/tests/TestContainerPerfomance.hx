package tests;

import flash.geom.Rectangle;
import openfl.events.Event;
import openfl.geom.Matrix;
import swfdata.ColorData;
import swfdata.ShapeData;
import swfdata.SpriteData;
import swfdata.atlas.TextureId;

class TestContainerPerfomance extends BaseRunner 
{

	public function new() 
	{
		super();
	}
	
	override function onAssetReady(e:Event):Void 
	{
		super.onAssetReady(e);
		
		var container = new SpriteData();
		container.transform = new Matrix();
		//container.isMask = true;
		
		container.x = 250;
		
		container.colorData = new ColorData(1);
		
		for (i in 0...2000)
		{
			
			
			//shape.x = i * 32;
			
			var subContainer = new SpriteData();
			subContainer.transform = new Matrix();
			//subContainer.colorData = new ColorData(0.4);
			//subContainer.addDisplayObject(shape);
			
			container.addDisplayObject(subContainer);
			
			for (j in 0...1000)
			{
				var subSubContainer = new SpriteData();
				subSubContainer.transform = new Matrix();
				
				subContainer.addDisplayObject(subSubContainer);
				
				var shape = new ShapeData(new TextureId(0, 0));
				shape.shapeBounds = new Rectangle(0, 0, 16, 16);
				shape.transform = new Matrix();
				
				subSubContainer.addDisplayObject(shape);
				//shape.colorData = new ColorData(0.32);
			}
		}
		
		glStage.addDisplayObject(container);
	}
	
	override function onUpdate(e:Event):Void 
	{
		//trace('===== draw =====');
		
		super.onUpdate(e);
		
		//trace('===== draw end =====');
	}
	
}