package theater.troupe;

import swfdata.DisplayObjectData;
import theater.events.SceneEvent;
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
		
		this.view = view;
		
		positionModel = model.getModel(PositionModel);
	}
	
	override function onAddedToScene(e:SceneEvent):Void 
	{
		super.onAddedToScene(e);
		
		//TODO: add flag on added/removed from scene. When flag turned off first time setPosition must set position instead of interpolate position and mark that "first-set-position" is made
		view.x = positionModel.worldPosition.x;
		view.y = positionModel.worldPosition.y;
	}
	
	var currentAngle:Float = 0;
	override public function update(worldStep:WorldStep) 
	{
		setPosition();
		
		var theta = Math.atan2(-positionModel.direction.x, -positionModel.direction.y);
		
		//if (theta < 0)
			//theta += Math.PI * 2 + Math.PI / 2;
		theta += Math.PI / 2;
		view.transform.rotate(currentAngle-theta);
		currentAngle = theta;
		
		super.update(worldStep);
	}
	
	inline private function setPosition()
	{
		view.x = (view.x + positionModel.worldPosition.x) / 2;
		view.y = (view.y + positionModel.worldPosition.y) / 2;
	}
	
}