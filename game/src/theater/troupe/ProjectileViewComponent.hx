package theater.troupe;

import swfdata.DisplayObjectData;
import theater.troupe.model.BaseActorModel;

class ProjectileViewComponent extends BaseViewComponent 
{
	public function new(model:BaseActorModel, view:DisplayObjectData) 
	{
		super(model, view);
	}
	
	override public function update(worldStep:WorldStep) 
	{
		super.update(worldStep);
		
		view.transform.rotate(Math.PI / 3.6);
	}
}