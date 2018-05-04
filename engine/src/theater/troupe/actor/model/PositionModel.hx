package theater.troupe.actor.model;

import lime.math.Vector2;

class PositionModel extends BaseActorModel 
{
	public var destinetionPosition = new Vector2(0, 0);
	public var worldPosition = new Vector2(0, 0);
	public var direction:Vector2 = new Vector2(0, 0);
	
	public var speed:Float = 512.0;
	
	public var x:Float = 0;
	public var y:Float = 0;
	
	public function new(x:Float = 0, y:Float = 0) 
	{
		super();
		
		this.x = x;
		this.y = y;
	}
	
	public function setPosition(x:Float, y:Float)
	{
		destinetionPosition.setTo(x, y);
		worldPosition.setTo(x, y);
	}
	
}