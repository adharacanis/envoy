package theater.scene;

import theater.troupe.BaseActor;

class BaseScene 
{
	public var actorsList:Array<BaseActor>;
	
	var componentsList:Array<BaseSceneComponent>;
	
	public function new() 
	{
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