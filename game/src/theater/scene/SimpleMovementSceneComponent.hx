package theater.scene;

import theater.troupe.BaseActor;
import theater.troupe.model.PositionModel;

class SimpleMovementSceneComponent extends BaseSceneComponent
{
	
	public function new() 
	{
		super();
	}
	
	override public function update(worldStep:WorldStep, actor:BaseActor)
	{
		var model:PositionModel = actor.model.getModel(PositionModel);
		
		model.movementVector.setTo(model.worldPositionMovementToX - model.worldPositionX, model.worldPositionMovementToY - model.worldPositionY);
		model.movementVector.normalize(1);
		
		//trace(model.movementVector.x, model.movementVector.y);
		
		trace('move factor x=${model.movementVector.x * model.speed * worldStep.step}, y=${model.movementVector.y * model.speed * worldStep.step}');
		
		model.worldPositionX += 0.26;// model.movementVector.x * model.speed * worldStep.step;
		model.worldPositionY += 0.26;// model.movementVector.y * model.speed * worldStep.step;
	}
	
	function calculate()
	{
		var x1 = 0;
		var x2 = 100;
		
		//var dx = v * t;
	}
}