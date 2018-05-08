package input;

import events.Event;

class InputInteractionEvent extends Event 
{
	public static inline var UP:String = "onUp";
	public static inline var DOWN:String = "onDown";
	
	public var keyCode:Int;
	
	public function new(type:String, keyCode:Int) 
	{
		super(type);
		
		this.keyCode = keyCode;
	}
}