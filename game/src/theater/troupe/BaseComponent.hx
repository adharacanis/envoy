package theater.troupe;

import events.Observer;
import theater.events.SceneEvent;
import theater.troupe.model.BaseActorModel;

class BaseComponent extends Observer
{
	public var actor:BaseActor;
	public var model:BaseActorModel;

	public function new(actor:BaseActor) 
	{
		super(actor);
		
		this.actor = actor;
		this.model = actor.model;
		
		initialize();
	}
	
	private function initialize()
	{
		actor.addEventListener(SceneEvent.ADDED_TO_SCENE, onAddedToScene);
	}
	
	private function onAddedToScene(e:SceneEvent):Void 
	{
		
	}
	
	public function update(worldStep:WorldStep)
	{
		
	}
}