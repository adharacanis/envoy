package theater.scene;

import theater.troupe.BaseActor;
import theater.troupe.model.PositionModel;

using lime.math.Vector2;

class SimplePhysicSceneComponent extends BaseSceneComponent
{
	
	public function new() 
	{
		super();
	}
	
	override public function update(worldStep:WorldStep, actor:BaseActor)
	{
		var model:PositionModel = actor.model.getModel(PositionModel);
		
		var speed = model.speed;
		var step = worldStep.step;
		
		var startPosition = model.worldPosition;
		var destinetionPosition = model.destinetionPosition;
		var direction = model.direction;
		
		var distance = destinetionPosition.distance(startPosition);
		if (distance == 0)
			return;
			
		direction.setTo((destinetionPosition.x - startPosition.x) / distance, (destinetionPosition.y - startPosition.y) / distance);
		
		var movementDistance = speed * step;
		
		if (distance < movementDistance) {
			movementDistance = distance;
		}
		
		startPosition.x += direction.x * movementDistance;
		startPosition.y += direction.y * movementDistance;
	}
	
	function calculate()
	{
		var x1 = 0;
		var x2 = 100;
		
		//var dx = v * t;
	}
}