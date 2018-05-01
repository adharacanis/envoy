package theater.troupe.actor;

import events.Observer;
import theater.events.SceneEvent;
import theater.troupe.actor.BaseActor;
import theater.troupe.actor.model.BaseActorModel;

class BaseActorComponent extends Observer
{
	public var actor:BaseActor;
	public var model:BaseActorModel;
	
	var worldStep:WorldStep;

	public function new(actor:BaseActor) 
	{
		super(actor);
		
		this.actor = actor;
		this.model = actor.model;
		
		worldStep = WorldTimeController.worldStep;
		
		initialize();
	}
	
	private function initialize()
	{
		actor.addEventListener(SceneEvent.ADDED_TO_SCENE, onAddedToScene);
	}
	
	private function onAddedToScene(e:SceneEvent):Void 
	{
		
	}
	
	public function update()
	{
		
	}
}