package mankha.utils;

import js.Browser;
import js.html.CanvasElement;

class Window{

	public var windowWidth:Int;
	public var windowHeight:Int;

	public function new(){
		resizeCanvas();
	}

	public function resizeCanvas(){
		#if js

		var c:CanvasElement = cast Browser.document.getElementById("khanvas");

		c.style.paddingTop = "0px";
		c.style.paddingLeft = "0px";
		c.style.background = "#FF0000";
		c.style.position = "absolute";

		windowWidth = Std.int(Browser.window.innerWidth * 0.95);
		windowHeight = Std.int(Browser.window.innerHeight * 0.95);

		c.width = windowWidth;
		c.height = windowHeight;

		#else

		windowWidth = kha.System.windowWidth;
		windowHeight = kha.System.windowHeight;

		#end
	}
}