package theater.scene;

import theater.events.ActorEvent;
import theater.troupe.actor.BaseActor;
import theater.troupe.actor.SimpleActorFactory;

class EffectSceneComponent extends BaseSceneComponent
{
	var scene:BaseScene;

	public function new(scene:BaseScene) 
	{
		super();
		
		this.scene = scene;
		
		initialize();
	}
	
	function initialize() 
	{
		scene.addEventListener(ActorEvent.PROJECTILE_APPLY_DAMAGE, spawnProjectileEffect);
	}
	
	private function spawnProjectileEffect(e:ActorEvent):Void 
	{
		var effect = SimpleActorFactory.makeEffect(e.actor);
		scene.addActor(effect);
	}
}