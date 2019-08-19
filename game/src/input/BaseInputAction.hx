package input;

import haxe.Constraints.Function;

class BaseInputAction 
{
	public var actionID:Int;
	public var actionKey:Int;
	public var action:Function<Bool>;

	public function new() 
	{
		
	}

	public function execute(value:Bool)
	{
		action(value);
	}
}