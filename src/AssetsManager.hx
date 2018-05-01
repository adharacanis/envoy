package;

import AtlasGenerator;
import assets.AssetsStorage;
import openfl.Assets;
import openfl.display.BitmapData;
import openfl.display3D.Context3DTextureFormat;
import openfl.events.Event;
import openfl.events.EventDispatcher;
import openfl.geom.Matrix;
import openfl.geom.Rectangle;
import openfl.utils.ByteArray;
import openfl.utils.Endian;
import renderer.TextureManager;
import swfdata.DisplayObjectData;
import swfdata.ShapeData;
import swfdata.atlas.GLSubTexture;
import swfdata.atlas.TextureId;
import swfdata.atlas.TextureSource;
import swfdata.atlas.TextureStorage;
import swfdata.atlas.TextureTransform;
import swfdata.datatags.SwfPackerTag;
import swfdataexporter.SwfExporter;
import swfparser.SwfParserLight;
//import assets.AssetLoader;

class AssetsManager extends EventDispatcher
{
	public static var instance:AssetsManager;
	
	var assetsStorage:AssetsStorage;
	var textureStorage:TextureStorage;
	var textureManager:TextureManager;
	var swfExporter:SwfExporter;
	var swfParserLight:SwfParserLight;
	
	var atlasGenerator:AtlasGenerator = new AtlasGenerator();
	
	public var linkagesMap:Map<String, DisplayObjectData> = new Map<String, DisplayObjectData>();
	
	public function new(textureStorage:TextureStorage, textureManager:TextureManager)
	{
		super();
		
		instance = this;
		
		this.textureManager = textureManager;
		this.textureStorage = textureStorage;
		
		assetsStorage = new AssetsStorage();
		//var assetsLoader:AssetLoader = new AssetLoader(assetsStorage);
		//assetsLoader.addToQueue("animation/a.ani");
		//assetsLoader.addToQueue("animation/biker.ani");
		//assetsLoader.addToQueue("animation/teslagirl.ani");
		//assetsLoader.addToQueue("animation/bath.animation");
		//assetsLoader.addToQueue("animation/albion_mirabelle.animation");
		//assetsLoader.addToQueue("animation/circus.animation");
		//assetsLoader.addToQueue("animation/amure_lemure.animation");
		//assetsLoader.addToQueue("animation/valentine2016_kisses.animation");
		//assetsLoader.addToQueue("animation/chestnut_tree.animation");
		//assetsLoader.addToQueue("animation/pinetree.animation");
		//assetsLoader.addToQueue("animation/cypress.animation");	
		
		
		
		//assetsLoader.addEventListener(Event.COMPLETE, onAssetsLoaded);
		//assetsLoader.load();
	}
	
	private function onAssetsLoaded(e:Event):Void 
	{
		//parseAsset("animation/a.ani");
		//parseAsset("animation/biker.ani");
		//parseAsset("animation/teslagirl.ani");
		//parseAsset("animation/bath.animation");
		//parseAsset("animation/albion_mirabelle.animation");
		//parseAsset("animation/circus.animation");
		//parseAsset("animation/amure_lemure.animation");
		//parseAsset("animation/valentine2016_kisses.animation");
		//parseAsset("animation/chestnut_tree.animation");
		//parseAsset("animation/pinetree.animation");
		//parseAsset("animation/cypress.animation");	
		
		dispatchEvent(new Event(Event.COMPLETE));
	}
	
	public function createDefaultTexture()
	{
		var padding:Float = 16;
		var texturePadding:Float = 4;
		
		var bitmap:BitmapData = new BitmapData(256, 256, true, 0);
		var z = 0.5;
		bitmap.fillRect(new Rectangle(padding-z, padding-z, 32+z*2, 32+z*2), 0x55FF0000);
		bitmap.fillRect(new Rectangle(padding, padding, 32, 32), 0xFFFF0000);
		
		bitmap.fillRect(new Rectangle(padding - z + 32 / 2, padding - z + (32 / 2 - 4), 32 / 2, 8 + z), 0xFF00FF00);
		
		
		bitmap.fillRect(new Rectangle(padding + 32 + padding, padding, 32, 32), 0xFF00FF00);
		
		bitmap.fillRect(new Rectangle(padding + 32 + padding-z, padding + 32 + padding-z, 32+z*2, 32+z*2), 0xFFFF0000);
		bitmap.fillRect(new Rectangle(padding + 32 + padding, padding + 32 + padding, 32, 32), 0xFF00FF00);
		
		var textureSource = new TextureSource(bitmap, 256, 256, textureManager);
		
		textureSource.createGlData(Context3DTextureFormat.BGRA);
		textureSource.uploadToGpu();
		
		
		var combinedTextureId = new TextureId(0, 0);
		var shape = new ShapeData(combinedTextureId, new Rectangle(-(padding + 16), -(padding + 16), 32, 32));
		shape.transform = new Matrix();
		
		var texture:GLSubTexture = new GLSubTexture(0, new Rectangle(0, 0, 32 + padding * 2, 32 + padding * 2), new TextureTransform(1, 1, 0, 0), textureSource, 0, Context3DTextureFormat.BGRA);
		textureStorage.putTexture(combinedTextureId, texture);
		
		linkagesMap["default"] = shape;
		
		var combinedTextureId = new TextureId(0, 1);
		var shape = new ShapeData(combinedTextureId, new Rectangle(-(texturePadding + 16), -(texturePadding + 16), 32, 32));
		shape.transform = new Matrix();
		
		var texture:GLSubTexture = new GLSubTexture(1, new Rectangle(32 + padding * 2 - texturePadding, 32 + padding * 2 - texturePadding, 32 + texturePadding * 2, 32 + texturePadding * 2), new TextureTransform(1, 1, 0, 0), textureSource, 0, Context3DTextureFormat.BGRA);
		textureStorage.putTexture(combinedTextureId, texture);
		
		linkagesMap["default#2"] = shape;
		
		var combinedTextureId = new TextureId(0, 2);
		var shape = new ShapeData(combinedTextureId, new Rectangle(-(texturePadding + 16), -(texturePadding + 16), 32, 32));
		shape.transform = new Matrix();
		
		var texture:GLSubTexture = new GLSubTexture(2, new Rectangle(32 + padding * 2 - texturePadding, padding - texturePadding, 32 + texturePadding * 2, 32 + texturePadding * 2), new TextureTransform(1, 1, 0, 0), textureSource, 0, Context3DTextureFormat.BGRA);
		textureStorage.putTexture(combinedTextureId, texture);
		
		linkagesMap["default#1"] = shape;
		
		return shape;
	}
	
