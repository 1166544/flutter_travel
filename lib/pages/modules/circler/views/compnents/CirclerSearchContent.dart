import 'package:flutter/material.dart';
import 'package:flutter_travel/core/bloc/BlocProvider.dart';
import 'package:flutter_travel/pages/common/CommonLoading.dart';
import 'package:flutter_travel/pages/common/CommonTravelItem.dart';
import 'package:flutter_travel/pages/modules/circler/views/compnents/CirclerSearchBar.dart';
import 'package:flutter_travel/pages/modules/graphics/blocs/GraphicsBlocMyInfo.dart';
import 'package:flutter_travel/pages/modules/graphics/models/GraphicsBlocModel.dart';

/// 搜索强结果视图
class CirclerSearchContent extends StatefulWidget {
	final String searchContent;
  	CirclerSearchContent({Key key, this.searchContent}) : super(key: key);

  _CirclerSearchContentState createState() => _CirclerSearchContentState(this.searchContent);
}

class _CirclerSearchContentState extends State<CirclerSearchContent> with CommonTravelItem {
	String _searchContent;
	GraphicsBlocMyInfo blocGalleryList;
	final formKey = GlobalKey<FormState>();

	_CirclerSearchContentState(String searchContent) {
		this._searchContent = searchContent;
	}

	@override
	Widget build(BuildContext context) {
		// 连接数据源
		this.blocGalleryList = BlocProvider.of<GraphicsBlocMyInfo>(context);
		// this.blocGalleryList.updateParams(this._searchContent);

		return this.getStreamBuilder(context);
	}

	/// 提交搜索内容刷新本页
	void submit() {
		// hole
	}

	/// 连接stream数据源
	Widget getStreamBuilder(BuildContext context) {
		return StreamBuilder<GraphicsBlocModel>(
			stream: this.blocGalleryList.outGallery,
			builder: (context, snapshot) {
				return this.buildSearchLayout(snapshot);

				// 数据源到位时渲染列表
				// if (snapshot.hasData) {
				// 	return this.buildSearchLayout(snapshot);
				// } else {
				// 	return this.buildEmptyLayout(context);
				// }
			},
		);
	}

	/// 空数据结构提示
	Widget buildEmptyLayout(BuildContext context) {
		return new CommonLoading();
	}

	/// 基础页面结构
	Widget buildSearchLayout(AsyncSnapshot<GraphicsBlocModel> snapshot) {
		return Container(
			child: Column(
				children: <Widget>[
					// 搜索条
					CirclerSearchBar(content: this._searchContent, callBack: (val) => {
						print(val)
					}),
					// 搜索结果列表

				],
			),
		);
	}

}
