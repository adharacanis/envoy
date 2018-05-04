package theater.scene;

import gl.GlStage;
import openfl.geom.Matrix;
import swfdata.SpriteData;
import swfdata.atlas.TextureId;
import theater.InfinityBackground;
import theater.scene.BaseScene;
import theater.scene.Camera;
import theater.troupe.actor.BaseActor;
import theater.troupe.actor.BaseViewComponent;

class GameScene extends BaseScene 
{
	var stage:GlStage;
	var rootContainer:SpriteData;
	var infinityBackground:InfinityBackground;
	
	public var camera:Camera = new Camera();

	public function new(stage:GlStage) 
	{
		super();
		this.stage = stage;
		rootContainer = new SpriteData();
		rootContainer.transform = new Matrix();
		stage.addDisplayObject(rootContainer);
		
		infinityBackground = new InfinityBackground(stage.textureStorage.getTexture(new TextureId(0, 0)), camera);
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
	
	override public function update() 
	{
		infinityBackground.render(stage.renderer);
		
		rootContainer.scaleX = rootContainer.scaleY = 0.5;
		rootContainer.x = (camera.x) * 0.5 + 800 / 2;
		rootContainer.y = (camera.y) * 0.5 + 800 / 2;
		
		super.update();
	}
}