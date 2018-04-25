package src.game;

import openfl.display.Stage;
import game.MouseController;

class UserInputController
{

	public function new(stage:Stage) 
	{
		var mouseController = new MouseController(stage);
	}
	
}