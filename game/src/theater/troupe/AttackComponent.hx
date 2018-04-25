package theater.troupe;

import theater.events.ActorEvent;
import theater.troupe.model.AttackModel;

class AttackComponent extends BaseComponent 
{
	var attackModel:AttackModel;
	
	public function new(actor:BaseActor = null) 
	{
		super(actor);
		
		attackModel = model.getModel(AttackModel);
	}
	
	override public function update(worldStep:WorldStep) 
	{
		super.update(worldStep);
		
		if (model.target != null && checkCooldown(worldStep, attackModel))
		{
			attackModel.lastAttackTime = worldStep.currentTime;
			dispatchEvent(new ActorEvent(ActorEvent.ATTACK, cast target, model));
		}
	}
	
	function checkCooldown(worldStep:WorldStep, attackModel:AttackModel) 
	{
		return worldStep.currentTime > attackModel.lastAttackTime + attackModel.attackCooldown;
	}
}