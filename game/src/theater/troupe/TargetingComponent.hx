package theater.troupe;

import theater.troupe.model.BaseActorModel;
import theater.troupe.model.EnverionmentModel;

class TargetingComponent extends BaseComponent 
{
	var enverionmentModel:EnverionmentModel;

	public function new(model:BaseActorModel = null) 
	{
		super(model);	
		
		enverionmentModel = model.getModel(EnverionmentModel);
	}
	
	override public function update(worldStep:WorldStep) 
	{
		super.update(worldStep);
		
		var target = enverionmentModel.actorsInRange[0];
		model.target = target;
	}
}