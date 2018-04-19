package theater.troupe.model;

import lime.math.Vector2;

class PositionModel extends BaseActorModel 
{
	public var worldPositionMovementToX:Float = 0;
	public var worldPositionMovementToY:Float = 0;
	
	public var worldPositionX:Float = 0;
	public var worldPositionY:Float = 0;
	
	public var movementVector:Vector2 = new Vector2(0, 0);
	
	public var speed:Float = 225.0;
	
	public var x:Float = 0;
	public var y:Float = 0;
	
	public function new(x:Float = 0, y:Float = 0) 
	{
		super();
		
		this.x = x;
		this.y = y;
	}
	
}