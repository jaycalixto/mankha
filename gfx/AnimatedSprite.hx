package mankha.gfx;

import kha.graphics2.Graphics;
import kha.Image;
import kha.Color;
import mankha.utils.Rectangle;

class AnimatedSprite extends Sprite {

	public var animationRate(default, default):Float;
	public var frameW(default, null):Int;
	public var frameH(default, null):Int;
	private var frameIndex:Int;
	public var framesUp(default, default):Array<Rectangle>;
	public var framesDown(default, default):Array<Rectangle>;
	public var framesLeft(default, default):Array<Rectangle>;
	public var framesRight(default, default):Array<Rectangle>;
	private var lastTime:Float;
	private var dir:Direction;
	private var currentFrames:Array<Rectangle>;

	public function new(img: Image, width:Int, height:Int) {
		super(img);
		dir = Direction.DOWN;
		animationRate = 0.2;
		this.frameW = width;
		this.frameH = height;
		this.frameIndex = 0;
	}

	public override function draw(g:Graphics){
		if(isVisible){
			g.color = color;

			switch (dir) {
				case DOWN: currentFrames = framesDown;
				case UP: currentFrames = framesUp;
				case LEFT: currentFrames = framesLeft;
				case RIGHT: currentFrames = framesRight;
				default: trace("direction not found " + dir);
			}

			g.drawSubImage(image, position.x, position.y, 
				currentFrames[frameIndex].x, currentFrames[frameIndex].y,
				currentFrames[frameIndex].width, currentFrames[frameIndex].height);

			g.color = Color.White;
		}

		if ((kha.Scheduler.time() - lastTime) > animationRate) {
			lastTime = kha.Scheduler.time();
			frameIndex++;
			frameIndex = frameIndex % currentFrames.length;
		}
	}

	public function changeDirection(dir:Direction){
		this.dir = dir;
	}
}

enum Direction {
		UP;
		DOWN;
		LEFT;
		RIGHT;
}