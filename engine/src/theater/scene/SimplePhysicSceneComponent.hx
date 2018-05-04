package theater.scene;

import openfl.geom.Rectangle;
import theater.events.ActorEvent;
import theater.troupe.actor.BaseActor;
import theater.troupe.actor.BaseViewComponent;
import theater.troupe.actor.model.PositionModel;
import theater.scene.SimplePhysicsUtils;

using lime.math.Vector2;

class SimplePhysicSceneComponent extends BaseSceneComponent
{
	var movementStep:Vector2 = new Vector2();
	var collisionList:Array<BaseActor> = [];
	var actorsList:Array<BaseActor>;
	
	var currentIndex = 0;
	
	public function new(actorsList:Array<BaseActor>) 
	{
		super();
		
		this.actorsList = actorsList;
	}
	
	override public function update(actor:BaseActor)
	{
		for (i in currentIndex...actorsList.length)
		{
			checkColission(actorsList[i], actor);
		}
		
		var model:PositionModel = actor.model.getModel(PositionModel);
		
		var speed = model.speed;
		var step = worldStep.step;
		
		var origin = model.worldPosition;
		var destination = model.destinetionPosition;
		var direction = model.direction;
		
		var distance = destination.distance(origin);
		if (distance == 0)
		{
			actor.model.state = 0;
			return;
		}
			
		actor.model.state = 1; 
		
		direction = SimplePhysicsUtils.calculateDirection(origin, destination, distance, direction);
		
		var movementDistance = SimplePhysicsUtils.calculateMovementDistance(speed, step, distance);
		movementStep = SimplePhysicsUtils.calculateMovementStep(movementDistance, direction, movementStep);
		
		origin.x += movementStep.x;
		origin.y += movementStep.y;
	}
	
	var a:Rectangle = new Rectangle();
	var b:Rectangle = new Rectangle();
	function checkColission(actorA:BaseActor, actorB:BaseActor) 
	{
		if (actorA == actorB) return;
		if (actorA.type == 3 || actorB.type == 3) return;
		if (actorA.id == actorB.id) return;
		if (actorA.type == 2 && actorB.type == 1) return;
		if (actorA.type == 1 && actorB.type == 2) return;
		if (actorA.type == 2 && actorB.type == 2) return;
			
		var viewComponentA = actorA.getComponent(BaseViewComponent);
		var viewComponentB = actorB.getComponent(BaseViewComponent);
		
		var positionModelA = actorA.model.getModel(PositionModel);
		var positionModelB = actorB.model.getModel(PositionModel);
		
		var halfSize = 13 * viewComponentA.view.scaleX;
		var size = 26 * viewComponentA.view.scaleX;
		
		a.setTo(positionModelA.worldPosition.x - halfSize, positionModelA.worldPosition.y - halfSize, size, size);
		b.setTo(positionModelB.worldPosition.x - halfSize, positionModelB.worldPosition.y - halfSize, size, size);
		
		if (a.intersects(b))
		{
			actorA.dispatchEvent(new ActorEvent(ActorEvent.COLLIDE, actorA, actorA.model));
			actorB.dispatchEvent(new ActorEvent(ActorEvent.COLLIDE, actorB, actorB.model));
		}
	}
}