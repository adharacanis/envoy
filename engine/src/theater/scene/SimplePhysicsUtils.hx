package theater.scene;

import lime.math.Vector2;

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
	
	inline static public function inRadius(radius:Float, appliationPoint:TwoDimensionVector, interestPoint:TwoDimensionVector):Bool
	{
		return distance(appliationPoint, interestPoint) < radius;
	}
	
	inline static public function distance(point1:TwoDimensionVector, point2:TwoDimensionVector):Float
	{
		var pow1:Float = (point1.x - point2.x);
		pow1 *= pow1;
		
		var pow2:Float = (point1.y - point2.y);
		pow2 *= pow2;
		
		return Math.sqrt(pow1 + pow2);
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