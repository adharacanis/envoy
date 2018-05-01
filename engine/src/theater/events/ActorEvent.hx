package theater.events;

import events.Event;
import theater.troupe.actor.BaseActor;
import theater.troupe.actor.model.BaseActorModel;

class ActorEvent extends Event 
{
	static public inline var ATTACK:String = "onAttack";
	static public inline var DEATH:String = "onDeath";
	
	static public inline var SPAWN:String = "onSpawn";
	static public inline var DESPAWN:String = "onDespawn";
	
	static public inline var PROJECTILE_APPLY_DAMAGE:String = "onProjectileApplyDamage";
	
	public var actorModel:BaseActorModel;
	public var actor:BaseActor;

	public function new(type:String, actor:BaseActor, actorModel:BaseActorModel) 
	{
		super(type);
		
		this.actor = actor;
		this.actorModel = actorModel;	
	}
	
}