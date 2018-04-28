package game.scene;

import gl.GlStage;
import openfl.geom.Matrix;
import swfdata.SpriteData;
import theater.scene.BaseScene;
import theater.scene.Camera;
import theater.troupe.BaseActor;
import theater.troupe.BaseViewComponent;

class GameScene extends BaseScene 
{
	var stage:GlStage;
	var rootContainer:SpriteData;
	
	public var camera:Camera = new Camera();

	public function new(stage:GlStage) 
	{
		super();
		this.stage = stage;
		rootContainer = new SpriteData();
		rootContainer.transform = new Matrix();
		stage.addDisplayObject(rootContainer);
	}
	
	override public function addActor(actor:BaseActor) 
	{
		super.addActor(actor);
		rootContainer.addDisplayObject(actor.getComponent(BaseViewComponent).view);
	}
	
	override public function removeActor(actor:BaseActor) 
	{
		super.removeActor(actor);
		rootContainer.removeDisplayObject(actor.getComponent(BaseViewComponent).view);
	}
	
	override public function update(worldStep:WorldStep) 
	{
		rootContainer.x = camera.x + 800 / 2;
		rootContainer.y = camera.y + 800 / 2;
		
		super.update(worldStep);
	}
}