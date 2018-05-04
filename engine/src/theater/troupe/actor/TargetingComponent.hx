package theater.troupe.actor;

import theater.scene.SimplePhysicsUtils;
import theater.troupe.actor.BaseActor;
import theater.troupe.actor.BaseActorComponent;
import theater.troupe.actor.model.EnverionmentModel;
import theater.troupe.actor.model.PositionModel;

class TargetingComponent extends BaseActorComponent 
{
	var enverionmentModel:EnverionmentModel;

	public function new(actor:BaseActor = null) 
	{
		super(actor);	
		
		enverionmentModel = model.getModel(EnverionmentModel);
	}
	
	override public function update() 
	{
		super.update();
		
		var target = enverionmentModel.actorsInRange[0];
		
		if (target == null) return;
		if (SimplePhysicsUtils.distance(target.getModel(PositionModel).worldPosition, model.getModel(PositionModel).worldPosition) > 700) 
			model.target = null;
		else
			model.target = target;
	}
}