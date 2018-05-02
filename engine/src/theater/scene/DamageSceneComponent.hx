package theater.scene;
import lime.math.Vector2;
import theater.troupe.actor.BaseActor;
import theater.troupe.actor.model.PositionModel;

class DamageSceneComponent extends BaseSceneComponent 
{
	var actorsList:Array<BaseActor>;

	public function new(actorsList:Array<BaseActor>) 
	{
		super();
		this.actorsList = actorsList;
	}
	
	public function applyDamageInRadius(radius:Float, applicationPoint:Vector2)
	{
		var objectsInRaius:Array<BaseActor> = [];
		
		for (actor in actorsList)
		{
			if (SimplePhysicsUtils.inRadius(radius, applicationPoint, actor.model.getModel(PositionModel).worldPosition))
			{
				applyDamage(actor);
			}
		}
	}
	
	inline public function applyDamage(actor:BaseActor) 
	{
		
	}
}