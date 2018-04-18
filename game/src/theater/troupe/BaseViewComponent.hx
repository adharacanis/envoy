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
	
	override public function update(worldStep:WorldStep) 
	{
		view.x = positionModel.worldPositionX;
		view.y = positionModel.worldPositionY;
		
		
		super.update(worldStep);
	}
	
}