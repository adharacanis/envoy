package theater.troupe.actor.model;

class LifeTimeModel extends BaseActorModel
{
	public var lifeTime:Float = 0;
	public var spawnTime:Float = 0;
	public var endTime:Float = 0;
	public var partOfComplete:Float = 0;
	public var isComplete:Bool = false;
	
	public function new() 
	{
		super();
	}
}