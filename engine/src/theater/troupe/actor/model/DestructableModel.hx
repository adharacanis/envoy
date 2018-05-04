package theater.troupe.actor.model;

class DestructableModel extends BaseActorModel 
{
	public var currentHealth:Int = 0;
	public var maxHealth:Int = 0;

	public function new(currentHealth:Int = 1000, maxHealth:Int = 1000) 
	{
		super();
		
		this.maxHealth = maxHealth;
		this.currentHealth = currentHealth;
	}
}