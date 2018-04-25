package src;
import openfl.display.Stage;
import openfl.events.KeyboardEvent;

class KeyboardController
{

	public function new(stage:Stage) 
	{
		stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
		stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyUp);
	}
	
	private function onKeyDown(e:KeyboardEvent):Void 
	{
		
	}
	
	private function onKeyUp(e:KeyboardEvent):Void 
	{
		
	}
	
}