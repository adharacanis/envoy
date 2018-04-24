package theater.scene;

import events.IObserver;
import events.Observer;
import theater.events.SceneEvent;
import theater.troupe.BaseActor;

class BaseScene extends Observer
{
	public var actorsList:Array<BaseActor>;
	
	var componentsList:Array<BaseSceneComponent>;
	
	public function new(target:IObserver = null) 
	{
		super(target);
		
		actorsList = [];
		componentsList = [];
	}
	
	public function addComponent(sceneComponent:BaseSceneComponent)
	{
		componentsList.push(sceneComponent);
	}
	
	public function addActor(actor:BaseActor)
	{
		actorsList.push(actor);
		actor.dispatchEvent(new SceneEvent(SceneEvent.ADDED_TO_SCENE));
		actor.target = this;
	}
	
	public function update(worldStep:WorldStep)
	{
		for (actor in actorsList)
		{
			for (sceneComponent in componentsList)
				sceneComponent.update(worldStep, actor);
				
			actor.update(worldStep);
		}
	}
	
}