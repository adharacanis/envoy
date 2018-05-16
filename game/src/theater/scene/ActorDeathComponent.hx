package theater.scene;

import openfl.events.TimerEvent;
import openfl.utils.Timer;
import theater.events.ActorEvent;
import theater.scene.BaseActorDeathComponent;
import theater.troupe.actor.DestructableComponent;
import theater.troupe.actor.model.DestructableModel;
import theater.troupe.actor.model.PositionModel;

class ActorDeathComponent extends BaseActorDeathComponent 
{
	public function new(scene:BaseScene) 
	{
		super(scene);
	}
	
	override function onActorDeath(e:ActorEvent):Void 
	{
		if (e.actor.getComponent(DestructableComponent) == null) return;
		
		trace('deadth actor ${e.actor.id}');
		
		scene.dispatchEvent(new ActorEvent(ActorEvent.DESPAWN, e.actor));
		
		var timer = new Timer(5000, 1);
		timer.start();
		timer.addEventListener(TimerEvent.TIMER_COMPLETE, function(evnt:TimerEvent):Void {
						var model = e.actor.model;
						
						model.deathState = 0;
						model.state = 0;
						model.getModel(PositionModel).setPosition( -3200 + Math.random() * 6400, -3200 + Math.random() * 6400);
						model.getModel(DestructableModel).currentHealth = model.getModel(DestructableModel).maxHealth;
						model.target = null;
						
						scene.dispatchEvent(new ActorEvent(ActorEvent.SPAWN, e.actor)); 
		} );
	}
}