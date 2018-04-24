package theater.troupe;

import theater.events.ActorEvent;
import theater.troupe.model.AttackModel;
import theater.troupe.model.BaseActorModel;

class AttackComponent extends BaseComponent 
{
	var attackModel:AttackModel;
	
	public function new(model:BaseActorModel = null) 
	{
		super(model);
		
		attackModel = model.getModel(AttackModel);
	}
	
	override public function update(worldStep:WorldStep) 
	{
		super.update(worldStep);
		
		if (model.target != null && checkCooldown(worldStep, attackModel))
		{
			attackModel.lastAttackTime = worldStep.currentTime;
			dispatchEvent(new ActorEvent(ActorEvent.ATTACK, model));
		}
	}
	
	function checkCooldown(worldStep:WorldStep, attackModel:AttackModel) 
	{
		return worldStep.currentTime > attackModel.lastAttackTime + attackModel.attackCooldown;
	}
}