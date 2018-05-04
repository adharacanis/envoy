package theater.troupe.actor;

import theater.events.ActorEvent;
import theater.scene.SimplePhysicsUtils;
import theater.troupe.actor.model.AttackModel;
import theater.troupe.actor.model.PositionModel;

class AttackComponent extends BaseActorComponent 
{
	var attackModel:AttackModel;
	
	public function new(actor:BaseActor = null) 
	{
		super(actor);
		
		attackModel = model.getModel(AttackModel);
	}
	
	override public function update() 
	{
		super.update();
		
		var target = model.target;
		if (target != null && checkCooldown(attackModel) && model.target.deathState == 0 && SimplePhysicsUtils.distance(target.getModel(PositionModel).worldPosition, model.getModel(PositionModel).worldPosition) <= attackModel.attackRange)
		{
			attackModel.lastAttackTime = worldStep.currentTime;
			dispatchEvent(new ActorEvent(ActorEvent.ATTACK, actor));
		}
	}
	
	function checkCooldown(attackModel:AttackModel) 
	{
		return worldStep.currentTime > attackModel.lastAttackTime + attackModel.attackCooldown;
	}
}