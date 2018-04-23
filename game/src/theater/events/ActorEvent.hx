package theater.events;

import events.Event;
import theater.troupe.model.BaseActorModel;

class ActorEvent extends Event 
{
	static public inline var ATTACK:String = "onAttack";
	
	public var actorModel:BaseActorModel;

	public function new(type:String, actorModel:BaseActorModel) 
	{
		super(type);
		
		this.actorModel = actorModel;	
	}
	
}