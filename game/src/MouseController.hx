package;

import openfl.display.Stage;
import openfl.events.MouseEvent;
import theater.scene.Camera;
import theater.troupe.actor.model.BaseActorModel;
import theater.troupe.actor.model.PositionModel;

class MouseController 
{
	var positionModel:PositionModel;
	var camera:Camera;

	public function new(stage:Stage, camera:Camera) 
	{
		this.camera = camera;
		stage.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
	}
	
	public function setPlayerData(actor:BaseActorModel)
	{
		positionModel = actor.getModel(PositionModel);
	}
	
	private function onMouseDown(e:MouseEvent):Void 
	{
		positionModel.destinetionPosition.x = e.stageX - 400 + -camera.x;
		positionModel.destinetionPosition.y = e.stageY - 400 + -camera.y;
	}
	
}