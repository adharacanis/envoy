package theater.events;

import events.Event;

class SceneEvent extends Event 
{
	static public inline var ADDED_TO_SCENE:String = "onAddedToScene";
	
	public function new(type:String) 
	{
		super(type);
	}
	
}