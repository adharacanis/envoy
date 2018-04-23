package theater.scene;

import game.troupe.SimpleActorFactory;
import lime.math.Vector2;
import theater.troupe.model.BaseActorModel;

class ProjectileSceneController extends BaseSceneComponent
{
	var scene:BaseScene;

	public function new(scene:BaseScene) 
	{
		super();
		
		this.scene = scene;
	}
	
	public function spawnProjectile(owner:BaseActorModel, direction:Vector2)
	{
		var projectile = SimpleActorFactory.makeSimpleProjectile(owner, direction);
		scene.addActor(projectile);
	}
}