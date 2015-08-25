package com.admapi.api {

	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.display.Bitmap;
	import flash.events.Event;
	import flash.events.StageOrientationEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.events.IOErrorEvent;
	import flash.events.MouseEvent;
	import flash.net.navigateToURL;
	import flash.system.Capabilities;
	import flash.desktop.NativeApplication;
	import flash.net.URLVariables;
	import flash.net.URLRequestMethod;

	import com.admapi.Config;
	import com.admapi.api.utils.android.deviceinfo.*;

	public class Admapi extends Sprite {

		private var stageRef: Stage;
		private var bg: Sprite = new Sprite(); // Background of ads
		private var bgColor: uint = 0x000000;
		private var closeButton = new Sprite(); // Close button of ads
		private var closeButtonColor: uint = 0xAAAAAA;
		private var bitmap: Bitmap = new Bitmap(); // ad container
		private var adCounter: Number = 0;
		private var apiUrl: String;
		private var adUrlLoader1: URLLoader = new URLLoader(); // Url loaders for ad JSON
		private var adUrlLoader2: URLLoader = new URLLoader();
		private var adRequest: URLRequest = new URLRequest(); // request for ad JSON
		private var adData: Object;
		private var adTimer: Timer;
		private var adVariables: URLVariables;
		private var bitmapUrlRequest: URLRequest = new URLRequest(); // request for bitmap
		private var bitmapLoader: Loader = new Loader();
		private var adClickDelayTimer: Timer = new Timer(1500);
		private var bitmapLoaderInfo: LoaderInfo;
		private var isShow: Boolean = false;
		private var orientation: String;

		private var appID: String;
		private var osType: String;
		private var osVersion: String;
		private var gameId: String;

		public function Admapi(stageRef: Stage) {

			this.stageRef = stageRef;
			orientation = currentOrientation();
			stageRef.addEventListener(StageOrientationEvent.ORIENTATION_CHANGE, orientationChangeHandler);
			
			if ((Capabilities.os.indexOf("Windows") >= 0)) {
				osType = "Windows";
			} else if ((Capabilities.os.indexOf("Mac") >= 0)) {
				osType = "ios"; // TO DO
			} else if ((Capabilities.os.indexOf("Linux") >= 0) || (Capabilities.os.indexOf("Android") >= 0)) {
				var deviceInfo: NativeDeviceInfo = new NativeDeviceInfo();
				deviceInfo.addEventListener(NativeDeviceInfoEvent.PROPERTIES_PARSED, handleDevicePropertiesParsed);
				deviceInfo.setDebug(false);
				deviceInfo.parse();
			}

			appID = NativeApplication.nativeApplication.applicationID;
			apiUrl = "http://admapi.com/GET/"; // ?action=ads&game=" + Config.GAMEID + "&p=" + osType + "";
			trace("apiUrl: " + apiUrl);
			trace("osVersion: " + osVersion);
			trace("osType: " + osType);
			trace("appID: " + appID);

			createInstance();
		}

		private function createInstance(): void {

			drawBackground();
			drawCloseButton();

			adRequest.method = URLRequestMethod.POST;
			adVariables = new URLVariables();
			adVariables.action = "ads";
			adVariables.publisherID = Config.PUBLISHERID;
			adVariables.gameID = Config.GAMEID;
			adVariables.appID = appID;
			adVariables.osType = osType;
			adVariables.osVersion = osVersion;
			adVariables.orientation = orientation;

			adRequest.data = adVariables;
			adRequest.url = apiUrl;

			adUrlLoader1.addEventListener(Event.COMPLETE, onAdUrlLoader1Complete);
			adUrlLoader1.load(adRequest);


		}

		private function onAdUrlLoader1Complete(e: Event): void {

			adUrlLoader2 = URLLoader(e.target);
			adData = JSON.parse(adUrlLoader2.data);

			if (adData != null) {
				trace("adData 1: " + adData.Reklam[0].url);
				trace("adData 2: " + adData.Reklam[0].resim);

				bg.alpha = 100;
				closeButton.alpha = 100;
				setChildIndex(bg, numChildren - 1);
				setChildIndex(closeButton, numChildren - 1);
				bitmapUrlRequest.url = adData.Reklam[0].resim;
				bitmapLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, onBitmapLoaderCompleted);
				bitmapLoader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, onBitmapLoaderLoadError);
				bitmapLoader.load(bitmapUrlRequest);
				adClickDelayTimer.addEventListener(TimerEvent.TIMER, adClickDelayTimerFunction);

				function adClickDelayTimerFunction(e: TimerEvent): void {
					closeButton.addEventListener(MouseEvent.CLICK, closeButtonClicked);
					bg.addEventListener(MouseEvent.CLICK, adClicked);
					adClickDelayTimer.stop();
				}
				adClickDelayTimer.start();

				function onBitmapLoaderCompleted(e: Event): void {

					trace("onBitmapLoaderCompleted()");
					bitmapLoaderInfo = LoaderInfo(e.target);
					bitmapLoaderInfo.removeEventListener(Event.COMPLETE, onBitmapLoaderCompleted);
					bitmapLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, onBitmapLoaderLoadError);
					bitmap = Bitmap(bitmapLoaderInfo.content);
					bitmap.alpha = 100;


					if (bitmap.height > stageRef.stageHeight) {
						bitmap.scaleX = (stageRef.stageWidth / bitmap.width) * 0.80;
						bitmap.scaleY = (stageRef.stageHeight / bitmap.height) * 0.80;
					}
					if (bitmap.width > stageRef.stageWidth) {
						bitmap.scaleX = (stageRef.stageWidth / bitmap.width) * 0.80;
						bitmap.scaleY = (stageRef.stageHeight / bitmap.height) * 0.80;
					}

					bitmap.x = (stageRef.stageWidth - bitmapLoader.width) / 2;
					bitmap.y = (stageRef.stageHeight - bitmapLoader.height) / 3;

					if (adCounter == 0) {
						addChild(bitmap);
						adCounter = 1;
					}
				}

				function onBitmapLoaderLoadError(e: IOErrorEvent): void {

					trace("onBitmapLoaderLoadError(): " + e.text);
					bitmapLoaderInfo = LoaderInfo(e.target);
					adCounter = 0;
					bitmapLoaderInfo.removeEventListener(Event.COMPLETE, onBitmapLoaderCompleted);
					bitmapLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, onBitmapLoaderLoadError);
				}

				function adClicked(e: MouseEvent): void {

					closeButtonClicked(null);
					navigateToURL(new URLRequest(adData.Reklam[0].url));
				}

				function closeButtonClicked(e: MouseEvent): void {

					adCounter = 0;
					removeChildren(0, numChildren - 1);
				}
			}
		}

		private function drawBackground(): void {

			bg.graphics.clear();
			bg.graphics.beginFill(bgColor);
			bg.graphics.drawRect(0, 0, stageRef.stageWidth, stageRef.stageHeight); // x, y, width, height
			bg.graphics.endFill();
			bg.alpha = 0;
			addChild(bg);
		}

		private function drawCloseButton(): void {

			closeButton.graphics.clear();
			closeButton.graphics.beginFill(closeButtonColor);
			closeButton.graphics.drawRoundRect(stageRef.stageWidth - 60, 20, 40, 40, 10, 10); // x, y, width, height, ellipseW, ellipseH
			closeButton.graphics.endFill();
			var cross: Sprite = new Sprite();
			cross.graphics.lineStyle(4, 0x000000);
			cross.graphics.moveTo(stageRef.stageWidth - 50, 30);
			cross.graphics.lineTo(stageRef.stageWidth - 30, 50);
			cross.graphics.moveTo(stageRef.stageWidth - 50, 50);
			cross.graphics.lineTo(stageRef.stageWidth - 30, 30);
			closeButton.addChild(cross);
			closeButton.alpha = 0;
			addChild(closeButton);
		}

		private function handleDevicePropertiesParsed(event: NativeDeviceInfoEvent): void {

			NativeDeviceInfo(event.target).removeEventListener(NativeDeviceInfoEvent.PROPERTIES_PARSED, handleDevicePropertiesParsed);

			osType = NativeDevicePropertiesData(NativeDeviceProperties.OS_NAME).value;
			osVersion = NativeDevicePropertiesData(NativeDeviceProperties.OS_VERSION).value;
			trace(NativeDevicePropertiesData(NativeDeviceProperties.OS_NAME).label + " - " + NativeDevicePropertiesData(NativeDeviceProperties.OS_NAME).value);
			trace(NativeDevicePropertiesData(NativeDeviceProperties.OS_VERSION).label + " - " + NativeDevicePropertiesData(NativeDeviceProperties.OS_VERSION).value);
		}
		
		protected function orientationChangeHandler(event:StageOrientationEvent):void {
			currentOrientation();
		}
		
		protected function currentOrientation(): String {
 
			if (stageRef.stageWidth > stageRef.stageHeight)
				return "yatay";
			else
				return "dikey";
		}
	}
}