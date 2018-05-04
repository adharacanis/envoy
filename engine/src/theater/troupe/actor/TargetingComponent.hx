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
		
		if (model.target != null) return;
		
		model.target = null;
		var myPosition = model.getModel(PositionModel).worldPosition;
		var actorsList = enverionmentModel.actorsInRange;
		var lastDistance:Float = 9999999;
		for (i in 0...actorsList.length)
		{
			var currentActor = actorsList[i];
			
			if (currentActor.type == 3 || currentActor.type == 2) continue;
			if (currentActor == actor) continue;
			if (currentActor.model.deathState == 1) continue;
			
			var targetPosition = currentActor.model.getModel(PositionModel).worldPosition;
			var distance = SimplePhysicsUtils.distance(targetPosition, myPosition);
			
			if (distance > 700) continue;
			if (distance >= lastDistance) continue;
			
			model.target = currentActor.model;
			lastDistance = distance;
		}
	}
}