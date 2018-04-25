package theater.troupe;

import theater.events.ActorEvent;
import theater.troupe.model.BaseActorModel;
import theater.troupe.model.LifetimeModel;

class LifetimeController extends BaseComponent 
{
	var lifetimeModel:LifetimeModel;

	public function new(model:BaseActorModel = null) 
	{
		super(model);	
		
		lifetimeModel = model.getModel(LifetimeModel);
	}
	
	override public function update(worldStep:WorldStep) 
	{
		super.update(worldStep);
		
		if (lifetimeModel.spawntime + lifetimeModel.lifetime <= worldStep.currentTime)
		{
			dispatchEvent(new ActorEvent(ActorEvent.DEATH, cast target, model));
		}
	}
}