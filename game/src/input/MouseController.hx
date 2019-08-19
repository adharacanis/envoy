package input;

import events.Observer;
import openfl.display.Stage;
import openfl.events.MouseEvent;
import openfl.ui.Keyboard;

@:access(input)
class MouseController extends Observer 
{
	var stage:Stage;
	
	var keysState:Map<Int, Bool> = new Map();
	var userInputData:UserInputData;

	public function new(stage:Stage, userInputData:UserInputData)
	{
		super();
		
		this.userInputData = userInputData;
		this.stage = stage;	
		
		stage.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
		stage.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
		
		stage.addEventListener(MouseEvent.RIGHT_MOUSE_DOWN, onMouseDown);
		stage.addEventListener(MouseEvent.RIGHT_MOUSE_UP, onMouseUp);
	}
	
	private function getKeyCode(type:String):Int
	{
		return switch(type)
		{
			case MouseEvent.MOUSE_DOWN | MouseEvent.MOUSE_UP: 30;
			case MouseEvent.RIGHT_MOUSE_DOWN | MouseEvent.RIGHT_MOUSE_UP: 31;
			case _: 0;
		}
		
	}
	
	private function onMouseUp(e:MouseEvent):Void 
	{
		var key = getKeyCode(e.type);
		userInputData.keysState.set(key, false);
		dispatchEvent(new InputInteractionEvent(InputInteractionEvent.UP, key));
	}
	
	private function onMouseDown(e:MouseEvent):Void 
	{
		var key = getKeyCode(e.type);
		userInputData.keysState.set(key, true);
		dispatchEvent(new InputInteractionEvent(InputInteractionEvent.DOWN, key));
	}
	
}