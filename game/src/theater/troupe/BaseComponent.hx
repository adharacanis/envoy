package theater.troupe;

import events.Observer;
import theater.events.SceneEvent;
import theater.troupe.model.BaseActorModel;

class BaseComponent extends Observer
{
	public var model:BaseActorModel;

	public function new(model:BaseActorModel = null) 
	{
		super();
		
		this.model = model;
		
		initialize();
	}
	
	private function initialize()
	{
		addEventListener(SceneEvent.ADDED_TO_SCENE, onAddedToScene);
	}
	
	private function onAddedToScene(e:SceneEvent):Void 
	{
		
	}
	
	public function update(worldStep:WorldStep)
	{
		
	}
}