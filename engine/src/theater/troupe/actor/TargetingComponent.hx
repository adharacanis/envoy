package theater.troupe.actor;

import theater.troupe.actor.BaseActor;
import theater.troupe.actor.BaseActorComponent;
import theater.troupe.actor.model.EnverionmentModel;

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
		model.target = target;
	}
}