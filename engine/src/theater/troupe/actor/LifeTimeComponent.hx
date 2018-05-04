package theater.troupe.actor;

import theater.events.ActorEvent;
import theater.events.SceneEvent;
import theater.troupe.actor.BaseActor;
import theater.troupe.actor.BaseActorComponent;
import theater.troupe.actor.model.LifeTimeModel;

class LifeTimeComponent extends BaseActorComponent 
{
	var lifeTimeModel:LifeTimeModel;

	public function new(actor:BaseActor = null) 
	{
		super(actor);	
		
		lifeTimeModel = model.getModel(LifeTimeModel);
	}
	
	override function onAddedToScene(e:SceneEvent):Void 
	{
		super.onAddedToScene(e);
		lifeTimeModel.spawnTime = worldStep.currentTime;
		lifeTimeModel.endTime = lifeTimeModel.spawnTime + lifeTimeModel.lifeTime;
	}
	
	override public function update() 
	{
		super.update();
		
		lifeTimeModel.partOfComplete = (worldStep.currentTime - lifeTimeModel.spawnTime) / lifeTimeModel.lifeTime;
		
		if (lifeTimeModel.partOfComplete > 1)
			lifeTimeModel.partOfComplete = 1;
		
		if (lifeTimeModel.partOfComplete == 1 && !lifeTimeModel.isComplete)
		{
			lifeTimeModel.isComplete = true;
			dispatchEvent(new ActorEvent(ActorEvent.DEATH, actor));
		}
	}
}