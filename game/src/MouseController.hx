package;

import openfl.display.Stage;
import openfl.events.MouseEvent;
import theater.scene.BaseItirableSceneComponent;
import theater.scene.Camera;
import theater.troupe.actor.BaseActor;
import theater.troupe.actor.model.BaseActorModel;
import theater.troupe.actor.model.PositionModel;

class MouseController extends BaseItirableSceneComponent
{
	var positionModel:PositionModel;
	var camera:Camera;
	var isMouseDown:Bool;
	var stage:Stage;

	public function new(stage:Stage, camera:Camera) 
	{
		super();
		this.stage = stage;
		
		this.camera = camera;
		stage.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
		stage.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
	}
	
	public function setPlayerData(actor:BaseActorModel)
	{
		positionModel = actor.getModel(PositionModel);
	}
	
	private function onMouseUp(e:MouseEvent):Void 
	{
		isMouseDown = false;
	}
	
	private function onMouseDown(e:MouseEvent):Void 
	{
		isMouseDown = true;
	}
	
	override public function update(actor:BaseActor) 
	{
		super.update(actor);
		
		if (!isMouseDown) return;
		positionModel.destinetionPosition.x = stage.mouseX * 2 - 400 * 2 + -camera.x;
		positionModel.destinetionPosition.y = stage.mouseY * 2 - 400 * 2 + -camera.y;
	}
	
}