package;

import gl.GlStage;
import openfl.display.Sprite;
import openfl.display3D.Context3D;
import openfl.display3D.Context3DCompareMode;
import openfl.display3D.Context3DTriangleFace;
import openfl.events.ErrorEvent;
import openfl.events.Event;
import renderer.Renderer;
import renderer.TextureManager;
import swfdata.atlas.TextureStorage;

@:access(openfl.display3D.Context3D)
class BaseRunner extends Sprite
{
	var context3D:Context3D;
	var glStage:GlStage;
	
	var assetsManager:AssetsManager;
	
	public function new() 
	{
		super();
		
		this.mouseChildren = false;
		this.mouseEnabled = false;
		
		if (stage != null)
			initialize();
		else
			addEventListener(Event.ADDED_TO_STAGE, initialize);
	}
	
	private function initialize(e:Event = null):Void 
	{
		removeEventListener(Event.ADDED_TO_STAGE, initialize);
		
		stage.stage3Ds[0].addEventListener(Event.CONTEXT3D_CREATE, onContextCreated);
		stage.stage3Ds[0].addEventListener(ErrorEvent.ERROR, onContextCreatedError);
		stage.stage3Ds[0].requestContext3D("auto");
	}
	
	private function onContextCreatedError(e:ErrorEvent):Void 
	{
		trace(e);
	}
	
	@:access(_internal)
	private function onContextCreated(e:Event):Void 
	{
		context3D = stage.stage3Ds[0].context3D;
		
		trace(context3D);
		
		@:privateAccess context3D.__vertexConstants = new lime.utils.Float32Array(4 * Renderer.MAX_VERTEX_CONSTANTS);
		@:privateAccess context3D.__fragmentConstants = new lime.utils.Float32Array(4 * Renderer.MAX_VERTEX_CONSTANTS);
		
		trace('create viewport', stage.stageWidth, stage.stageHeight);
		context3D.configureBackBuffer(stage.stageWidth, stage.stageHeight, 16, true);
		context3D.setCulling(Context3DTriangleFace.NONE);
		
		//#if debug
			context3D.enableErrorChecking = false;
		//#end
		
		context3D.setDepthTest(true, Context3DCompareMode.ALWAYS);
		
		var textureManager:TextureManager = new TextureManager(context3D);
		var textureStorage:TextureStorage = new TextureStorage();
		
		glStage = new GlStage(stage, context3D, textureStorage);
		
		assetsManager = new AssetsManager(textureStorage, textureManager);
		assetsManager.createDefaultTexture();
		assetsManager.addEventListener(Event.COMPLETE, onAssetReady);
		
		onAssetReady(null);
	}
	
	private function onAssetReady(e:Event):Void 
	{	
		stage.addEventListener(Event.ENTER_FRAME, onUpdate);
	}
	
	private function onUpdate(e:Event):Void 
	{	
		glStage.update();
	}
}