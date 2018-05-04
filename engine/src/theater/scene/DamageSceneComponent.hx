package theater.scene;

import theater.events.ActorEvent;
import theater.troupe.actor.BaseActor;
import theater.troupe.actor.model.DestructableModel;
import theater.troupe.actor.model.PositionModel;
import theater.troupe.actor.model.ProjectileModel;

class DamageSceneComponent extends BaseSceneComponent 
{
	var actorsList:Array<BaseActor>;
	var scene:BaseScene;

	public function new(scene:BaseScene, actorsList:Array<BaseActor>) 
	{
		super();
		
		this.scene = scene;
		this.actorsList = actorsList;
		
		scene.addEventListener(ActorEvent.PROJECTILE_APPLY_DAMAGE, onApplyDamage);
	}
	
	public function applyDamageInRadius(radius:Float, damageSource:BaseActor)
	{
		
		var objectsInRaius:Array<BaseActor> = [];
		var positionModel = damageSource.model.getModel(PositionModel);
		var applicationPoint = positionModel.worldPosition;
		
		for (actor in actorsList)
		{
			if (SimplePhysicsUtils.filter(actor, damageSource)) continue;
			
			if (SimplePhysicsUtils.inRadius(radius, applicationPoint, actor.model.getModel(PositionModel).worldPosition))
			{
				applyDamage(actor);
			}
		}
	}
	
	inline public function applyDamage(actor:BaseActor) 
	{
		actor.model.getModel(DestructableModel).currentHealth -= 25;
	}
	
	private function onApplyDamage(e:ActorEvent):Void 
	{
		var actor = e.actor;
		var model = actor.model.getModel(ProjectileModel);
		
		if (model.damageRadius > 1)
		{
			applyDamageInRadius(model.damageRadius, actor);
		}
	}
}