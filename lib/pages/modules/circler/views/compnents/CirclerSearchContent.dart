import 'package:flutter/material.dart';
import 'package:flutter_travel/core/bloc/BlocProvider.dart';
import 'package:flutter_travel/pages/common/CommonLoading.dart';
import 'package:flutter_travel/pages/common/CommonTravelItem.dart';
import 'package:flutter_travel/pages/modules/circler/blocs/CirclerBlocSearch.dart';
import 'package:flutter_travel/pages/modules/circler/models/CirclerModelSearch.dart';
import 'package:flutter_travel/pages/modules/circler/views/compnents/CircleSearchRender.dart';
import 'package:flutter_travel/pages/modules/circler/views/compnents/CirclerSearchBar.dart';

/// 搜索强结果视图
class CirclerSearchContent extends StatefulWidget {
	final String searchContent;
  	CirclerSearchContent({Key key, this.searchContent}) : super(key: key);

  _CirclerSearchContentState createState() => _CirclerSearchContentState(this.searchContent);
}

class _CirclerSearchContentState extends State<CirclerSearchContent> with CommonTravelItem {
	String _searchContent;
	CirclerBlocSearch blocGalleryList;
	final formKey = GlobalKey<FormState>();

	_CirclerSearchContentState(String searchContent) {
		this._searchContent = searchContent;
	}

	@override
	Widget build(BuildContext context) {
		// 连接数据源
		this.blocGalleryList = BlocProvider.of<CirclerBlocSearch>(context);
		this.blocGalleryList.updateParams(this._searchContent);

		return this.getStreamBuilder(context);
	}

	/// 提交搜索内容刷新本页
	void submit(String val) {
		this._searchContent = val;
		this.blocGalleryList.updateParams(this._searchContent);
	}

	/// 连接stream数据源
	Widget getStreamBuilder(BuildContext context) {
		return StreamBuilder<CirclerModelSearch>(
			stream: this.blocGalleryList.outGallery,
			builder: (context, snapshot) {
				// 数据源到位时渲染列表
				if (snapshot.hasData) {
					return this.buildSearchLayout(snapshot: snapshot);
				} else {
					return this.buildEmptyLayout(context);
				}
			},
		);
	}

	/// 空数据结构提示
	Widget buildEmptyLayout(BuildContext context) {
		return new CommonLoading();
	}

	/// 基础页面结构
	Widget buildSearchLayout({ AsyncSnapshot<CirclerModelSearch> snapshot }) {
		return Container(
			child: ListView(
				children: <Widget>[
					// 搜索条
					CirclerSearchBar(content: this._searchContent, callBack: (val) => {
						this.submit(val)
					}),
					// 搜索结果列表
					this.buildNotifcationList(snapshot: snapshot)
				],
			),
		);
	}

	/// 通知列表
	Widget buildNotifcationList({ AsyncSnapshot<CirclerModelSearch> snapshot }) {

		List<CircleModelSearchItem> list = snapshot.data.list;
		List<CircleSearchRender> renderList = [];

		for (var i = 0; i < list.length; i++) {
			CircleSearchRender render = new CircleSearchRender(snapData: list[i]);
			renderList.add(render);
		}

		return Column(
			children: renderList,
		);
	}

}
