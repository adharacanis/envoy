package theater.scene;

import theater.troupe.BaseActor;

class BaseScene 
{
	public var actorsList:Array<BaseActor>;
	
	public function new() 
	{
		actorsList = [];
	}
	
	public function addActor(actor:BaseActor)
	{
		actorsList.push(actor);
	}
	
	public function update()
	{
		for (actor in actorsList)
		{
			actor.update();
		}
	}
	
}