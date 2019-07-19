package theater.scene;

import lime.math.Vector2;
import openfl.geom.Rectangle;
import theater.events.ActorEvent;
import theater.scene.SimplePhysicsUtils;
import theater.troupe.actor.BaseActor;
import theater.troupe.actor.BaseViewComponent;
import theater.troupe.actor.model.PositionModel;

class SimplePhysicSceneComponent extends BaseItirableSceneComponent
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
		
		var distance = SimplePhysicsUtils.distance(destination, origin);
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
		var positionModelA = actorA.model.getModel(PositionModel);
		var positionModelB = actorB.model.getModel(PositionModel);

		if (SimplePhysicsUtils.filter(positionModelA, positionModelB)) return;
			
		var viewComponentA = actorA.getComponent(BaseViewComponent);
		var viewComponentB = actorB.getComponent(BaseViewComponent);
		
		var halfSize = 13 * viewComponentA.view.scaleX;
		var size = 26 * viewComponentA.view.scaleX;
		
		a.setTo(positionModelA.worldPosition.x - halfSize, positionModelA.worldPosition.y - halfSize, size, size);
		b.setTo(positionModelB.worldPosition.x - halfSize, positionModelB.worldPosition.y - halfSize, size, size);
		
		if (a.intersects(b))
		{
			actorA.dispatchEvent(new ActorEvent(ActorEvent.COLLIDE, actorA));
			actorB.dispatchEvent(new ActorEvent(ActorEvent.COLLIDE, actorB));
		}
	}
}