package theater.troupe;

import events.Event;
import events.Observer;
import theater.events.SceneEvent;
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
	
	public function addComponentAs<T:BaseComponent>(type:Class<T>, component:BaseComponent)
	{
		componentsList.push(component);
		var typeValue = Type.getClassName(type);
		componentsMap.set(typeValue, component);
		
		component.target = this;
	}
	
	public function addComponent(component:BaseComponent)
	{
		//if(component.model != null)
		//	model.addModel(component.model);
			
		componentsList.push(component);
		componentsMap.set(Type.getClassName(Type.getClass(component)), component);
		
		component.target = this;
	}
	
	public function removeComponent(component:BaseComponent)
	{
		componentsList.remove(component);
		componentsMap.remove(Type.getClassName(Type.getClass(component)));
		
		component.target = null;
	}
	
	public function getComponentAs<T:BaseComponent>(type:String, clazz:Class<T>):Null<T>
	{
		var value = cast componentsMap.get(type);
		return value;
	}
	
	public function getComponent<T:BaseComponent>(clazz:Class<T>):Null<T>
	{
		var value = cast componentsMap.get(Type.getClassName(clazz));
		return value;
	}
	
	override public function dispatchEvent(event:Event):Void 
	{
		super.dispatchEvent(event);
		
		if (event.type == SceneEvent.ADDED_TO_SCENE)
		{
			for (actorComponent in componentsList)
				actorComponent.onAddedToScene();
		}
		
		//for (actorComponent in componentsList)
		//{
		//	actorComponent.dispatchEvent(event);
		//}
	}
	
	public function update(worldStep:WorldStep)
	{
		for (component in componentsList)
		{
			component.update(worldStep);
		}
	}
}