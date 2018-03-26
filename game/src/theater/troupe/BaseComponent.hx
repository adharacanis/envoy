package theater.troupe;
import theater.troupe.model.BaseActorModel;

class BaseComponent 
{
	public var model:BaseActorModel;

	public function new(model:BaseActorModel = null) 
	{
		this.model = model;
	}
	
	public function update()
	{
		
	}
}