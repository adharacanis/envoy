package theater.troupe;

import events.Event;
import events.Observer;
import theater.troupe.model.BaseActorModel;

class BaseActor extends Observer
{
	public var model:BaseActorModel;
	public var componentsList:Array<BaseComponent>;
	public var componentsMap:Map<String, BaseComponent>;
	
	public function new(model:BaseActorModel) 
	{
		super();
		
		this.model = model;
		componentsList = [];
		componentsMap = new Map();
	}
	
	public function addComponent(component:BaseComponent)
	{
		//if(component.model != null)
		//	model.addModel(component.model);
			
		componentsList.push(component);
		componentsMap.set(Type.getClassName(Type.getClass(component)), component);
	}
	
	public function getComponent<T:BaseComponent>(clazz:Class<T>):Null<T>
	{
		var value = cast componentsMap.get(Type.getClassName(clazz));
		return value;
	}
	
	override public function dispatchEvent(event:Event):Void 
	{
		super.dispatchEvent(event);
		
		for (actorComponent in componentsList)
		{
			actorComponent.dispatchEvent(event);
		}
	}
	
	public function update(worldStep:WorldStep)
	{
		for (component in componentsList)
		{
			component.update(worldStep);
		}
	}
}