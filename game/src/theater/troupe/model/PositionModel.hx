package theater.troupe.model;

class PositionModel extends BaseActorModel 
{
	public var x:Float = 0;
	public var y:Float = 0;
	
	public function new(x:Float = 0, y:Float = 0) 
	{
		super();
		
		this.x = x;
		this.y = y;
	}
	
}