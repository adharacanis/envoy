package theater.troupe.actor;

import theater.troupe.actor.BaseActorComponent;
import theater.troupe.actor.model.DestructableModel;

class DestructableComponent extends BaseActorComponent 
{
	var descturctableModel:DestructableModel;
	
	public function new() 
	{
		super(new DestructableModel());
		descturctableModel = Lang.as2(model, DestructableModel);
	}
	
	override public function update(worldStep:WorldStep) 
	{
		super.update(worldStep);
		
		//if (descturctableModel.currentHealth <= descturctableModel.maxHealth)
		//	trace('destruction');
	}
}