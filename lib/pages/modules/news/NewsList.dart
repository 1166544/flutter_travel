import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_travel/pages/common/CommonNavigator.dart';
import 'package:flutter_travel/redux/states/StateGlobal.dart';

/// 资讯列表
class NewsList extends StatefulWidget {

	_NewsListState createState() => _NewsListState();
}

/// 资讯页面
class _NewsListState extends State<NewsList> with CommonNavigator {
	
	@override
	Widget build(BuildContext context) {
		return Column(
			children: <Widget>[
				// 搜索框
				// 装饰条
				// 头条列表
				// 非头条列表
			],
		);
	}

}
