package input;

import events.Observer;
import input.InputInteractionEvent;
import openfl.display.Stage;
import openfl.events.KeyboardEvent;

class KeyboardController extends Observer
{
	var stage:Stage;
	
	var userInputData:UserInputData;

	public function new(stage:Stage, userInputData:UserInputData) 
	{
		super();
		
		this.userInputData = userInputData;
		this.stage = stage;
		
		initialize();
	}
	
	public function isKeyDown(key:Int):Bool
	{
		return userInputData.isKeyDown(key);
	}
	
	function initialize() 
	{
		stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
		stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
	}
	
	private function onKeyUp(e:KeyboardEvent):Void 
	{
		userInputData.keysState.set(e.keyCode, false);
		dispatchEvent(new InputInteractionEvent(InputInteractionEvent.UP, e.keyCode));
	}
	
	private function onKeyDown(e:KeyboardEvent):Void 
	{
		userInputData.keysState.set(e.keyCode, true);
		dispatchEvent(new InputInteractionEvent(InputInteractionEvent.DOWN, e.keyCode));
	}
	
}