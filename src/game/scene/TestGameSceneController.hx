package game.scene;

import game.MouseController;
import game.troupe.SimpleActorFactory;
import gl.GlStage;
import theater.scene.ProjectileSceneController;
import theater.scene.SimplePhysicSceneComponent;
import theater.troupe.BaseActor;
import theater.troupe.model.PositionModel;

class TestGameSceneController 
{
	var stage:GlStage;
	
	var scene:GameScene;
	var mouseController:MouseController;
	
	public function new(stage:GlStage, assetsManager:AssetsManager) 
	{
		this.stage = stage;
		
		var actorFactory = new SimpleActorFactory(assetsManager);
		mouseController = new MouseController(stage.stage);
		
		scene = new GameScene(stage);
		scene.addComponent(new SimplePhysicSceneComponent());
		scene.addComponent(new ProjectileSceneController(scene));
		
		initialise();
	}
	
	function spawnActor(actor:BaseActor)
	{
		scene.addActor(actor);
	}
	
	var player:BaseActor;
	function initialise() 
	{
		player = SimpleActorFactory.makeSimpleActor();
		mouseController.setPlayerData(player.model);
		
		var positionModel = player.model.getModel(PositionModel);
		positionModel.worldPosition.x = 100 + 16;
		positionModel.worldPosition.y = 100 + 16;
		
		positionModel.destinetionPosition.x = 100 + 16;
		positionModel.destinetionPosition.y = 100 + 16;
		
		spawnActor(player);
		
		trace('initialise level');
		
		spawnBot();
		spawnBot();
		spawnBot();
	}
	
	function spawnBot()
	{
		var bot = SimpleActorFactory.makeSimpleActor();
		var positionModel = bot.model.getModel(PositionModel);
		positionModel.worldPosition.x = 100 + Math.random() * 300;
		positionModel.worldPosition.y = 100 + Math.random() * 300;
		
		positionModel.destinetionPosition.x = 100 + Math.random() * 300;//positionModel.worldPositionX;
		positionModel.destinetionPosition.y = 100 + Math.random() * 300;//positionModel.worldPositionY;
		
		spawnActor(bot);
	}
	
	public function update(worldStep:WorldStep)
	{
		scene.update(worldStep);
		stage.update();
	}
	
}