	public function createCustomAtlas(width:Int, height:Int):TextureSource
	{
		var atlasData:BitmapData = new BitmapData(width, height, true, 0x0);
		var textureSource = new TextureSource(atlasData, width, height, textureManager);
		
		return textureSource;
	}
	
	public function uploadAtlasData(textureSource:TextureSource)
	{
		textureSource.createGlData(Context3DTextureFormat.BGRA);
		textureSource.uploadToGpu();
	}
	
	public function switchAtlas(bitmapData:BitmapData)
	{
		atlasGenerator.setBitmapData(bitmapData);
	}
	
	public function createCustomSprite(atlasID:Int, textureId:Int, textureSource:TextureSource, spriteData:BitmapData, scaleX:Float = 1, scaleY:Float = 1)
	{
		var combinedTextureId = new TextureId(atlasID, textureId);
		atlasGenerator.addTexture(textureStorage, combinedTextureId, textureSource, spriteData, textureId, scaleX, scaleY);
		
		var shape = new ShapeData(combinedTextureId, new Rectangle(0, 0, spriteData.width, spriteData.height));
		shape.transform = new Matrix();
		
		linkagesMap["shape:"+combinedTextureId.toString()] = shape;
		
		return shape;
	}


	
	public function createBack()
	{
		var path = "bg/may_9.jpg";
		var bitmapData = Assets.getBitmapData(path, true);

	}

	public function createUIAssets()
	{
		var textureSource = createCustomAtlas(1024, 1024);
		var atlasID = textureStorage.getNextTextureId();
		var textureID:Int = 0;
		switchAtlas(textureSource.source);
		
		createCustomSprite(atlasID, textureID++, textureSource, Assets.getBitmapData("ui/grey_sliderUp.png", true), 0.5, 0.5);
		createCustomSprite(atlasID, textureID++, textureSource, Assets.getBitmapData("ui/grey_sliderEnd.png", true));
		createCustomSprite(atlasID, textureID++, textureSource, Assets.getBitmapData("ui/grey_circle.png", true));
		createCustomSprite(atlasID, textureID++, textureSource, Assets.getBitmapData("ui/grey_sliderVertical.png", true));
		createCustomSprite(atlasID, textureID++, textureSource, Assets.getBitmapData("ui/grey_sliderHorizontal.png", true));
		createCustomSprite(atlasID, textureID++, textureSource, Assets.getBitmapData("ui/grey_sliderRight.png", true));

		uploadAtlasData(textureSource);
		
		//var format:TextFormat = new TextFormat("Verdana", 12, 0x333333, false);
		//atlasGenerator.addText("Morning", format, textureID++);
		//atlasGenerator.addText("Midnight", format, textureID++);
	}
	
	@:access(swfdata)
	private function parseAsset(path:String) 
	{
		var swfTags = new Array<SwfPackerTag>();
		
		//TODO: need to reuse swfExporter and parser and use CLEAR instead of making new instance everytime
		swfExporter = new SwfExporter(textureStorage, textureManager);
		swfParserLight = new SwfParserLight();
		
		var data:ByteArray = assetsStorage.getAsset(path).content;
		data.endian = Endian.LITTLE_ENDIAN;
		
		swfExporter.importSwfGL(data, swfParserLight.context.shapeLibrary, swfTags);
		
		swfParserLight.context.library.addShapes(swfParserLight.context.shapeLibrary);
		swfParserLight.processDisplayObject(swfTags);
		
		for (spriteData in swfParserLight.context.library.linkagesList)
		{
			var key = path + "#" + spriteData.libraryLinkage;
			linkagesMap[key] = spriteData;
		}
		
	}
}