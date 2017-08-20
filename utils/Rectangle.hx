package mankha.utils;

class Rectangle {

	public var x(default, default): Int;
	public var y(default, default): Int;
	public var width(default, default): Int;
	public var height(default, default): Int;

	public function new(x:Int, y:Int, w:Int, h:Int) {
		this.x = x;
		this.y = y;
		this.width = w;
		this.height = h;
	}

	public static function zeroRect(): Rectangle {
		return new Rectangle(0, 0, 0, 0);
	}
}