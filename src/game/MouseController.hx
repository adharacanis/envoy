package game;
import openfl.display.Stage;
import openfl.events.MouseEvent;
import theater.troupe.model.BaseActorModel;
import theater.troupe.model.PositionModel;

class MouseController 
{
	var positionModel:PositionModel;

	public function new(stage:Stage) 
	{
		stage.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
	}
	
	public function setPlayerData(actor:BaseActorModel)
	{
		positionModel = actor.getModel(PositionModel);
	}
	
	private function onMouseDown(e:MouseEvent):Void 
	{
		positionModel.destinetionPosition.x = e.stageX;
		positionModel.destinetionPosition.y = e.stageY;
	}
	
}