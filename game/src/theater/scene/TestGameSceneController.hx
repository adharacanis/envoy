package theater.scene;

import MouseController;
import gl.GlStage;
import openfl.events.MouseEvent;
import theater.events.ActorEvent;
import theater.scene.ActorDeathComponent;
import theater.scene.ProjectileSceneComponent;
import theater.scene.SimplePhysicSceneComponent;
import theater.scene.TargetCameraComponent;
import theater.troupe.actor.BaseActor;
import theater.troupe.actor.SimpleActorFactory;
import theater.troupe.actor.model.EnverionmentModel;
import theater.troupe.actor.model.PositionModel;

class TestGameSceneController 
{
	var stage:GlStage;
	
	var scene:GameScene;
	var mouseController:MouseController;
	var cameraController:theater.scene.TargetCameraComponent;
	
	public function new(stage:GlStage, assetsManager:AssetsManager) 
	{
		this.stage = stage;
		
		var actorFactory = new SimpleActorFactory(assetsManager);
		
		
		scene = new GameScene(stage);
		scene.addComponent(new SimplePhysicSceneComponent(scene.actorsList));
		scene.addComponent(new ProjectileSceneComponent(scene));
		scene.addComponent(new ActorDeathComponent(scene));
		scene.addComponent(new EffectSceneComponent(scene));
		cameraController = new TargetCameraComponent(scene.camera);
		scene.addComponent(cameraController);
		
		mouseController = new MouseController(stage.stage, scene.camera);
		stage.stage.addEventListener(MouseEvent.MOUSE_DOWN, onMouse);
		
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
		scene.addEventListener(ActorEvent.DESPAWN, onDespawnActor);
		
		player = SimpleActorFactory.makeSimpleActor();
		player.type = 0;
		player.model.getModel(PositionModel).speed = 250;
		mouseController.setPlayerData(player.model);
		
		var positionModel = player.model.getModel(PositionModel);
		//positionModel.worldPosition.x = 100 + 16;
		//positionModel.worldPosition.y = 100 + 16;
		
		//positionModel.destinetionPosition.x = 100 + 16;
		//positionModel.destinetionPosition.y = 100 + 16;
		
		cameraController.target = player;
		
		
		
		onSpawnActor(player);
		
		trace('initialise level');
		
		bot = spawnBot();
		bot2 = spawnBot();
		bot3 = spawnBot();
		
		bot3 = spawnBot();
		bot3 = spawnBot();
		bot3 = spawnBot();
		bot3 = spawnBot();
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
	
	private function onMouse(e:MouseEvent):Void 
	{
		var radius = 333;
		bot.model.getModel(PositionModel).destinetionPosition.x = player.model.getModel(PositionModel).worldPosition.x + (-radius + radius * 2 * Math.random());
		bot.model.getModel(PositionModel).destinetionPosition.y = player.model.getModel(PositionModel).worldPosition.y + ( -radius + radius * 2 * Math.random());
		
		bot2.model.getModel(PositionModel).destinetionPosition.x = player.model.getModel(PositionModel).worldPosition.x + (-radius + radius * 2 * Math.random());
		bot2.model.getModel(PositionModel).destinetionPosition.y = player.model.getModel(PositionModel).worldPosition.y + ( -radius + radius * 2 * Math.random());
		
		bot3.model.getModel(PositionModel).destinetionPosition.x = player.model.getModel(PositionModel).worldPosition.x + (-radius + radius * 2 * Math.random());
		bot3.model.getModel(PositionModel).destinetionPosition.y = player.model.getModel(PositionModel).worldPosition.y + (-radius + radius * 2 * Math.random());
	}
	
	public function update()
	{
		var radius = 333;
		if (bot != null && bot.model.state == 0)
		{
			bot.model.getModel(PositionModel).destinetionPosition.x = player.model.getModel(PositionModel).worldPosition.x + (-radius + radius * 2 * Math.random());
			bot.model.getModel(PositionModel).destinetionPosition.y = player.model.getModel(PositionModel).worldPosition.y + (-radius + radius * 2 * Math.random());
		}
		
		if (bot2 != null && bot2.model.state == 0)
		{
			bot2.model.getModel(PositionModel).destinetionPosition.x = player.model.getModel(PositionModel).worldPosition.x + (-radius + radius * 2 * Math.random());
			bot2.model.getModel(PositionModel).destinetionPosition.y = player.model.getModel(PositionModel).worldPosition.y + (-radius + radius * 2 * Math.random());
		}
		
		if (bot3 != null && bot3.model.state == 0)
		{
			bot3.model.getModel(PositionModel).destinetionPosition.x = player.model.getModel(PositionModel).worldPosition.x + (-radius + radius * 2 * Math.random());
			bot3.model.getModel(PositionModel).destinetionPosition.y = player.model.getModel(PositionModel).worldPosition.y + (-radius + radius * 2 * Math.random());
		}
		
		scene.update();
		stage.update();
	}
	
}