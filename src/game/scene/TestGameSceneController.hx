package game.scene;

import game.MouseController;
import game.troupe.SimpleActorFactory;
import gl.GlStage;
import theater.events.ActorEvent;
import theater.scene.ActorDeathComponent;
import theater.scene.ProjectileSceneComponent;
import theater.scene.SimplePhysicSceneComponent;
import theater.troupe.BaseActor;
import theater.troupe.model.EnverionmentModel;
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
		scene.addComponent(new ProjectileSceneComponent(scene));
		scene.addComponent(new ActorDeathComponent(scene));
		
		initialise();
	}
	
	function onSpawnActor(actor:BaseActor)
	{
		scene.addActor(actor);
	}
	
	function onDespawnActor(e:ActorEvent):Void 
	{
		scene.removeActor(e.actor);
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
		
		onSpawnActor(player);
		
		trace('initialise level');
		
		bot = spawnBot();
		//bot2 = spawnBot();
		//bot3 = spawnBot();
	}
	
	var bot:BaseActor;
	var bot3:BaseActor;
	var bot2:BaseActor;
	function spawnBot()
	{
		var bot = SimpleActorFactory.makeSimpleActor();
		var envModel:EnverionmentModel = bot.model.getModel(EnverionmentModel);
		envModel.actorsInRange.push(player.model);
		
		var positionModel = bot.model.getModel(PositionModel);
		positionModel.worldPosition.x = 100 + Math.random() * 300;
		positionModel.worldPosition.y = 100 + Math.random() * 300;
		
		positionModel.destinetionPosition.x = 100 + Math.random() * 300;//positionModel.worldPositionX;
		positionModel.destinetionPosition.y = 100 + Math.random() * 300;//positionModel.worldPositionY;
		
		onSpawnActor(bot);
		return bot;
	}
	
	public function update(worldStep:WorldStep)
	{
		if (bot != null && bot.model.state == 0)
		{
			//bot.model.getModel(PositionModel).destinetionPosition.x = 800 * Math.random();
			//bot.model.getModel(PositionModel).destinetionPosition.y = 800 * Math.random();
		}
		
		if (bot2 != null && bot2.model.state == 0)
		{
			bot2.model.getModel(PositionModel).destinetionPosition.x = 800 * Math.random();
			bot2.model.getModel(PositionModel).destinetionPosition.y = 800 * Math.random();
		}
		
		if (bot3 != null && bot3.model.state == 0)
		{
			bot3.model.getModel(PositionModel).destinetionPosition.x = 800 * Math.random();
			bot3.model.getModel(PositionModel).destinetionPosition.y = 800 * Math.random();
		}
		
		scene.update(worldStep);
		stage.update();
	}
	
}