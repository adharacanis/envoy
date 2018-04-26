package theater.troupe;

import theater.troupe.model.EnverionmentModel;

class TargetingComponent extends BaseActorComponent 
{
	var enverionmentModel:EnverionmentModel;

	public function new(actor:BaseActor = null) 
	{
		super(actor);	
		
		enverionmentModel = model.getModel(EnverionmentModel);
	}
	
	override public function update(worldStep:WorldStep) 
	{
		super.update(worldStep);
		
		var target = enverionmentModel.actorsInRange[0];
		model.target = target;
	}
}