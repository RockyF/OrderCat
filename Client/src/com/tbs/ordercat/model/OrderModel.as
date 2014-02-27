/**
 * Created by lenovo on 14-2-26.
 */
package com.tbs.ordercat.model {
import flash.events.Event;
import flash.net.URLLoader;
import flash.net.URLRequest;
import flash.utils.Dictionary;

import morn.core.handlers.Handler;

public class OrderModel {
	private static var _instance:OrderModel;
	public static function get instance():OrderModel{
		if(!_instance){
			_instance = new OrderModel()
		}

		return _instance;
	}

	private static var cmdMap:Dictionary;

	public static var urlBase:String;

	public function OrderModel() {
	}

	public function init(urlBase:String):void{
		OrderModel.urlBase = urlBase;

		cmdMap = new Dictionary();
		cmdMap["list"] = "list";
		cmdMap["order"] = "order";
	}

	public function getList(callback:Handler):void{
		doRequest("list", callback);
	}

	public function makeOrder(callback:Handler, name:String, index:int):void{
		doRequest("order", callback, {name:name, index:index});
	}

	public static function doRequest(cmd:String, callback:Handler, params:Object = null):void{
		var loader:URLLoader = new URLLoader();
		loader.addEventListener(Event.COMPLETE, function(event:Event):void{
			callback.executeWith([JSON.parse(loader.data)]);
		});

		var paramStr:String = "";
		for (var key:String in params) {
			paramStr += key + "=" + params[key] + "&";
		}

		var url:String = urlBase + cmdMap[cmd] + ".php?" + paramStr + "ts=" + new Date().valueOf();

		loader.load(new URLRequest(url));
	}
}
}
