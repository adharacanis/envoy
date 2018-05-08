package input;
import lime.math.Vector2;

class UserInputData 
{
	public var isMouseDown(get, never):Bool;
	public var mousePosition:Vector2 = new Vector2();
	
	public var keysState:Map<Int, Bool> = new Map();
	
	public function new() 
	{
		
	}
	
	public function get_isMouseDown():Bool
	{
		return keysState.get(30) == true;
	}
	
	public function isRightMouseDown():Bool
	{
		return keysState.get(31) == true;
	}
	
	public function isKeyDown(key:Int):Bool
	{
		return keysState.get(key) == true;
	}
}