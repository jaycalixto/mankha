package mankha.utils;

import js.Browser;
import js.html.CanvasElement;

class Window{

	public var windowWidth:Int;
	public var windowHeight:Int;

	private var forcedResolution = false;

	public function new(){
		resizeCanvas();
	}

	public function forceIntegerResolution(baseWidth:Int, baseHeight:Int) {

		if (windowWidth == 0){
			throw "call resizeCanvas() first";
		}

		var coefWidth = windowWidth / baseWidth;
		var coefHeight = windowHeight / baseHeight;

		var coef = Std.int(Math.min(coefWidth, coefHeight));

		windowWidth = baseWidth * coef;
		windowHeight = baseHeight * coef;

		forcedResolution = true;

		resizeCanvas();
	}

	public function resizeCanvas() {
		#if js

		var c:CanvasElement = cast Browser.document.getElementById("khanvas");

		c.style.paddingTop = "0px";
		c.style.paddingLeft = "0px";
		c.style.background = "#FF0000";
		c.style.position = "absolute";

		var fullResWidth = Std.int(Browser.window.innerWidth * 0.95);
		var fullResHeight = Std.int(Browser.window.innerHeight * 0.95);

		if (!forcedResolution) {
			windowWidth = fullResWidth;
			windowHeight = fullResHeight;
		}

		c.width = fullResWidth;
		c.height = fullResHeight;

		#else

		if (!forcedResolution) {
			windowWidth = kha.System.windowWidth;
			windowHeight = kha.System.windowHeight;
		}

		#end
	}
}