package game.troupe;

import lime.math.Vector2;
import swfdata.DisplayObjectData;
import theater.troupe.AttackComponent;
import theater.troupe.BaseActor;
import theater.troupe.BaseViewComponent;
import theater.troupe.DestructableComponent;
import theater.troupe.PositionComponent;
import theater.troupe.model.AttackModel;
import theater.troupe.model.BaseActorModel;
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
		
		actorModel.addModel(positionModel);
		actorModel.addModel(attackModle);
		
		var view:DisplayObjectData = assetsManager.linkagesMap.get("default").clone();
		var viewComponent = new BaseViewComponent(actorModel, view);
		
		var positionComponent = new PositionComponent(actorModel);
		var attackComponent = new AttackComponent(actorModel);
		
		var actor = new BaseActor(actorModel);
		
		actor.addComponent(viewComponent);
		actor.addComponent(positionComponent);
		actor.addComponent(attackComponent);
		
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
		
		actorModel.addModel(positionModel);
		
		var view:DisplayObjectData = assetsManager.linkagesMap.get("default").clone();
		view.transform.scale(0.25, 0.25);
		
		var viewComponent = new BaseViewComponent(actorModel, view);
		
		var positionComponent = new PositionComponent(actorModel);
		//var destructableComponent = new DestructableComponent();
		
		var actor = new BaseActor(actorModel);
		
		actor.addComponent(viewComponent);
		actor.addComponent(positionComponent);
		
		var ownerPositionModel:PositionModel = owner.getModel(PositionModel);
		
		positionModel.worldPosition.x = ownerPositionModel.worldPosition.x;
		positionModel.worldPosition.y = ownerPositionModel.worldPosition.y;
		
		positionModel.destinetionPosition.x = direction.x * 1000;
		positionModel.destinetionPosition.y = direction.y * 1000;
		
		positionModel.speed = 250 + ownerPositionModel.speed;
		
		return actor;
	}
	
}