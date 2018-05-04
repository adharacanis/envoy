package theater.troupe.actor;

import theater.events.ActorEvent;
import theater.troupe.actor.BaseActor;
import theater.troupe.actor.BaseActorComponent;

class ProjectileDeathComponent extends BaseActorComponent 
{
	public function new(actor:BaseActor) 
	{
		super(actor);
	}
	
	override function initialize() 
	{
		super.initialize();
		
		actor.addEventListener(ActorEvent.DEATH, onDestroyed);
		actor.addEventListener(ActorEvent.COLLIDE, onDestroyed);
	}
	
	private function onDestroyed(e:ActorEvent):Void 
	{
		//play death effect animation
		//find objects in "damage radius"
		//apply damage
		//despawn projectile
		
		if (model.deathState == 0)
		{
			model.deathState = 1;
			
			dispatchEvent(new ActorEvent(ActorEvent.PROJECTILE_APPLY_DAMAGE, actor, model));
			dispatchEvent(new ActorEvent(ActorEvent.DESPAWN, actor, model));
		}
	}
}