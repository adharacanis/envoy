package theater.scene;

import MouseController;
import flash.display.SpreadMethod;
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
	var cameraController:TargetCameraComponent;
	
	public function new(stage:GlStage, assetsManager:AssetsManager) 
	{
		this.stage = stage;
		
		var actorFactory = new SimpleActorFactory(assetsManager);
		
		
		scene = new GameScene(stage);
		scene.addComponent(new SimplePhysicSceneComponent(scene.actorsList));
		scene.addComponent(new ProjectileSceneComponent(scene));
		scene.addComponent(new ActorDeathComponent(scene));
		scene.addComponent(new EffectSceneComponent(scene));
		scene.addComponent(new DamageSceneComponent(scene, scene.actorsList));
		cameraController = new TargetCameraComponent(scene.camera);
		scene.addComponent(cameraController);
		
		mouseController = new MouseController(stage.stage, scene.camera);
		scene.addComponent(mouseController);
		
		initialise();
	}
	
	function onSpawnActor(e:ActorEvent)
	{
		spawn(e.actor);
	}
	
	function spawn(actor:BaseActor)
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
		scene.addEventListener(ActorEvent.SPAWN, onSpawnActor);
		
		player = SimpleActorFactory.makeSimpleActor();
		player.type = 0;
		player.model.getModel(PositionModel).speed -= 2;
		mouseController.setPlayerData(player.model);
		
		var positionModel = player.model.getModel(PositionModel);
		//positionModel.worldPosition.x = 100 + 16;
		//positionModel.worldPosition.y = 100 + 16;
		
		//positionModel.destinetionPosition.x = 100 + 16;
		//positionModel.destinetionPosition.y = 100 + 16;
		
		cameraController.target = player;
		
		
		
		spawn(player);
		
		trace('initialise level');
		
		for(i in 0...50)
			bot = spawnBot();
		
		//bot3 = spawnBot();
		//bot3 = spawnBot();
		//bot3 = spawnBot();
		//bot3 = spawnBot();
	}
	
	var bot:BaseActor;
	var bot3:BaseActor;
	var bot2:BaseActor;
	function spawnBot()
	{
		var bot = SimpleActorFactory.makeBotActor();
		var envModel:EnverionmentModel = bot.model.getModel(EnverionmentModel);
		envModel.actorsInRange.push(player.model);
		
		var positionModel = bot.model.getModel(PositionModel);
		positionModel.worldPosition.x = -1600 + Math.random() * 3200;
		positionModel.worldPosition.y = -1600 + Math.random() * 3200;
		
		positionModel.destinetionPosition.x = positionModel.worldPosition.x;
		positionModel.destinetionPosition.y = positionModel.worldPosition.y;
		
		spawn(bot);
		return bot;
	}
	
	public function update()
	{
		scene.update();
		stage.update();
	}
	
}