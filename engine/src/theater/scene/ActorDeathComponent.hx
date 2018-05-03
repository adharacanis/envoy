package theater.scene;
import openfl.events.TimerEvent;
import openfl.utils.Timer;
import theater.events.ActorEvent;
import theater.troupe.actor.DestructableComponent;

class ActorDeathComponent extends BaseSceneComponent 
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
		
		scene.dispatchEvent(new ActorEvent(ActorEvent.DESPAWN, e.actor, e.actorModel));
		
		var timer = new Timer(5000, 1);
		timer.addEventListener(TimerEvent.TIMER_COMPLETE, function(evnt:TimerEvent):Void {scene.dispatchEvent(new ActorEvent(ActorEvent.SPAWN, e.actor, e.actorModel)); } );
	}
}