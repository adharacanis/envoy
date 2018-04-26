package theater.scene;

import theater.troupe.BaseActor;
import theater.troupe.model.PositionModel;
import theater.scene.SimplePhysicsUtils;

using lime.math.Vector2;

class SimplePhysicSceneComponent extends BaseSceneComponent
{
	private var movementStep:Vector2 = new Vector2();
	
	public function new() 
	{
		super();
	}
	
	override public function update(worldStep:WorldStep, actor:BaseActor)
	{
		var model:PositionModel = actor.model.getModel(PositionModel);
		
		var speed = model.speed;
		var step = worldStep.step;
		
		var origin = model.worldPosition;
		var destination = model.destinetionPosition;
		var direction = model.direction;
		
		var distance = destination.distance(origin);
		if (distance == 0)
		{
			actor.model.state = 0;
			return;
		}
			
		actor.model.state = 1; 
		
		direction = SimplePhysicsUtils.calculateDirection(origin, destination, distance, direction);
		
		var movementDistance = SimplePhysicsUtils.calculateMovementDistance(speed, step, distance);
		movementStep = SimplePhysicsUtils.calculateMovementStep(movementDistance, direction, movementStep);
		
		origin.x += movementStep.x;
		origin.y += movementStep.y;
	}
}