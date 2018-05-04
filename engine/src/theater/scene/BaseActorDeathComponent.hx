package theater.scene;

import theater.events.ActorEvent;
import theater.troupe.actor.DestructableComponent;

class BaseActorDeathComponent extends BaseSceneComponent 
{
	var scene:BaseScene;
	
	
	public function new(scene:BaseScene) 
	{
		super();
		
		this.scene = scene;
		
		scene.addEventListener(ActorEvent.DEATH, onActorDeath);
	}
	
	private function onActorDeath(e:ActorEvent):Void 
	{
		if (e.actor.getComponent(DestructableComponent) == null) return;
		scene.dispatchEvent(new ActorEvent(ActorEvent.DESPAWN, e.actor));
	}
}