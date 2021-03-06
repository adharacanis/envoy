package theater.troupe.actor;

import events.Event;
import events.Observer;
import theater.events.SceneEvent;
import theater.troupe.actor.model.BaseActorModel;

class BaseActor extends Observer
{
	private static var __id:Int = 0;
	
	public var model:BaseActorModel;
	public var componentsList:Array<BaseActorComponent>;
	public var componentsMap:Map<Int, BaseActorComponent>;
	
	var worlStep:WorldStep;
	
	public var type:Int = 0;
	public var id:Int = __id++;
	
	public function new(model:BaseActorModel) 
	{
		super();
		
		this.model = model;
		componentsList = [];
		componentsMap = new Map();
		worlStep = WorldTimeController.worldStep;
	}
	
	public function addComponentAs<T:BaseActorComponent>(type:Class<T>, component:BaseActorComponent)
	{
		componentsList.push(component);
		var typeValue = ClassRegistry.getClassId(type);
		componentsMap.set(typeValue, component);
		
		component.target = this;
	}
	
	public function addComponent(component:BaseActorComponent)
	{
		//if(component.model != null)
		//	model.addModel(component.model);
			
		componentsList.push(component);
		var typeValue = ClassRegistry.getClassId(Type.getClass(component));
		componentsMap.set(typeValue, component);
		
		component.target = this;
	}
	
	public function removeComponent(component:BaseActorComponent)
	{
		componentsList.remove(component);
		//componentsMap.remove(Type.getClassName(Type.getClass(component)));
		
		component.target = null;
	}
	
	public function getComponentAs<T:BaseActorComponent>(type:Class<T>, clazz:Class<T>):Null<T>
	{
		var value = cast componentsMap.get(ClassRegistry.getClassId(type));
		return value;
	}
	
	public function getComponent<T:BaseActorComponent>(type:Class<T>):Null<T>
	{
		var value = cast componentsMap.get(ClassRegistry.getClassId(type));
		return value;
	}
	
	public function update()
	{
		for (component in componentsList)
		{
			component.update();
		}
	}
}