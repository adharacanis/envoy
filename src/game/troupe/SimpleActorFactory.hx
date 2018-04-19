package game.troupe;

import swfdata.DisplayObjectData;
import theater.troupe.BaseActor;
import theater.troupe.BaseViewComponent;
import theater.troupe.DestructableComponent;
import theater.troupe.PositionComponent;
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
		
		actorModel.addModel(positionModel);
		
		var view:DisplayObjectData = assetsManager.linkagesMap.get("default").clone();
		var viewComponent = new BaseViewComponent(actorModel, view);
		
		var positionComponent = new PositionComponent(actorModel);
		var destructableComponent = new DestructableComponent();
		
		var actor = new BaseActor(actorModel);
		
		actor.addComponent(viewComponent);
		actor.addComponent(positionComponent);
		actor.addComponent(destructableComponent);
		
		//positionModel.worldPositionX = 200;
		//positionModel.worldPositionY = 100;
		
		//positionModel.worldPositionMovementToX = 500;
		//positionModel.worldPositionMovementToY = 400;
		
		return actor;
	}
	
}