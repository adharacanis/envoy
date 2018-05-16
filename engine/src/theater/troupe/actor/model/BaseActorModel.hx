package theater.troupe.actor.model;

class BaseActorModel 
{
	public var modelsList:Array<BaseActorModel>;
	public var modelsMap:Map<Int, BaseActorModel>;
	
	public var target:BaseActorModel;
	
	public var state:Int = 0;
	public var deathState:Int = 0;
	
	public function new() 
	{
		modelsList = [];
		modelsMap = new Map();
	}
	
	public function addModel(model:BaseActorModel)
	{
		modelsList.push(model);
		var typeValue = ClassRegistry.getClassId(Type.getClass(model));
		modelsMap.set(typeValue, model);
	}
	
	public function getModel<T:BaseActorModel>(clazz:Class<T>):T
	{
		var value = cast modelsMap.get(ClassRegistry.getClassId(clazz));
		return value;
	}
}