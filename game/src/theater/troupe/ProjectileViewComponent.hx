package theater.troupe;

import swfdata.DisplayObjectData;

class ProjectileViewComponent extends BaseViewComponent 
{
	public function new(actor:BaseActor, view:DisplayObjectData) 
	{
		super(actor, view);
	}
	
	override public function update(worldStep:WorldStep) 
	{
		super.update(worldStep);
		
		view.transform.rotate(Math.PI / 3.6);
	}
}