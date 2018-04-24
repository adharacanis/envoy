package theater.troupe.model;

class BaseActorModel 
{
	public var modelsList:Array<BaseActorModel>;
	public var modelsMap:Map<String, BaseActorModel>;
	
	public var target:BaseActorModel;
	
	public var state:Int = 0;
	
	public function new() 
	{
		modelsList = [];
		modelsMap = new Map();
	}
	
	public function addModel(model:BaseActorModel)
	{
		modelsList.push(model);
		modelsMap.set(Type.getClassName(Type.getClass(model)), model);
	}
	
	public function getModel<T:BaseActorModel>(clazz:Class<T>):Null<T>
	{
		var value = cast modelsMap.get(Type.getClassName(clazz));
		return value;
	}
}