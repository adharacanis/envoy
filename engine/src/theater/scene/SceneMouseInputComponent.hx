package theater.scene;

import input.UserInputData;
import openfl.events.MouseEvent;
import theater.scene.BaseItirableSceneComponent;
import theater.scene.Camera;
import theater.troupe.actor.BaseActor;
import theater.troupe.actor.model.BaseActorModel;
import theater.troupe.actor.model.PositionModel;

class SceneMouseInputComponent extends BaseItirableSceneComponent
{
	var camera:Camera;
	var userInputData:UserInputData;
	
	var positionModel:PositionModel;

	public function new(userInputData:UserInputData, camera:Camera) 
	{
		super();
		
		this.userInputData = userInputData;
		this.camera = camera;
	}
	
	public function setPlayerData(actor:BaseActorModel)
	{
		positionModel = actor.getModel(PositionModel);
	}
	
	override public function update(actor:BaseActor) 
	{
		super.update(actor);
		
		if (!userInputData.isMouseDown) return;
		positionModel.destinetionPosition.x = userInputData.mousePosition.x * 2 - 400 * 2 + -camera.x;
		positionModel.destinetionPosition.y = userInputData.mousePosition.y * 2 - 400 * 2 + -camera.y;
	}
}