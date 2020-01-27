import 'package:flutter/material.dart';
import 'package:flutter_travel/core/navigation/NavigationTabCoreState.dart';
import 'package:flutter_travel/core/navigation/NavigationTabItem.dart';

/// 底部TAB按钮入口类
class NavigationTabCore extends StatefulWidget {
	final NavigationTabItem selecteItem;
	
	NavigationTabCore({Key key, this.selecteItem}) : super(key: key);

	@override
	State<StatefulWidget> createState() {
		return NavigationTabCoreState();
	}
}
