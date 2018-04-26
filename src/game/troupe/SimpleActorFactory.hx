package game.troupe;

import lime.math.Vector2;
import swfdata.DisplayObjectData;
import theater.troupe.AttackComponent;
import theater.troupe.BaseActor;
import theater.troupe.BaseViewComponent;
import theater.troupe.LifeTimeComponent;
import theater.troupe.PositionComponent;
import theater.troupe.ProjectileDeathComponent;
import theater.troupe.ProjectileViewComponent;
import theater.troupe.TargetingComponent;
import theater.troupe.model.AttackModel;
import theater.troupe.model.BaseActorModel;
import theater.troupe.model.EnverionmentModel;
import theater.troupe.model.LifeTimeModel;
import theater.troupe.model.PositionModel;

class SimpleActorFactory 
{
	static var assetsManager:AssetsManager;

	public function new(assetsManager:AssetsManager) 
	{
		SimpleActorFactory.assetsManager = assetsManager;
	}
	
	public static function makeSimpleActor()
	{
		var actorModel = new BaseActorModel();
		var positionModel = new PositionModel();
		var attackModle = new AttackModel();
		var enverionmentModel = new EnverionmentModel();
		
		attackModle.attackCooldown = 100 + Math.random() * 100;
		
		actorModel.addModel(positionModel);
		actorModel.addModel(attackModle);
		actorModel.addModel(enverionmentModel);
		
		var view:DisplayObjectData = assetsManager.linkagesMap.get("default").clone();
		
		var actor = new BaseActor(actorModel);
		
		var viewComponent = new BaseViewComponent(actor, view);
		var positionComponent = new PositionComponent(actor);
		var attackComponent = new AttackComponent(actor);
		var targetingComponent = new TargetingComponent(actor);
		
		
		actor.addComponent(viewComponent);
		actor.addComponent(positionComponent);
		actor.addComponent(attackComponent);
		actor.addComponent(targetingComponent);
		
		positionModel.speed = 250;
		
		//positionModel.worldPositionX = 200;
		//positionModel.worldPositionY = 100;
		
		//positionModel.worldPositionMovementToX = 500;
		//positionModel.worldPositionMovementToY = 400;
		
		return actor;
	}
	
	public static function makeSimpleProjectile(owner:BaseActorModel, direction:Vector2)
	{
		var actorModel = new BaseActorModel();
		var positionModel = new PositionModel();
		var lifetimeModel = new LifeTimeModel();
		lifetimeModel.spawnTime = WorldTimeController.now;
		lifetimeModel.lifeTime = 2500;
		
		actorModel.addModel(positionModel);
		actorModel.addModel(lifetimeModel);
		
		var view:DisplayObjectData = assetsManager.linkagesMap.get("default").clone();
		view.transform.scale(0.5, 0.5);
		
		
		var actor = new BaseActor(actorModel);
		
		var viewComponent = new ProjectileViewComponent(actor, view);
		var positionComponent = new PositionComponent(actor);
		var lifetimeComponent = new LifeTimeComponent(actor);
		var deathComponent = new ProjectileDeathComponent(actor);
		//var destructableComponent = new DestructableComponent();
		
		actor.addComponentAs(BaseViewComponent, viewComponent);
		actor.addComponent(positionComponent);
		actor.addComponent(lifetimeComponent);
		actor.addComponent(deathComponent);
		
		var ownerPositionModel:PositionModel = owner.getModel(PositionModel);
		
		positionModel.worldPosition.x = ownerPositionModel.worldPosition.x;
		positionModel.worldPosition.y = ownerPositionModel.worldPosition.y;
		
		positionModel.destinetionPosition.x = positionModel.worldPosition.x + direction.x * 1000;
		positionModel.destinetionPosition.y = positionModel.worldPosition.y + direction.y * 1000;
		
		positionModel.speed = 300;// + ownerPositionModel.speed;
		
		return actor;
	}
	
}