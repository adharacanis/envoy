package theater.troupe.actor.model;

class DestructableModel extends BaseActorModel 
{
	public var currentHealth:Int = 0;
	public var maxHealth:Int = 0;

	public function new(currentHealth:Int = 0, maxHealth:Int = 0) 
	{
		super();
		
		this.maxHealth = maxHealth;
		this.currentHealth = currentHealth;
	}
}