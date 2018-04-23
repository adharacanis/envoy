package events;

import haxe.Constraints.Function;

class Observer implements IObserver
{
	var describes:Map<String, Array<Function>> = new Map<String, Array<Function>>();
	var target:IObserver;
	
	public function new(target:IObserver) 
	{
		this.target = target;
	}
	
	public function hasEventListener(type:String)
	{
		return describes[type] != null;
	}

	public function addEventListener(type:String, callback:Function):Void
	{
		var callbackList:Array<Function> = describes[type];
		
		if (callbackList == null)
		{
			callbackList = new Array<Function>();
			describes[type] = callbackList;
		}
		
		callbackList.push(callback);
	}
	
	public function dispatchEvent(event:Event):Void
	{
		var callbackList:Array<Function> = describes[event.type];
		
		if (callbackList != null)
		{
			for (callback in callbackList)
			{
				callback(event);
			}
		}
	}
}