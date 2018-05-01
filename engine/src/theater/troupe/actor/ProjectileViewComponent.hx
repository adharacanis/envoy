package theater.troupe.actor;

import swfdata.DisplayObjectData;
import theater.troupe.actor.BaseActor;
import theater.troupe.actor.BaseViewComponent;

class ProjectileViewComponent extends BaseViewComponent 
{
	public function new(actor:BaseActor, view:DisplayObjectData) 
	{
		super(actor, view);
	}
	
	override public function update() 
	{	
		view.rotation += 100;
		setPosition();
	}
}