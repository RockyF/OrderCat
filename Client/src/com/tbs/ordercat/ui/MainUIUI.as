/**Created by the Morn,do not modify.*/
package com.tbs.ordercat.ui {
	import morn.core.components.*;
	import com.tbs.ordercat.view.Statistics;
	public class MainUIUI extends View {
		public var imgBg:Image;
		public var btnRefresh:Button;
		public var btnClose:Button;
		public var lsb:List;
		public var tiName:TextInput;
		public var btn_order:Button;
		public var labSelected:Label;
		public var btnLook:Button;
		public var statistics:Statistics;
		protected var uiXML:XML =
			<View>
			  <Image url="png.comp.bg" x="0" y="0" width="300" height="270" sizeGrid="5,28,5,5" var="imgBg"/>
			  <Button label="刷新" skin="png.comp.button" x="10" y="237" var="btnRefresh" width="75" height="23"/>
			  <Image url="png.comp.bg2" width="139" height="180" sizeGrid="3,5,3,5" x="10" y="51"/>
			  <Button skin="png.comp.btn_close" x="262" y="0" var="btnClose"/>
			  <Label text="点餐猫" x="6" y="4" color="0xffffff" stroke="0x333333" mouseChildren="false" mouseEnabled="false"/>
			  <Label text="今日候选菜式：" x="8" y="30"/>
			  <List x="12" y="55" repeatY="9" var="lsb">
			    <Box name="render">
			      <Clip url="png.comp.clip_selectBox" clipX="1" clipY="2" name="selectBox" visible="false" x="0" y="0" width="114" height="20"/>
			      <Label text="番茄炒蛋" name="lsbTxt"/>
			    </Box>
			    <VScrollBar skin="png.comp.vscroll" x="116" width="17" height="173" name="scrollbar"/>
			  </List>
			  <Label text="点餐人姓名：" x="157" y="56"/>
			  <TextInput text="逗逼" skin="png.comp.textinput" x="157" y="80" width="133" height="22" margin="2,1" var="tiName"/>
			  <Button label="提交订单" skin="png.comp.button" x="213" y="237" toolTip="重复提交以最后一次为准" var="btn_order"/>
			  <Label text="您选择的是：" x="157" y="110"/>
			  <Label text="番茄炒蛋" x="157" y="131" var="labSelected" color="0xff0000"/>
			  <Button label="查看今日统计" skin="png.comp.button" x="210" y="204" toolTip="看看其他人点了什么菜" var="btnLook"/>
			  <Statistics x="-283" y="32" var="statistics" runtime="com.tbs.ordercat.view.Statistics"/>
			</View>;
		public function MainUIUI(){}
		override protected function createChildren():void {
			viewClassMap["com.tbs.ordercat.view.Statistics"] = Statistics;
			createView(uiXML);
		}
	}
}