package theater.troupe;

import theater.events.ActorEvent;
import theater.troupe.model.LifeTimeModel;

class LifeTimeComponent extends BaseActorComponent 
{
	var lifeTimeModel:LifeTimeModel;

	public function new(actor:BaseActor = null) 
	{
		super(actor);	
		
		lifeTimeModel = model.getModel(LifeTimeModel);
	}
	
	override public function update(worldStep:WorldStep) 
	{
		super.update(worldStep);
		
		if (lifeTimeModel.spawnTime + lifeTimeModel.lifeTime <= worldStep.currentTime && model.deathState == 0)
		{
			dispatchEvent(new ActorEvent(ActorEvent.DEATH, actor, model));
		}
	}
}