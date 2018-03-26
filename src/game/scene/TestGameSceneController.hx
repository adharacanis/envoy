package game.scene;

import game.troupe.SimpleActorFactory;
import gl.GlStage;

class TestGameSceneController 
{
	var stage:GlStage;
	
	var scene:GameScene;
	
	public function new(stage:GlStage, assetsManager:AssetsManager) 
	{
		this.stage = stage;
		
		var actorFactory = new SimpleActorFactory(assetsManager);
		
		scene = new GameScene(stage);
		
		initialise();
	}
	
	function initialise() 
	{
		var actor = SimpleActorFactory.makeSimpleActor();
		scene.addActor(actor);
	}
	
	public function update()
	{
		scene.update();
		stage.update();
	}
	
}