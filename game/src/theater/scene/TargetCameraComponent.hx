package theater.scene;
import theater.troupe.BaseActor;
import theater.troupe.BaseViewComponent;
import theater.troupe.model.PositionModel;

class TargetCameraComponent extends BaseSceneComponent 
{
	public var target:BaseActor;
	var camera:Camera;
	
	public function new(camera:Camera, target:BaseActor = null) 
	{
		super();
		
		this.camera = camera;
		this.target = target;
	}
	
	override public function update(worldStep:WorldStep, actor:BaseActor) 
	{
		if (target == null) return;
		
		camera.x = -target.model.getModel(PositionModel).worldPosition.x;
		camera.y = -target.model.getModel(PositionModel).worldPosition.y;
		
		//camera.x = (target.model.getModel(PositionModel).worldPosition.x - camera.x) / 2;
		//camera.y = (target.model.getModel(PositionModel).worldPosition.y - camera.y) / 2;
		
		//camera.x = -target.getComponent(BaseViewComponent).view.x;
		//camera.y = -target.getComponent(BaseViewComponent).view.y;
	}
}