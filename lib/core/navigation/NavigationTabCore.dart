import 'package:flutter/material.dart';
import 'package:flutter_travel/core/navigation/NavigationTabCoreState.dart';
import 'package:flutter_travel/redux/states/StateGlobal.dart';
import 'package:redux/redux.dart';

/// 底部TAB按钮入口类
class NavigationTabCore extends StatefulWidget {
	final Store<StateGlobal> store;
	NavigationTabCore({Key key, this.store}) : super(key: key);

	@override
	State<StatefulWidget> createState() => NavigationTabCoreState(this.store);
}
