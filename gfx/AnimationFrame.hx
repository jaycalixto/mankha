package mankha.gfx;

class AnimationFrame {

	public var frameIndex(default, null):Int;
	public var sourceX(default, null):Int;
	public var sourceY(default, null):Int;

	public function new(index:Int, sx:Int, sy:Int) {
		frameIndex = index;
		sourceX = sx;
		sourceY = sy;
	}
}