package game.scene;

import game.MouseController;
import game.troupe.SimpleActorFactory;
import gl.GlStage;
import theater.scene.SimpleMovementSceneComponent;
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
		scene.addComponent(new SimpleMovementSceneComponent());
		
		initialise();
	}
	
	function initialise() 
	{
		var player = SimpleActorFactory.makeSimpleActor();
		mouseController.setPlayerData(player.model);
		scene.addActor(player);
		
		var positionModel = player.model.getModel(PositionModel);
		positionModel.worldPositionX = 100 + 16;
		positionModel.worldPositionY = 100 + 16;
		
		positionModel.worldPositionMovementToX = 100 + 16;
		positionModel.worldPositionMovementToY = 100 + 16;
		
		//spawnBot();
		//spawnBot();
		//spawnBot();
	}
	
	function spawnBot()
	{
		var bot = SimpleActorFactory.makeSimpleActor();
		var positionModel = bot.model.getModel(PositionModel);
		positionModel.worldPositionX = 100 + Math.random() * 300;
		positionModel.worldPositionY = 100 + Math.random() * 300;
		
		positionModel.worldPositionMovementToX = 100 + Math.random() * 300;//positionModel.worldPositionX;
		positionModel.worldPositionMovementToY = 100 + Math.random() * 300;//positionModel.worldPositionY;
		
		trace(positionModel.worldPositionX, positionModel.worldPositionY);
		
		scene.addActor(bot);
	}
	
	public function update(worldStep:WorldStep)
	{
		scene.update(worldStep);
		stage.update();
	}
	
}