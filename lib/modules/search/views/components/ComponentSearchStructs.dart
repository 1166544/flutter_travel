import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_travel/modules/search/views/components/ComponentHotSearch.dart';
import 'package:flutter_travel/modules/search/views/components/ComponentHotSearchBar.dart';
import 'package:flutter_travel/modules/search/views/components/ComponentHotTypeList.dart';
import 'package:flutter_travel/modules/search/views/components/ComponentSearchFocus.dart';
import 'package:flutter_travel/modules/search/views/components/ComponentSearchType.dart';
import 'package:flutter_travel/modules/common/CommonText.dart';

/// 页面结构
class ComponentSearchStructs extends StatefulWidget {
	ComponentSearchStructs({Key key}) : super(key: key);

	_ComponentSearchStructsState createState() => _ComponentSearchStructsState();
}

class _ComponentSearchStructsState extends State<ComponentSearchStructs> {
	@override
	Widget build(BuildContext context) {
		List<Widget> renderList = [
			// 热搜文字列表
			ComponentHotSearch(),

			// 分类
			ComponentSearchType(),

			// 头条
			ComponentSearchFocus(),

			// 热门TAB
			ComponentHotTypeList(),

			// 长列表
			this.getDynamicList()
		];

		return Stack(
			children: [

				// 下层列表
				ListView.builder(
					padding: EdgeInsets.fromLTRB(0, 69, 0, 0),
					itemCount: renderList.length,
					itemBuilder: (BuildContext context, int index) {
						return AnimationConfiguration.staggeredList(
							position: index, 
							duration: Duration(milliseconds: 375),
							child: SlideAnimation(
								verticalOffset: 50.0,
								child: FadeInAnimation(child: renderList[index])
							)
						);
					}
				),

				// 上层 搜索条
				ComponentHotSearchBar(),
			]
		);
	}

	/// 动态增长列表
	Widget getDynamicList() {
		return ListView.separated(
			padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
			physics: BouncingScrollPhysics(),	// 禁用滑动事件
			shrinkWrap: true,					// 无限高度兼容
			itemBuilder: (context, index) {
				return CommonText('data');
			},
			separatorBuilder: (context, index) {
				return SizedBox(height: 5.0);
			},
			itemCount: 5,
		);
	}
}