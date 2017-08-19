package mankha.input;

import kha.Key;
import kha.input.Keyboard;

class InputHandler {

	public var left = false;
	public var right = false;
	public var up = false;
	public var down = false;

	public function new() {
		Keyboard.get().notify(keyDown, keyUp);
	}

	private function handle(key: Key, value: String, enableDisable:Bool){
		switch(key) {
			case CHAR:
				switch(value){
					case "w":
						up = enableDisable;
					case "s":
						down = enableDisable;
					case "a":
						left = enableDisable;
					case "d":
						right = enableDisable;
					default:
				}
			default:
		}
	}

	public function keyDown(key: Key, value: String) {
		handle(key, value, true);
	}

	public function keyUp(key: Key, value: String) {
		handle(key, value, false);
	}
}