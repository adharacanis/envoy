package theater.troupe;

import theater.troupe.model.DestructableModel;

class DestructableComponent extends BaseComponent 
{
	var descturctableModel:DestructableModel;
	
	public function new() 
	{
		super(new DestructableModel());
		descturctableModel = Lang.as2(model, DestructableModel);
	}
	
	override public function update() 
	{
		super.update();
		
		//if (descturctableModel.currentHealth <= descturctableModel.maxHealth)
		//	trace('destruction');
	}
}