package theater.troupe.model;

class BaseActorModel 
{
	public var subModels:Array<BaseActorModel>;
	
	public function new() 
	{
		subModels = [];
	}
	
	public function addSubModel(model:BaseActorModel)
	{
		subModels.push(model);
	}
	
}