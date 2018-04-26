package theater.troupe;

import events.Event;
import events.Observer;
import theater.events.SceneEvent;
import theater.troupe.model.BaseActorModel;

class BaseActor extends Observer
{
	public var model:BaseActorModel;
	public var componentsList:Array<BaseActorComponent>;
	public var componentsMap:Map<String, BaseActorComponent>;
	
	public function new(model:BaseActorModel) 
	{
		super();
		
		this.model = model;
		componentsList = [];
		componentsMap = new Map();
	}
	
	public function addComponentAs<T:BaseActorComponent>(type:Class<T>, component:BaseActorComponent)
	{
		componentsList.push(component);
		var typeValue = Type.getClassName(type);
		componentsMap.set(typeValue, component);
		
		component.target = this;
	}
	
	public function addComponent(component:BaseActorComponent)
	{
		//if(component.model != null)
		//	model.addModel(component.model);
			
		componentsList.push(component);
		componentsMap.set(Type.getClassName(Type.getClass(component)), component);
		
		component.target = this;
	}
	
	public function removeComponent(component:BaseActorComponent)
	{
		componentsList.remove(component);
		componentsMap.remove(Type.getClassName(Type.getClass(component)));
		
		component.target = null;
	}
	
	public function getComponentAs<T:BaseActorComponent>(type:String, clazz:Class<T>):Null<T>
	{
		var value = cast componentsMap.get(type);
		return value;
	}
	
	public function getComponent<T:BaseActorComponent>(clazz:Class<T>):Null<T>
	{
		var value = cast componentsMap.get(Type.getClassName(clazz));
		return value;
	}
	
	public function update(worldStep:WorldStep)
	{
		for (component in componentsList)
		{
			component.update(worldStep);
		}
	}
}