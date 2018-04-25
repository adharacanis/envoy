package game.scene;

import gl.GlStage;
import theater.scene.BaseScene;
import theater.troupe.BaseActor;
import theater.troupe.BaseViewComponent;

class GameScene extends BaseScene 
{
	var stage:GlStage;

	public function new(stage:GlStage) 
	{
		super();
		this.stage = stage;
	}
	
	override public function addActor(actor:BaseActor) 
	{
		super.addActor(actor);
		stage.addDisplayObject(actor.getComponent(BaseViewComponent).view);
	}
	
	override public function removeActor(actor:BaseActor) 
	{
		super.removeActor(actor);
		stage.removeDisplayObject(actor.getComponent(BaseViewComponent).view);
	}
	
	override public function update(worldStep:WorldStep) 
	{
		super.update(worldStep);
	}
}