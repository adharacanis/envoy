package theater.troupe.actor;

import theater.events.ActorEvent;
import theater.troupe.actor.BaseActorComponent;
import theater.troupe.actor.model.DestructableModel;

class DestructableComponent extends BaseActorComponent 
{
	var descturctableModel:DestructableModel;
	
	public function new(actor:BaseActor = null) 
	{
		super(actor);
		
		descturctableModel = model.getModel(DestructableModel);
	}
	
	override function initialize() 
	{
		super.initialize();
	}
	
	override public function update() 
	{
		if (model.deathState == 1) return;
		if (descturctableModel.currentHealth <= 0)
		{
			trace('destroyed actor out of health ${actor.id}');
			model.deathState = 1;
			dispatchEvent(new ActorEvent(ActorEvent.DEATH, actor));
		}
		else
		{
			
		}
	}
}