package mankha.widgets;

import kha.Color;
import kha.Image;
import kha.Font;
import kha.graphics2.Graphics;
import mankha.utils.Rectangle;
import mankha.gfx.NinePatch;

class MessageBox {

	public var text(get, set): String;
	public var rect(get, null): Rectangle;
	public var textColor(default, default): Color;
	public var backgroundColor(get, set) : Color;
	public var isEnable(default, default) : Bool;
	public var font(default, default) : Font;
	public var fontSize(default, default) : Int;
	public var charsPerSecond(default, default) : Float;

	private var patch : NinePatch;
	private var mText : String;
	private var mTextArray: Array<String>;
	private var totalCharacters : Int;

	public function new (bkgimage: Image, fnt: Font) {
		rect = Rectangle.zeroRect();
		patch = new NinePatch(bkgimage);
		isEnable = true;
		font = fnt;
		fontSize = 19;
		textColor = Color.White;
		text = "";
		charsPerSecond = -1;
	}

	public function render(g: Graphics) {
		if (isEnable) {
			patch.render(g);

			g.font = font;
			g.fontSize = fontSize;
			g.color = textColor;
		
			if (charsPerSecond <= 0) {
				g.drawCharacters(text, 0, 12, 1);
			}
			for(i in 0...mTextArray.length) {
				g.drawString(mTextArray[i], 
					patch.rect.x + 20, 
					patch.rect.y + 20 + (fontSize * i));
				
				//g.drawCharacters();
			}			

			g.color = Color.White;
		}
	}

	private function get_text(): String {
		return mText;
	}

	private function set_text(txt:String) : String {
		mText = txt;
		if (mText == null) {
			mText = "";
		}

		mTextArray = mText.split("\n");
		totalCharacters = mText.length;

		return mText;
	} 

	private function get_rect(): Rectangle {
		return patch.rect;
	}

	private function get_backgroundColor() : Color {
		return patch.color;
	}

	private function set_backgroundColor(c: Color) : Color {
		patch.color = c;
		return c;
	}
	
}