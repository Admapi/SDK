package com.admapi.ui {
	
	import flash.display.Sprite;
	
	public class CloseButton extends Sprite {
		
		private var button:Sprite = new Sprite();
		
		public function CloseButton() {
			
			drawButton();
			addChild(button);
		}
		
		private function drawButton() : void {
		
			button.graphics.clear();
			button.graphics.beginFill(0xAAAAAA);
			button.graphics.drawRoundRect(420, 20, 40, 40, 10, 10); // x, y, width, height, ellipseW, ellipseH
			button.graphics.endFill();
		}
	}
}