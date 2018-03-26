package theater.troupe;

import theater.troupe.model.PositionModel;

class PositionComponent extends BaseComponent 
{
	public function new() 
	{
		super();
		
		model = new PositionModel(100, 300);
	}
}