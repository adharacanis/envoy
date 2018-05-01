package theater.troupe.actor;

import swfdata.DisplayObjectData;
import theater.events.SceneEvent;
import theater.troupe.actor.BaseActor;
import theater.troupe.actor.BaseActorComponent;
import theater.troupe.actor.model.PositionModel;

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
	
	var angleDelta:Float = Math.PI * 2 + Math.PI / 2;
	var radToDegree:Float = -180 / Math.PI;
	override public function update() 
	{
		var theta = Math.atan2(-positionModel.direction.x, -positionModel.direction.y);
		view.rotation = (theta + angleDelta) * radToDegree;
		setPosition();
	}
	
	inline private function setPosition()
	{
		view.x = (view.x + positionModel.worldPosition.x) / 2;
		view.y = (view.y + positionModel.worldPosition.y) / 2;
	}
	
}