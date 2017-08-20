package mankha.gfx;

import kha.Image;
import kha.Color;
import kha.graphics2.Graphics;
import mankha.utils.Rectangle;
import mankha.utils.Point;

class NinePatch {

	public var rect(default, null): Rectangle;
	public var color(default, default): Color;
	public var isVisible(default, default):Bool;

	private var topLeft: Rectangle;
	private var top: Rectangle;
	private var topRight: Rectangle;
	private var left: Rectangle;
	private var center: Rectangle;
	private var right: Rectangle;
	private var bottomLeft: Rectangle;
	private var bottom: Rectangle;
	private var bottomRight: Rectangle;
	
	private var image: Image;

	public function new(img: Image) {
		rect = Rectangle.zeroRect();
		image = img;
		color = Color.White;
		isVisible = true;

		var w = img.width - 2;
		var h = img.height - 2;		

		var firstBlackX = new Point(6, 0);
		var lastBlackX = new Point(25,0);
		var firstBlackY = new Point(0, 6);
		var lastBlackY = new Point(0, 25);

		//can't read the pixels in this version of kha :(
		// for (i in 1...w) {			
		// 	var c = img.at(1, i);
		// 	if (c != Color.Transparent) {
		// 		if(firstBlackX == null) {
		// 			firstBlackX = new Point(i, 0);
		// 		}
		// 		lastBlackX.x = i;
		// 	}
		// }

		// for (i in 1...h) {
		// 	var c = img.at(i, 1);
		// 	trace("color r" + c.Rb + ", g" + c.Gb + ", b" + c.Bb + ", a"+c.Ab);
		// 	if (c != Color.Transparent) {
				
		// 		if(firstBlackY == null) {
		// 			firstBlackY = new Point(0, i);
		// 		}
		// 		lastBlackY.y = i;
		// 	}
		// }

		topLeft = new Rectangle(1, 1, 
			firstBlackX.x - 1, firstBlackY.y - 1);

		top = new Rectangle(firstBlackX.x, 1, 
			lastBlackX.x - topLeft.width, topLeft.height);

		topRight = new Rectangle(lastBlackX.x + 1, 1, 
			w - lastBlackX.x, topLeft.height);

		left = new Rectangle(1, firstBlackY.y, 
			topLeft.width, lastBlackY.y - topLeft.height);

		center = new Rectangle(firstBlackX.x, firstBlackY.y, 
			top.width, left.height);

		right = new Rectangle(topRight.x, 
			topRight.height + 1, topRight.width, center.height);

		bottomLeft = new Rectangle(1, left.y + left.height + 1, 
			topLeft.width, h - lastBlackY.y);

		bottom = new Rectangle(center.x, bottomLeft.y, 
			center.width, bottomLeft.height);

		bottomRight = new Rectangle(right.x, bottom.y, 
			right.width, bottom.height);

		
	}

	public function render(g:Graphics) {
		if(isVisible){
			g.color = color;

			//corners
			g.drawSubImage(image, rect.x, rect.y,
				topLeft.x, topLeft.y, topLeft.width, topLeft.height);

			g.drawSubImage(image, rect.x, rect.y + rect.height - bottomLeft.height,
				bottomLeft.x, bottomLeft.y, bottomLeft.width, bottomLeft.height);
			
			g.drawSubImage(image, rect.x + rect.width - topRight.width, rect.y,
				topRight.x, topRight.y, topRight.width, topRight.height);

			g.drawSubImage(image, rect.x + rect.width - bottomRight.width,
				rect.y + rect.height - bottomRight.height, bottomRight.x,
				bottomRight.y, bottomRight.width, bottomRight.height);

			//scaled
			g.drawScaledSubImage(image, top.x, top.y, top.width, top.height,			
				rect.x + topLeft.width, rect.y, rect.width - topLeft.width - topRight.width,
				top.height);
			g.drawScaledSubImage(image, left.x, left.y, left.width, left.height,
				rect.x, rect.y + topLeft.height, left.width,
				rect.height - topLeft.height - bottomLeft.height);
			g.drawScaledSubImage(image, right.x, right.y, right.width, right.height,
				rect.x + rect.width - right.width, rect.y +  topRight.height,
				right.width, rect.height - topRight.height - bottomRight.height);
			g.drawScaledSubImage(image, bottom.x, bottom.y, bottom.width, bottom.height,
				rect.x + bottomRight.width, rect.y + rect.height - bottom.height,
				rect.width - bottomLeft.width - bottomRight.width, bottom.height);
			g.drawScaledSubImage(image, center.x, center.y, center.width, center.height,
				rect.x + left.width, rect.y + top.height, rect.width - left.width - right.width,
				rect.height - top.height - bottom.height);

			g.color = Color.White;
		}
	}
}