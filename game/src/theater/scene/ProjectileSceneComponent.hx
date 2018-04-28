package theater.scene;

import game.troupe.SimpleActorFactory;
import lime.math.Vector2;
import theater.events.ActorEvent;
import theater.scene.SimplePhysicsUtils;
import theater.troupe.model.AttackModel;
import theater.troupe.model.BaseActorModel;
import theater.troupe.model.PositionModel;

using lime.math.Vector2;

class ProjectileSceneComponent extends BaseSceneComponent
{
	var scene:BaseScene;

	public function new(scene:BaseScene) 
	{
		super();
		
		this.scene = scene;
		scene.addEventListener(ActorEvent.ATTACK, onAttack);
	}
	
	private function onAttack(e:ActorEvent):Void 
	{
		var targetPositionModel = e.actorModel.target.getModel(PositionModel);
		
		var projectilePositionModel = e.actorModel.getModel(PositionModel);
		
		var destinetionPosition = targetPositionModel.worldPosition.clone();
		var startPosition = projectilePositionModel.worldPosition;
		var direction2 = projectilePositionModel.direction;
		var distance = destinetionPosition.distance(startPosition);
		
		var movementTime = distance / projectilePositionModel.speed;
		SimplePhysicsUtils.calculateNextPosition(targetPositionModel.worldPosition, targetPositionModel.destinetionPosition, targetPositionModel.direction, targetPositionModel.speed, movementTime, destinetionPosition);
		distance = destinetionPosition.distance(startPosition);
		
		var direction = new Vector2((destinetionPosition.x - startPosition.x) / distance, (destinetionPosition.y - startPosition.y) / distance);
		spawnProjectile(e.actorModel, direction);
	}
	
	public function spawnProjectile(owner:BaseActorModel, direction:Vector2)
	{
		var projectile = SimpleActorFactory.makeSimpleProjectile(owner, direction);
		scene.addActor(projectile);
	}
}