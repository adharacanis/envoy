package theater.events;

import events.Event;
import theater.troupe.BaseActor;
import theater.troupe.model.BaseActorModel;

class ActorEvent extends Event 
{
	static public inline var ATTACK:String = "onAttack";
	static public inline var DEATH:String = "onDeath";
	
	public var actorModel:BaseActorModel;
	public var actor:BaseActor;

	public function new(type:String, actor:BaseActor, actorModel:BaseActorModel) 
	{
		super(type);
		
		this.actor = actor;
		this.actorModel = actorModel;	
	}
	
}