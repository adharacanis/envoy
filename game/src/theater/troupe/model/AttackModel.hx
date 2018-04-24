package theater.troupe.model;

class AttackModel extends BaseActorModel 
{
	public var lastAttackTime:Float = 0;
	public var attackCooldown:Float = 1500;

	public function new() 
	{
		super();
	}
	
}