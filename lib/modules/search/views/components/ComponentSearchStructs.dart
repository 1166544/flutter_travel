import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_travel/core/bloc/BlocProvider.dart';
import 'package:flutter_travel/modules/common/CommonTravelItem.dart';
import 'package:flutter_travel/modules/search/blocs/BlocSearchList.dart';
import 'package:flutter_travel/modules/search/models/ModelSearchList.dart';
import 'package:flutter_travel/modules/search/models/model-container/ModelSearchCards.dart';
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

class _ComponentSearchStructsState extends State<ComponentSearchStructs> with CommonTravelItem {

	BlocSearchList blocSearchList;
	GlobalKey<RefreshIndicatorState> refreshKey = GlobalKey<RefreshIndicatorState>();

	@override
	void initState() {
		super.initState();
	}

	@override
	void dispose() {
		this.blocSearchList.dispose();
		super.dispose();
	}

	@override
	Widget build(BuildContext context) {
		// 连接bloc
		this.blocSearchList = BlocProvider.of<BlocSearchList>(context);

		// 调用数据
		this.blocSearchList.init();

		return RefreshIndicator(
			key: refreshKey,
			color: Colors.lightBlue,
			child: this.getStreamBuilder(context), 
			onRefresh: this.refreshData
		);
	}

	/// 刷新
	Future<Null> refreshData() async {
		await this.blocSearchList.init();
	}

	/// 连接stream数据源
	Widget getStreamBuilder(BuildContext context) {
		return StreamBuilder(
			stream: this.blocSearchList.outStream,
			builder: (context, snapshot) {
				if (snapshot.hasData) {
					return this.buildLayout(snapshot);
				} else {
					return this.buildEmptyLayout(context);
				}
			}
		);
	}

	/// 构建外观
	Widget buildLayout(AsyncSnapshot<ModelSearchList> snapshot) {
		List<Widget> renderList = [
			// 热搜文字列表
			ComponentHotSearch(list: this.blocSearchList.getHotList()),

			// 分类
			ComponentSearchType(pageConfig: this.blocSearchList.getPageConfig()),

			// 头条
			ComponentSearchFocus(list: this.blocSearchList.getFocusList()),

			// 热门TAB
			ComponentHotTypeList(list: this.blocSearchList.getHotTopicList()),

			SizedBox(height: 30),

			// 长列表
			this.getDynamicList(snapshot.data)
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
				ComponentHotSearchBar(pageConfig: this.blocSearchList.getPageConfig()),
			]
		);
	}

	/// 动态增长列表
	Widget getDynamicList(ModelSearchList listData) {
		List<ModelSearchCards> dynamicRenderList = this.blocSearchList.getDynamicRenderList();
		return ListView.separated(
			padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
			physics: BouncingScrollPhysics(),	// 禁用滑动事件
			shrinkWrap: true,					// 无限高度兼容
			itemBuilder: (context, index) {
				return ComponentSearchList(renderData: dynamicRenderList[index]);
			},
			separatorBuilder: (context, index) {
				return SizedBox(height: 5.0);
			},
			itemCount: dynamicRenderList.length,
		);
	}
}