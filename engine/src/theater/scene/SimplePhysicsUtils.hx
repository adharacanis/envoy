package theater.scene;

import lime.math.Vector2;
import theater.troupe.actor.model.PositionModel;

using lime.math.Vector2;

typedef TwoDimensionVector = {
	public var x:Float;
	public var y:Float;
}

class SimplePhysicsUtils 
{

	public function new() 
	{
		
	}
	
	inline static public function filter(modelA:PositionModel, modelB:PositionModel)
	{
		/*
		if (actor == damageSource) continue;
		if (actor.type == 3 || damageSource.type == 3) continue;
		if (actor.id == damageSource.id) continue;
		if (actor.type == 2 && damageSource.type == 1) continue;
		if (actor.type == 1 && damageSource.type == 2) continue;
		if (actor.type == 2 && damageSource.type == 2) continue;
		*/
		/*
		if (actorA == actorB) return;
		if (actorA.type == 3 || actorB.type == 3) return;
		if (actorA.id == actorB.id) return;
		if (actorA.type == 2 && actorB.type == 1) return;
		if (actorA.type == 1 && actorB.type == 2) return;
		if (actorA.type == 2 && actorB.type == 2) return;
		*/

		return modelA == modelB || modelA.group.filterGroup(modelB.group);
		
		/*return if (actorA == actorB) true;
		else if (actorA.type == 3 || actorB.type == 3) true;
		else if (actorA.id == actorB.id) true;
		//if (actorA.type == 2 && actorB.type == 1) false;
		//if (actorA.type == 1 && actorB.type == 2) false;
		else if (actorA.type == 2 && actorB.type == 2) true;
		//if (actorA.type == 0 && actorB.type == 2) true;
		//if (actorA.type == 2 && actorB.type == 0) true;

		else return false;*/
	}
	
	inline static public function inRadius(radius:Float, appliationPoint:TwoDimensionVector, interestPoint:TwoDimensionVector):Bool
	{
		return distance(appliationPoint, interestPoint) < radius;
	}
	
	inline static public function distance(point1:TwoDimensionVector, point2:TwoDimensionVector):Float
	{
		var value1:Float = (point1.x - point2.x);
		value1 *= value1;
		
		var value2:Float = (point1.y - point2.y);
		value2 *= value2;
		
		return Math.sqrt(value1 + value2);
	}
	
	inline static public function calculateNextPosition(origin:Vector2, destination:Vector2, direction:Vector2, speed:Float, step:Float, output:Vector2)
	{
		var distance = destination.distance(origin);
		if (distance == 0)
		{
			return output;
		}
		
		var movementDistance = SimplePhysicsUtils.calculateMovementDistance(speed, step, distance);
		
		output.x = origin.x + direction.x * movementDistance;
		output.y = origin.y + direction.y * movementDistance;
		
		return output;
	}
	
	inline static public function calculateMovementDistance(speed:Float, step:Float, distance:Float):Float
	{
		var movementDistance = speed * step;
		
		if (movementDistance > distance)
			return distance;
		else
			return movementDistance;
	}
	
	inline static public function calculateMovementStep(movementDistance:Float, direction:Vector2, step:Vector2)
	{
		step.x = direction.x * movementDistance;
		step.y = direction.y * movementDistance;
		
		return step;
	}
	
	inline static public function calculateDirection(origin:Vector2, destination:Vector2, distance:Float, direction:Vector2)
	{
		direction.setTo((destination.x - origin.x) / distance, (destination.y - origin.y) / distance);
		
		return direction;
	}
}