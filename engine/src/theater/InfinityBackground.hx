package theater;

import openfl.geom.Matrix;
import openfl.geom.Point;
import renderer.Renderer;
import swfdata.atlas.GLSubTexture;
import swfdata.atlas.ITexture;
import theater.scene.Camera;

class InfinityBackground
{
	public var HELPER_BUFFER:Array<Float> = new Array<Float>();
	
	var texture:GLSubTexture;
	var position:Point = new Point();
	var camera:Camera;

	public function new(texture:ITexture, camera:Camera) 
	{
		this.camera = camera;
		this.texture = cast texture;
	}
	
	
	
	@:access(internal)
	public function render(renderer:Renderer):Void
	{
		position.x = camera.x / 2;
		position.y = camera.y / 2;
		
		var size:Float = 256 / 2; 
		var scale:Float = 800 / 128;
		
		
		HELPER_BUFFER[0] = scale;
		HELPER_BUFFER[1] = 0;
		HELPER_BUFFER[2] = 0;
		HELPER_BUFFER[3] = scale;
		HELPER_BUFFER[4] = 400;
		HELPER_BUFFER[5] = 400;
		HELPER_BUFFER[6] = size;
		HELPER_BUFFER[7] = size;
		HELPER_BUFFER[8] = -position.x/size;
		HELPER_BUFFER[9] = -position.y/size;
		HELPER_BUFFER[10] = scale;
		HELPER_BUFFER[11] = scale;
		
		renderer.drawRawTexture(texture, HELPER_BUFFER);
		//renderer.__draw();
	}
}