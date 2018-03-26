package game.troupe;

import theater.troupe.BaseActor;
import theater.troupe.BaseViewComponent;
import theater.troupe.DestructableComponent;
import theater.troupe.PositionComponent;
import theater.troupe.model.BaseActorModel;

class SimpleActorFactory 
{
	static var assetsManager:AssetsManager;

	public function new(assetsManager:AssetsManager) 
	{
		SimpleActorFactory.assetsManager = assetsManager;
	}
	
	public static function makeSimpleActor()
	{
		var view = assetsManager.linkagesMap.get("x1_0animation/biker.ani");
		view.x = 100;
		view.y = 300;
		var viewComponent = new BaseViewComponent(view);
		var positionComponent = new PositionComponent();
		var destructableComponent = new DestructableComponent();
		
		var actorModel = new BaseActorModel();
		
		var actor = new BaseActor(actorModel);
		
		actor.addComponent(viewComponent);
		actor.addComponent(positionComponent);
		actor.addComponent(destructableComponent);
		
		return actor;
	}
	
}