package com.tbs.ordercat {

import com.tbs.ordercat.view.MainUI;

import flash.display.Sprite;

import morn.core.handlers.Handler;

public class OrderCat extends Sprite {
	public function OrderCat() {
		App.init(this);
		App.loader.loadAssets(["assets/comp.swf"], new Handler(loadComplete));
	}

	private function loadComplete():void {
		addChild(new MainUI());
	}
}
}
