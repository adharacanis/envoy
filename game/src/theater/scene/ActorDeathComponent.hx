package theater.scene;
import theater.events.ActorEvent;

class ActorDeathComponent extends BaseSceneComponent 
{
	var scene:BaseScene;
	
	public function new(scene:BaseScene) 
	{
		super();
		
		this.scene = scene;
		
		scene.addEventListener(ActorEvent.DEATH, onActorDeath);
	}
	
	private function onActorDeath(e:ActorEvent):Void 
	{
		
	}
}