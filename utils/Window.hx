package mankha.utils;

import js.Browser;
import js.html.CanvasElement;

class Window {

	public var windowWidth:Int;
	public var windowHeight:Int;

	// private var forcedResolution = false;
	private var baseWidth:Int;
	private var baseHeight:Int;

	public function new(baseWidth:Int, baseHeight:Int) {
		this.baseWidth = baseWidth;
		this.baseHeight = baseHeight;
		resizeCanvas();
	}

	// private function forceIntegerResolution(baseWidth:Int, baseHeight:Int) {

	// 	if (windowWidth == 0){
	// 		throw "call resizeCanvas() first";
	// 	}

	// 	var coefWidth = windowWidth / baseWidth;
	// 	var coefHeight = windowHeight / baseHeight;

	// 	var coef = Std.int(Math.min(coefWidth, coefHeight));

	// 	windowWidth = baseWidth * coef;
	// 	windowHeight = baseHeight * coef;

	// 	// forcedResolution = true;

	// 	resizeCanvas();
	// }

	private function resizeCanvas() {
		#if js

		var c:CanvasElement = cast Browser.document.getElementById("khanvas");

		c.style.paddingTop = "0px";
		c.style.paddingLeft = "0px";
		//c.style.background = "#FF0000";
		c.style.position = "absolute";
		c.style.margin = "auto";	
		c.style.top = "0";
		c.style.right = "0";
		c.style.bottom = "0";
		c.style.left = "0";

		var fullResWidth = Std.int(Browser.window.innerWidth * 0.95);
		var fullResHeight = Std.int(Browser.window.innerHeight * 0.95);

		// c.width = fullResWidth;
		// c.height = fullResHeight;

		#else

		// if (!forcedResolution) {
		fullResWidth = Std.int(kha.Display.width * 0.95);
		fullResHeight = Std.int(kha.Display.height * 0.95);
		
		// }

		#end

		// if (!forcedResolution) {
			//windowWidth = fullResWidth;
			//windowHeight = fullResHeight;
		// }
		var coefWidth = fullResWidth / baseWidth;
		var coefHeight = fullResHeight / baseHeight;

		var coef = Std.int(Math.min(coefWidth, coefHeight));

		windowWidth = baseWidth * coef;
		windowHeight = baseHeight * coef;

		#if js
		c.width = windowWidth;
		c.height = windowHeight;
		c.style.width = "" + windowWidth + "px";
		c.style.height = "" + windowHeight + "px";
		#end
	}
}