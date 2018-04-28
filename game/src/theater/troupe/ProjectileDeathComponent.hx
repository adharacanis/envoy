package theater.troupe;

import theater.events.ActorEvent;

class ProjectileDeathComponent extends BaseActorComponent 
{
	public function new(actor:BaseActor) 
	{
		super(actor);
	}
	
	override function initialize() 
	{
		super.initialize();
		
		actor.addEventListener(ActorEvent.DEATH, onDeath);
	}
	
	private function onDeath(e:ActorEvent):Void 
	{
		//play death effect animation
		//find objects in "damage radius"
		//apply damage
		//despawn projectile
		
		model.deathState = 1;
		
		dispatchEvent(new ActorEvent(ActorEvent.DESPAWN, actor, model));
	}
}