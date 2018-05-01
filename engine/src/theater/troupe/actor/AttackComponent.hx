package theater.troupe.actor;

import theater.events.ActorEvent;
import theater.troupe.actor.model.AttackModel;

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
		
		if (model.target != null && checkCooldown(attackModel))
		{
			attackModel.lastAttackTime = worldStep.currentTime;
			dispatchEvent(new ActorEvent(ActorEvent.ATTACK, cast target, model));
		}
	}
	
	function checkCooldown(attackModel:AttackModel) 
	{
		return worldStep.currentTime > attackModel.lastAttackTime + attackModel.attackCooldown;
	}
}