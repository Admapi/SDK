package com.admapi.ui {
	
	import flash.display.Sprite;
	
	import com.admapi.ui.CloseButton;
	
	public class Background extends Sprite {
		
		private var bg:Sprite = new Sprite();
		public var closeButton:CloseButton = new CloseButton();
		private var bgColor:uint = 0x000000;
		
		public function Background() {
			
			drawBackground();
			addChild(bg);
		}
		
		private function drawBackground() : void {
			
			bg.graphics.clear();
			bg.graphics.beginFill(bgColor);
			bg.graphics.drawRect(0, 0, 480, 800); // x, y, width, height
			bg.graphics.endFill();
			bg.addChild(closeButton);
		}
	}
}