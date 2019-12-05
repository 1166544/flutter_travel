import 'package:flutter_travel/redux/actions/ActionPage.dart';
import 'package:flutter_travel/redux/states/StatePage.dart';
import 'package:redux/redux.dart';

/// 合并Reducer
Reducer<StatePage> pageReducer = combineReducers([
	TypedReducer<StatePage, ActionPageUpdate>(pageUpdateReducer),
]);

/// 页面标题更改Reducer
StatePage pageUpdateReducer(StatePage page, ActionPageUpdate action) {
	return page.copyWith(
		title: action.title
	);
}