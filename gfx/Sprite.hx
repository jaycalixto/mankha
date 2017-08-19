package mankha.gfx;

import kha.Image;
import kha.graphics2.Graphics;
import kha.Color;
import kha.math.Vector2;

class Sprite {

	public var position:Vector2;
	private var image:Image;

	public var isVisible(default, default):Bool;
	public var color(default, default):Color;

	public function new(img:Image){
		position = new Vector2();		
		image = img;
		color = Color.White;
		isVisible = true;
	}

	public function draw(g:Graphics) {
		if(isVisible){
			g.color = color;
			g.drawImage(image, position.x, position.y);
			g.color = Color.White;
		}
	}

}