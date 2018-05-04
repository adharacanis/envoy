package theater.scene;

import lime.math.Vector2;
import theater.events.ActorEvent;
import theater.troupe.actor.BaseActor;
import theater.troupe.actor.SimpleActorFactory;
import theater.troupe.actor.model.PositionModel;

class ProjectileSceneComponent extends BaseSceneComponent
{
	var scene:BaseScene;
	var direction:Vector2 = new Vector2();

	public function new(scene:BaseScene) 
	{
		super();
		
		this.scene = scene;
		scene.addEventListener(ActorEvent.ATTACK, onAttack);
	}
	
	private function onAttack(e:ActorEvent):Void 
	{
		/**
		 * should not use target
		 * should use direction of "targeting" instead of target for most usual behavior
		 */
		var model = e.actor.model;
		
		var targetPositionModel = model.target.getModel(PositionModel);
		var projectilePositionModel = model.getModel(PositionModel);
		
		var destinetionPosition = targetPositionModel.worldPosition.clone();
		var startPosition = projectilePositionModel.worldPosition;
		//var direction2 = projectilePositionModel.direction;
		var distance = SimplePhysicsUtils.distance(destinetionPosition, startPosition);
		
		//var movementTime = distance / projectilePositionModel.speed;
		//SimplePhysicsUtils.calculateNextPosition(targetPositionModel.worldPosition, targetPositionModel.destinetionPosition, targetPositionModel.direction, targetPositionModel.speed, movementTime, destinetionPosition);
		//distance = destinetionPosition.distance(startPosition);
		
		//direction.setTo((destinetionPosition.x - startPosition.x) / distance, (destinetionPosition.y - startPosition.y) / distance);
		direction = new Vector2((destinetionPosition.x - startPosition.x) / distance, (destinetionPosition.y - startPosition.y) / distance);
		spawnProjectile(e.actor, direction);
	}
	
	public function spawnProjectile(owner:BaseActor, direction:Vector2)
	{
		var projectile = SimpleActorFactory.makeSimpleProjectile(owner, direction);
		scene.addActor(projectile);
	}
}