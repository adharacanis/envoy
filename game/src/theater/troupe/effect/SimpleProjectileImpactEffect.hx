package theater.troupe.effect;

import swfdata.DisplayObjectData;
import theater.events.ActorEvent;
import theater.troupe.actor.BaseActor;
import theater.troupe.effect.BaseEffectViewComponent;

class SimpleProjectileImpactEffect extends BaseEffectViewComponent
{
	var endScale:Float = 2;
	var endAlpha = 0;
	
	public function new(actor:BaseActor, view:DisplayObjectData) 
	{
		super(actor, view);
	}
	
	@:access(swfdata)
	override public function update() 
	{
		super.update();
		view.rotation += 20 / (1 + 10 * lifeTimeModel.partOfComplete);
		view.scaleX = view.scaleY = 0.5 + lifeTimeModel.partOfComplete * endScale;
		//view.alpha = 1 - (1 - endAlpha) * lifeTimeModel.partOfComplete;
		//view.colorData.alphaAdd = a;
		view.alpha = 1 - (1 - endAlpha) * lifeTimeModel.partOfComplete;
		
		if (lifeTimeModel.isComplete)
			dispatchEvent(new ActorEvent(ActorEvent.DESPAWN, actor));
	}
}