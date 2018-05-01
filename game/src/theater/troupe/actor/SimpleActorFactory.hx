package theater.troupe.actor;

import lime.math.Vector2;
import renderer.BlendMode;
import swfdata.DisplayObjectData;
import theater.troupe.actor.model.AttackModel;
import theater.troupe.actor.model.BaseActorModel;
import theater.troupe.actor.model.EnverionmentModel;
import theater.troupe.actor.model.LifeTimeModel;
import theater.troupe.actor.model.PositionModel;
import theater.troupe.effect.SimpleProjectileImpactEffect;

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
		
		attackModle.attackCooldown = 750 + Math.random() * 500;
		
		actorModel.addModel(positionModel);
		actorModel.addModel(attackModle);
		actorModel.addModel(enverionmentModel);
		
		var view:DisplayObjectData = assetsManager.linkagesMap.get("default").clone();
		
		var actor = new BaseActor(actorModel);
		actor.type = 1;
		
		var viewComponent = new BaseViewComponent(actor, view);
		var positionComponent = new PositionComponent(actor);
		var attackComponent = new AttackComponent(actor);
		var targetingComponent = new TargetingComponent(actor);
		
		
		actor.addComponent(viewComponent);
		actor.addComponent(positionComponent);
		actor.addComponent(attackComponent);
		actor.addComponent(targetingComponent);
		
		positionModel.speed = 350;
		
		//positionModel.worldPositionX = 200;
		//positionModel.worldPositionY = 100;
		
		//positionModel.worldPositionMovementToX = 500;
		//positionModel.worldPositionMovementToY = 400;
		
		return actor;
	}
	
	public static function makeSimpleProjectile(owner:BaseActor, direction:Vector2)
	{
		var actorModel = new BaseActorModel();
		var positionModel = new PositionModel();
		var lifetimeModel = new LifeTimeModel();
		lifetimeModel.lifeTime = 4000;
		
		actorModel.addModel(positionModel);
		actorModel.addModel(lifetimeModel);
		
		var view:DisplayObjectData = assetsManager.linkagesMap.get("default#2").clone();
		view.scaleX = view.scaleY = 0.5;
		
		
		var actor = new BaseActor(actorModel);
		actor.type = 2;
		actor.id = owner.id;
		
		var viewComponent = new ProjectileViewComponent(actor, view);
		var positionComponent = new PositionComponent(actor);
		var lifetimeComponent = new LifeTimeComponent(actor);
		var deathComponent = new ProjectileDeathComponent(actor);
		//var destructableComponent = new DestructableComponent();
		
		actor.addComponentAs(BaseViewComponent, viewComponent);
		actor.addComponent(positionComponent);
		actor.addComponent(lifetimeComponent);
		actor.addComponent(deathComponent);
		
		var ownerPositionModel:PositionModel = owner.model.getModel(PositionModel);
		
		positionModel.worldPosition.x = ownerPositionModel.worldPosition.x;
		positionModel.worldPosition.y = ownerPositionModel.worldPosition.y;
		
		positionModel.destinetionPosition.x = positionModel.worldPosition.x + direction.x * 2000;
		positionModel.destinetionPosition.y = positionModel.worldPosition.y + direction.y * 2000;
		
		positionModel.speed = 500 + ownerPositionModel.speed;
		
		return actor;
	}
	
	public static function makeEffect(target:BaseActor) 
	{
		var actorModel = new BaseActorModel();
		var positionModel = new PositionModel();
		var lifetimeModel = new LifeTimeModel();
		lifetimeModel.lifeTime = 500;
		
		actorModel.addModel(positionModel);
		actorModel.addModel(lifetimeModel);
		
		var actor = new BaseActor(actorModel);
		actor.type = 3;
		
		var view:DisplayObjectData = assetsManager.linkagesMap.get("default#1").clone();
		view.rotation = Math.random() * 360;
		view.blendMode = 8;
		view.setColorData();
		
		var viewComponent = new SimpleProjectileImpactEffect(actor, view);
		var positionComponent = new PositionComponent(actor);
		var lifetimeComponent = new LifeTimeComponent(actor);
		
		actor.addComponentAs(BaseViewComponent, viewComponent);
		actor.addComponent(positionComponent);
		actor.addComponent(lifetimeComponent);
		
		var targetPosition = target.model.getModel(PositionModel);
		positionModel.worldPosition.setTo(targetPosition.worldPosition.x, targetPosition.worldPosition.y);
		
		return actor;
	}
	
}