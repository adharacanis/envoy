package theater.troupe;

import swfdata.DisplayObjectData;
import theater.events.SceneEvent;
import theater.troupe.BaseActorComponent;
import theater.troupe.model.PositionModel;

class BaseViewComponent extends BaseActorComponent 
{
	var positionModel:PositionModel;
	
	public var view:DisplayObjectData;

	public function new(actor:BaseActor, view:DisplayObjectData) 
	{
		super(actor);
		
		this.view = view;
		
		positionModel = model.getModel(PositionModel);
	}
	
	override public function onAddedToScene(e:SceneEvent):Void 
	{
		//TODO: add flag on added/removed from scene. When flag turned off first time setPosition must set position instead of interpolate position and mark that "first-set-position" is made
		view.x = positionModel.worldPosition.x;
		view.y = positionModel.worldPosition.y;
	}
	
	var currentAngle:Float = 0;
	override public function update(worldStep:WorldStep) 
	{
		
		
		var theta = Math.atan2(-positionModel.direction.x, -positionModel.direction.y);
		
		//if (theta < 0)
			//theta += Math.PI * 2 + Math.PI / 2;
		theta += Math.PI / 2;
		view.transform.rotate(currentAngle-theta);
		currentAngle = theta;
		
		setPosition();
		
		super.update(worldStep);
	}
	
	inline private function setPosition()
	{
		view.x = (view.x + positionModel.worldPosition.x) / 2;
		view.y = (view.y + positionModel.worldPosition.y) / 2;
		
		view.x = positionModel.worldPosition.x;
		view.y = positionModel.worldPosition.y;
	}
	
}