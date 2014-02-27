/**
 * Created by RockyF on 14-2-26.
 */
package com.tbs.ordercat.view {
import com.greensock.TweenLite;
import com.tbs.ordercat.model.OrderModel;
import com.tbs.ordercat.ui.StatisticsUI;

import flash.display.Sprite;

import morn.core.components.Box;
import morn.core.components.Label;

import morn.core.handlers.Handler;

public class Statistics extends StatisticsUI {
	private var _model:OrderModel;

	public function Statistics() {
		super();
	}

	override protected function initialize():void {
		super.initialize();

		_model = OrderModel.instance;

		lsb.renderHandler = new Handler(lsbRenderHandler);
		lsb.array = [];

		btnClose.clickHandler = new Handler(onBenCloseClick);
		btnRefresh.clickHandler = new Handler(onBtnRefreshClick);
	}

	private function lsbRenderHandler(cell:Box, index:int):void{
		if(index < lsb.length){
			var vo:Object = lsb.array[index];

			var lab:Label = cell.getChildByName("lab") as Label;
			lab.text = vo.name + "(" + vo.count + ")";
			lab.color = vo.color;
		}
	}

	private function onBenCloseClick():void {
		hide();
	}

	public function show():void {
		TweenLite.to(this, 1, {x: 9, alpha: 1});
		_model.getList(new Handler(refreshList));
	}

	public function hide():void {
		TweenLite.to(this, 1, {x: -285, alpha: 0});
	}

	private function onBtnRefreshClick():void{
		_model.getList(new Handler(refreshList));
	}

	private function refreshList(list:Array):void{
		var angle:Number = 0;
		var percent:Number = 0;
		var all:int;
		for each (var vo:Object in list) {
			all += vo.count;
		}
		var occupy:Number = 0;
		for each (var vo:Object in list) {
			vo.color = int(Math.random() * 0xFFFFFF);
			occupy = 360 * vo.count / all;
			DrawSector(palette, 0, 0, 70, occupy, angle, vo.color);
			angle += occupy;
		}

		lsb.array = list;
	}

	private function DrawSector(mc:Sprite, x:Number = 80, y:Number = 80, r:Number = 80, angle:Number = 90, startFrom:Number = 0, color:Number = 0xff0000):void {
		mc.graphics.beginFill(color, 50);
		//mc.graphics.lineStyle(0, 0xff0000);
		mc.graphics.moveTo(x, y);
		var angle:Number = (Math.abs(angle) > 360) ? 360 : angle;
		var n:Number = Math.ceil(Math.abs(angle) / 45);
		var angleA:Number = angle / n;
		angleA = angleA * Math.PI / 180;
		startFrom = startFrom * Math.PI / 180;
		mc.graphics.lineTo(x + r * Math.cos(startFrom), y + r * Math.sin(startFrom));
		var angleMid:Number, bx:Number, by:Number, cx:Number, cy:Number;
		for (var i:int = 1; i <= n; i++) {
			startFrom += angleA;
			angleMid = startFrom - angleA / 2;
			bx = x + r / Math.cos(angleA / 2) * Math.cos(angleMid);
			by = y + r / Math.cos(angleA / 2) * Math.sin(angleMid);
			cx = x + r * Math.cos(startFrom);
			cy = y + r * Math.sin(startFrom);
			mc.graphics.curveTo(bx, by, cx, cy);
		}
		if (angle != 360) {
			mc.graphics.lineTo(x, y);
		}
		mc.graphics.endFill();
	}
}
}
