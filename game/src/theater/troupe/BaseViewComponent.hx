package theater.troupe;

import swfdata.DisplayObjectData;
import theater.troupe.BaseComponent;
import theater.troupe.model.BaseActorModel;
import theater.troupe.model.PositionModel;

class BaseViewComponent extends BaseComponent 
{
	var positionModel:PositionModel;
	
	public var view:DisplayObjectData;

	public function new(model:BaseActorModel, view:DisplayObjectData) 
	{
		super(model);
		
		positionModel = model.getModel(PositionModel);
		
		this.view = view;
	}
	
	var theta:Float = Math.PI / 360;
	override public function update(worldStep:WorldStep) 
	{
		view.x = (view.x + positionModel.worldPosition.x) / 2;
		view.y = (view.y + positionModel.worldPosition.y) / 2;
		
		
		//view.transform.rotate(theta);
		
		
		super.update(worldStep);
	}
	
}