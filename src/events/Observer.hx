package events;

import haxe.Constraints.Function;

class Observer implements IObserver
{
	public var target:IObserver;
	
	var describes:Map<String, Array<Function>> = new Map<String, Array<Function>>();
	
	public function new(target:IObserver = null) 
	{
		this.target = target;
	}
	
	public function hasEventListener(type:String)
	{
		return describes[type] != null;
	}

	public function addEventListener(type:String, callback:Function)
	{
		var callbackList:Array<Function> = describes[type];
		
		if (callbackList == null)
		{
			callbackList = new Array<Function>();
			describes[type] = callbackList;
		}
		
		callbackList.push(callback);
	}
	
	public function dispatchEvent(event:Event)
	{
		var taget = this;
		
		var callbackList:Array<Function> = taget.describes[event.type];
		
		if (callbackList != null)
		{
			for (callback in callbackList)
			{
				callback(event);
			}
		}
		
		var target = taget.target;
		
		if (target != null)
			target.dispatchEvent(event);
	}
}