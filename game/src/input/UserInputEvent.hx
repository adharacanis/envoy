package input;

import events.Event;

class UserInputEvent extends Event 
{
	public static inline var INPUT:String = "onInput";
	
	public var inputAction:Int;
	public var inputState:InputState;
	
	public function new(type:String, inputAction:Int, inputState:InputState) 
	{
		super(type);
		
		this.inputState = inputState;
		this.inputAction = inputAction;
	}
}