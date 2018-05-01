package;

class WorldTimeController 
{
	private var lastTime = Date.now().getTime();
	
	public var currentTime = Date.now().getTime();
	public static var worldStep:WorldStep = new WorldStep();
	
	public static var now:Float = 0;
	
	public function new() 
	{
		if (lastTime == 0)
			lastTime = currentTime;
	}
	
	public function correctTime(time:Float)
	{
		currentTime = time;
		lastTime = currentTime;
	}
	
	public function updateTime()
	{
		var actualTime = Date.now().getTime();
		
		var dt = actualTime - lastTime;
		lastTime = actualTime;
		this.currentTime += dt;
		
		worldStep.currentTime = this.currentTime;
		worldStep.deltaTime = dt;
		worldStep.step = dt / 1000;
		
		now = currentTime;
	}
}