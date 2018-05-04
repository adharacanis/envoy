package theater.troupe.actor;

import lime.math.Vector2;
import theater.scene.SimplePhysicsUtils;
import theater.troupe.actor.model.AttackModel;
import theater.troupe.actor.model.PositionModel;

class SimpleHunterComponent extends BaseActorComponent
{
	var attackModel:AttackModel;
	var positionModel:PositionModel;
	
	var anchorn:Vector2;

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
		
		var currentPosition:Vector2 = positionModel.worldPosition;
		
		if (target == null) 
		{
			if (anchorn == null)
				anchorn = currentPosition.clone();
				
			if (actor.model.state == 0) 
			{
				positionModel.destinetionPosition.setTo(anchorn.x + Math.random() * 150, anchorn.y + Math.random() * 150);
			}
		}
		else
		{
			var targetPositionModel = target.getModel(PositionModel);
			
			var range = attackModel.attackRange;
			var direction:Vector2 = positionModel.direction;
			var targetPosition:Vector2 = targetPositionModel.worldPosition;
			var distance = SimplePhysicsUtils.distance(currentPosition, targetPosition); 
			
			SimplePhysicsUtils.calculateDirection(currentPosition, targetPosition, distance, direction);
			
			var r = rr;
			if (distance > range + 15)
			{
				//r = rr + Math.cos(ii) / 10;
				
			}
			ii += 0.05;
			
			//if (distance > range) 
			{
				SimplePhysicsUtils.calculateMovementStep(range, direction, positionModel.destinetionPosition);
				
				
				
				var x = positionModel.destinetionPosition.x;
				var y = positionModel.destinetionPosition.y;
				
				positionModel.destinetionPosition.setTo(Math.cos(r) * x - Math.sin(r) * y, Math.cos(r) * y + Math.sin(r) * x);
				//positionModel.destinetionPosition.setTo(x, y);
				
				
				
				positionModel.destinetionPosition.x = targetPosition.x - positionModel.destinetionPosition.x;
				positionModel.destinetionPosition.y = targetPosition.y - positionModel.destinetionPosition.y;
			}
		}
	}
}