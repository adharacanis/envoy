package theater.troupe.actor.model;

class AttackModel extends BaseActorModel 
{
	public var lastAttackTime:Float = 0;
	public var attackCooldown:Float = 0;
	
	public var attackRange:Float = 350;

	public function new() 
	{
		super();
	}
	
}