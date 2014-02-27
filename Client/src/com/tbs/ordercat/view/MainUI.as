/**
 * Created by RockyF on 14-2-26.
 */
package com.tbs.ordercat.view {
import com.tbs.ordercat.OrderCat;
import com.tbs.ordercat.model.OrderModel;
import com.tbs.ordercat.ui.MainUIUI;

import flash.events.MouseEvent;

import morn.core.components.Box;
import morn.core.components.Label;
import morn.core.handlers.Handler;

public class MainUI extends MainUIUI {
	private var _model:OrderModel;

	public function MainUI() {
		super();
	}

	override protected function initialize():void {
		super.initialize();

		_model = OrderModel.instance;
		_model.init("http://localhost/ordercat/");

		lsb.renderHandler = new Handler(lsbRenderHandler);
		lsb.selectHandler = new Handler(lsbSelectHandler);
		lsb.array = [];
		btnClose.clickHandler = new Handler(onClick);
		btnLook.clickHandler = new Handler(onBtnLookClick);
		btn_order.clickHandler = new Handler(onBtnOrderClick);
		btnRefresh.clickHandler = new Handler(onBtnRefreshClick);
		imgBg.addEventListener(MouseEvent.MOUSE_DOWN, beginDrag);

		_model.getList(new Handler(refreshList));
	}

	private function onClick():void{
		stage.nativeWindow.close();
	}

	private function lsbRenderHandler(item:Box, index:int):void{
		if(index < lsb.length){
			var text:Label = item.getChildByName("lsbTxt") as Label;
			text.text = lsb.array[index].name;
		}
	}

	private function lsbSelectHandler(index:int):void{
		labSelected.text = lsb.array[index].name;
	}

	private function beginDrag(event:MouseEvent):void{
		if(event.localY < 25){
			stage.nativeWindow.startMove();
		}
	}

	private function onBtnLookClick():void{
		statistics.show();

	}

	private function onBtnRefreshClick():void{
		_model.getList(new Handler(refreshList));
	}

	private function onBtnOrderClick():void{
		_model.makeOrder(new Handler(orderHandle),tiName.text,lsb.selectedIndex);
	}

	private function orderHandle(result:Object):void{
		if(result.result){

		}
	}

	private function refreshList(list:Array):void{
		lsb.array = list;
		lsb.selectedIndex = 0;
	}
}
}
