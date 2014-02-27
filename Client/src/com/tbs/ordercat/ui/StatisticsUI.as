/**Created by the Morn,do not modify.*/
package com.tbs.ordercat.ui {
	import morn.core.components.*;
	public class StatisticsUI extends View {
		public var palette:Image;
		public var btnClose:Button;
		public var btnRefresh:Button;
		public var lsb:List;
		protected var uiXML:XML =
			<View>
			  <Image url="png.comp.bg2" width="282" height="230" sizeGrid="3,5,3,5"/>
			  <Image y="117" width="160" height="109" var="palette" rotationX="60" x="87"/>
			  <Label text="今日点餐统计：" x="7" y="8"/>
			  <Button label="关闭" skin="png.comp.button" x="202" y="202" var="btnClose" width="75" height="23"/>
			  <Button label="刷新" skin="png.comp.button" x="120" y="202" var="btnRefresh" width="75" height="23"/>
			  <List x="167" y="67" var="lsb" repeatY="5">
			    <Box name="render">
			      <Label text="番茄炒蛋" name="lab"/>
			    </Box>
			  </List>
			</View>;
		public function StatisticsUI(){}
		override protected function createChildren():void {
			createView(uiXML);
		}
	}
}