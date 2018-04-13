package theater.scene;

import theater.troupe.BaseActor;
import theater.troupe.model.PositionModel;

class SimpleMovementSceneComponent extends BaseSceneComponent
{
	
	public function new() 
	{
		super();
	}
	
	override public function update(actor:BaseActor)
	{
		var model:PositionModel = actor.model.getModel(PositionModel);
		
		model.movementVector.setTo(model.worldPositionMovementToX - model.worldPositionX, model.worldPositionMovementToY - model.worldPositionY);
		
		model.movementVector.normalize(1);
		
		//trace(model.movementVector.x, model.movementVector.y);
		
		model.worldPositionX += model.movementVector.x * model.speed;
		model.worldPositionY += model.movementVector.y * model.speed;
	}
}