package theater.events;

import events.Event;
import theater.troupe.actor.BaseActor;

class ActorEvent extends Event 
{
	static public inline var ATTACK:String = "onAttack";
	static public inline var DEATH:String = "onDeath";
	
	static public inline var SPAWN:String = "onSpawn";
	static public inline var DESPAWN:String = "onDespawn";
	
	static public inline var COLLIDE:String = "onCollide";
	
	static public inline var PROJECTILE_APPLY_DAMAGE:String = "onProjectileApplyDamage";
	
	public var actor:BaseActor;

	public function new(type:String, actor:BaseActor) 
	{
		super(type);
		
		this.actor = actor;	
	}
	
}