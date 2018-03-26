package theater.troupe;

import theater.troupe.model.DestructableModel;

class DestructableComponent extends BaseComponent 
{
	public function new() 
	{
		super(new DestructableModel());
	}
	
	override public function update() 
	{
		super.update();
		
		
	}
}