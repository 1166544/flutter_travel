import 'package:flutter/material.dart';
import 'package:flutter_travel/modules/search/views/components/ComponentHotSearch.dart';
import 'package:flutter_travel/modules/search/views/components/ComponentHotSearchBar.dart';
import 'package:flutter_travel/modules/search/views/components/ComponentHotTypeList.dart';
import 'package:flutter_travel/modules/search/views/components/ComponentSearchFocus.dart';
import 'package:flutter_travel/modules/search/views/components/ComponentSearchList.dart';
import 'package:flutter_travel/modules/search/views/components/ComponentSearchType.dart';

/// 页面结构
class ComponentSearchStructs extends StatefulWidget {
	ComponentSearchStructs({Key key}) : super(key: key);

	_ComponentSearchStructsState createState() => _ComponentSearchStructsState();
}

class _ComponentSearchStructsState extends State<ComponentSearchStructs> {
	@override
	Widget build(BuildContext context) {
		return Stack(
			children: [
				// 上层 搜索条
				ComponentHotSearchBar(),

				// 下层列表
				Padding(
					padding: EdgeInsets.fromLTRB(0, 69, 0, 0),
					child: ListView(
						children: [
							// 热搜文字列表
							ComponentHotSearch(),

							// 分类
							ComponentSearchType(),

							// 头条
							ComponentSearchFocus(),

							// 热门TAB
							ComponentHotTypeList(),

							// 长列表
							ComponentSearchList()
						]
					),
				)
			]
		);
	}
}