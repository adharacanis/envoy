package theater.troupe;

import theater.troupe.BaseComponent;
import swfdata.DisplayObjectData;

class BaseViewComponent extends BaseComponent 
{
	public var view:DisplayObjectData;

	public function new(view:DisplayObjectData) 
	{
		super();
		
		this.view = view;
	}
	
	override public function update() 
	{
		super.update();
	}
	
}