package theater.scene;
import lime.math.Vector2;
import theater.events.ActorEvent;
import theater.troupe.actor.BaseActor;
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
			if (actor == damageSource) continue;
			if (actor.type == 3 || damageSource.type == 3) continue;
			if (actor.id == damageSource.id) continue;
			if (actor.type == 2 && damageSource.type == 1) continue;
			if (actor.type == 1 && damageSource.type == 2) continue;
			if (actor.type == 2 && damageSource.type == 2) continue;
			if (SimplePhysicsUtils.inRadius(radius, applicationPoint, actor.model.getModel(PositionModel).worldPosition))
			{
				applyDamage(actor);
			}
		}
	}
	
	inline public function applyDamage(actor:BaseActor) 
	{
		trace('apply damage, ${actor.id}');
	}
	
	private function onApplyDamage(e:ActorEvent):Void 
	{
		var model = e.actorModel.getModel(ProjectileModel);
		
		if (model.damageRadius > 1)
		{
			applyDamageInRadius(model.damageRadius, e.actor);
		}
	}
}