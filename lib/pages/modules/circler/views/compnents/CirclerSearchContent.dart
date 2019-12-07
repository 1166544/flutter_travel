import 'package:flutter/material.dart';
import 'package:flutter_travel/core/bloc/BlocProvider.dart';
import 'package:flutter_travel/pages/common/CommonLoading.dart';
import 'package:flutter_travel/pages/common/CommonTravelItem.dart';
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
					this.getSearchBarForm(title: this._searchContent)
				],
			),
		);
	}

	/// 返回搜索条结构
	Widget getSearchBarForm({String title}) {
		return Form(
			key: formKey,
			child: Padding(
				padding: EdgeInsets.fromLTRB(10.0, 25.0, 10.0, 3.0),
				child: Row(
					children: <Widget>[
						Expanded(
							flex: 8,
							child: TextFormField(
								textAlign: TextAlign.left,
								style: TextStyle(fontSize: 12.0, color: Colors.black),
								keyboardType: TextInputType.text,
								controller: TextEditingController.fromValue(
									TextEditingValue(text: '${title == null ? "" : title}')
								),
								decoration: InputDecoration(
									fillColor: Color(0xFFe4e9f5),
									filled: true,
									labelText: 'Search',
									labelStyle: TextStyle(color: Colors.grey, fontSize: 15.0),
									prefixIcon: Container(
										child: Icon(Icons.search, color: Colors.black.withOpacity(0.6), size: 26.0),
									),
									border: InputBorder.none,
								),
								validator: (val) => val.isEmpty ? 'Please enter keywords.' : null,
								onSaved: (val) => this._searchContent = val,
							)
						),
						Expanded(
							child: IconButton(
								icon:Icon(Icons.airplay),
								color: Colors.black,
								iconSize: 30.0,
								onPressed: (){
									this.submit();
								}
							),
						),
				],
			),
		),
		);
	}
}
