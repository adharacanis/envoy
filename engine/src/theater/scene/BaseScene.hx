package theater.scene;

import events.IObserver;
import events.Observer;
import theater.events.SceneEvent;
import theater.troupe.actor.BaseActor;

class BaseScene extends Observer
{
	public var actorsList:Array<BaseActor>;
	
	var componentsList:Array<BaseSceneComponent>;
	var itirableComponentsList:Array<IItirableSceneComponent>;
	
	public function new(target:IObserver = null) 
	{
		super(target);
		
		actorsList = [];
		componentsList = [];
		itirableComponentsList = [];
	}
	
	public function addComponent(sceneComponent:BaseSceneComponent)
	{
		if (Std.is(sceneComponent, IItirableSceneComponent))
			itirableComponentsList.push(cast sceneComponent);
		else
			componentsList.push(sceneComponent);
	}
	
	public function addActor(actor:BaseActor)
	{
		actorsList.push(actor);
		actor.dispatchEvent(new SceneEvent(SceneEvent.ADDED_TO_SCENE));
		actor.target = this;
	}
	
	public function removeActor(actor:BaseActor)
	{
		actorsList.remove(actor);
		actor.target = null;
	}
	
	public function update()
	{
		for (actor in actorsList)
		{
			for (sceneComponent in itirableComponentsList)
				sceneComponent.update(actor);
				
			actor.update();
		}
	}
	
}