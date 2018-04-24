package events;

import events.Event;
import haxe.Constraints.Function;

interface IObserver 
{
	function addEventListener(type:String, callback:Function):Void;
	function hasEventListener(type:String):Bool;
	function dispatchEvent(event:Event):Void;
	
	var target:IObserver;
}