package theater.troupe.actor;

import lime.math.Vector2;
import theater.scene.SimplePhysicsUtils;
import theater.troupe.actor.model.AttackModel;
import theater.troupe.actor.model.PositionModel;

class SimpleHunterComponent extends BaseActorComponent
{
	var attackModel:AttackModel;
	var positionModel:PositionModel;

	public function new(actor:BaseActor) 
	{
		super(actor);
		
		attackModel = model.getModel(AttackModel);
		positionModel = model.getModel(PositionModel);
	}
	
	var rr:Float = Math.PI / (180 + 360 * Math.random());
	var ii:Float = 0;
	
	override public function update() 
	{
		super.update();
		
		var target = model.target;
		
		if (target == null) return;
		
		var targetPositionModel = target.getModel(PositionModel);
		
		var range = attackModel.attackRange;
		var direction:Vector2 = positionModel.direction;
		var currentPosition:Vector2 = positionModel.worldPosition;
		var targetPosition:Vector2 = targetPositionModel.worldPosition;
		var distance = SimplePhysicsUtils.distance(currentPosition, targetPosition); 
		
		SimplePhysicsUtils.calculateDirection(currentPosition, targetPosition, distance, direction);
		
		var r = rr;
		if (distance > range + 15)
		{
			r = rr + Math.cos(ii) / 10;
			
		}
		ii += 0.05;
		
		//if (distance > range) 
		{
			SimplePhysicsUtils.calculateMovementStep(range-15, direction, positionModel.destinetionPosition);
			
			
			
			var x = positionModel.destinetionPosition.x;
			var y = positionModel.destinetionPosition.y;
			positionModel.destinetionPosition.x = Math.cos(r) * x - Math.sin(r) * y;
			positionModel.destinetionPosition.y = Math.cos(r) * y + Math.sin(r) * x;
			
			
			
			positionModel.destinetionPosition.x = targetPosition.x - positionModel.destinetionPosition.x;
			positionModel.destinetionPosition.y = targetPosition.y - positionModel.destinetionPosition.y;
			
			
		}
	}
}