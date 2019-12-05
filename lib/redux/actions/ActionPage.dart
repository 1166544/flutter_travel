
import 'package:flutter/material.dart';
import 'package:flutter_travel/redux/states/StateApp.dart';
import 'package:redux/redux.dart';

/// TAB页面标题更新
class ActionPageUpdate {
	final String title;

	ActionPageUpdate(this.title);
}

/// 封装更新事件
final Function updatePage = (BuildContext context, String title) {
	return (Store<AppState> store) {
		store.dispatch(ActionPageUpdate(title));
	};
};