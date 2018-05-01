package theater.troupe.effect;

import swfdata.DisplayObjectData;
import theater.events.SceneEvent;
import theater.troupe.actor.BaseActor;
import theater.troupe.actor.BaseViewComponent;
import theater.troupe.actor.model.LifeTimeModel;

class BaseEffectViewComponent extends BaseViewComponent
{	
	var lifeTimeModel:LifeTimeModel;
	
	public function new(actor:BaseActor, view:DisplayObjectData) 
	{
		super(actor, view);
		
		lifeTimeModel = model.getModel(LifeTimeModel);
	}
	
	override function onAddedToScene(e:SceneEvent):Void 
	{
		super.onAddedToScene(e);
	}
	
	override function update()
	{
		if (lifeTimeModel.isComplete)
			return;
	}
}