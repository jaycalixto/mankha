package mankha.gfx;

import kha.graphics2.Graphics;
import kha.Image;
import kha.Color;
import haxe.ds.Vector;

class AnimatedSprite extends Sprite {

	public var frameW(default, null):Int;
	public var frameH(default, null):Int;
	private var frameIndex:Int;
	private var frames:Vector<AnimationFrame>;
	private var lastTime:Float;

	public function new(img: Image, frameWidth:Int, frameHeight:Int) {
		super(img);
		frameW = frameWidth;
		frameH = frameHeight;
		frameIndex = 0;

		var totalColumns = Std.int(img.width / frameW);
		var totalRows = Std.int(img.height / frameH);

		frames = new Vector<AnimationFrame>(totalColumns * totalRows);

		for(i in 0...totalRows) {
			for(j in 0...totalColumns) {
				var anim = new AnimationFrame((totalColumns * i) + j, j * frameW, i * frameH);

				frames[anim.frameIndex] = anim;
			}
		}
	}

	public override function draw(g:Graphics){
		if(isVisible){
			g.color = color;
			g.drawSubImage(image, position.x, position.y, frames[frameIndex].sourceX, frames[frameIndex].sourceY, frameW, frameH);
			g.color = Color.White;
		}
		if( (kha.Scheduler.time() - lastTime) > 0.2){
			lastTime = kha.Scheduler.time();
			frameIndex++;
			frameIndex = frameIndex % 4;
		}		
	}

}