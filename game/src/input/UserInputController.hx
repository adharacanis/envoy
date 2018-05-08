package input;

import events.Observer;
import input.BaseInputAction;
import input.InputInteractionEvent;
import input.InputState;
import input.KeyboardController;
import input.MouseController;
import input.UserInputEvent;
import openfl.display.Stage;

class UserInputController extends Observer
{
	public var userInputData:UserInputData = new UserInputData();
	
	var actions:Map<Int, BaseInputAction> = new Map();
	
	var mouseController:MouseController;
	var keyboardController:input.KeyboardController;
	
	public function new(stage:Stage) 
	{
		super();
		
		mouseController = new MouseController(stage, userInputData);
		keyboardController = new KeyboardController(stage, userInputData);
		
		mouseController.addEventListener(InputInteractionEvent.UP, onInteractionOut);
		mouseController.addEventListener(InputInteractionEvent.DOWN, onInteractionIn);
		
		keyboardController.addEventListener(InputInteractionEvent.UP, onInteractionOut);
		keyboardController.addEventListener(InputInteractionEvent.DOWN, onInteractionIn);
	}
	
	private function onInteractionIn(e:InputInteractionEvent):Void 
	{
		var keyCode = e.keyCode;
		
		if (actions.exists(keyCode)) return;
		
		var action = actions.get(keyCode);
		dispatchEvent(new UserInputEvent(UserInputEvent.INPUT, action.actionID, InputState.UP));
	}
	
	private function onInteractionOut(e:InputInteractionEvent):Void 
	{
		var keyCode = e.keyCode;
		
		if (actions.exists(keyCode)) return;
		
		var action = actions.get(keyCode);
		dispatchEvent(new UserInputEvent(UserInputEvent.INPUT, action.actionID, InputState.DOWN));
	}
	
	public function registerAction(action:BaseInputAction)
	{
		actions.set(action.actionKey, action);
	}
	
	public function unregisterAction(action:BaseInputAction)
	{
		actions.remove(action.actionKey);
	}
}