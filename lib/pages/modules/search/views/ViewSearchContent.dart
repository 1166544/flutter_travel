import 'package:flutter/material.dart';
import 'package:flutter_travel/core/bloc/BlocProvider.dart';
import 'package:flutter_travel/pages/common/CommonGalleryItem.dart';
import 'package:flutter_travel/pages/common/CommonTravelItem.dart';
import 'package:flutter_travel/pages/modules/search/blocs/BlocGalleryList.dart';
import 'package:flutter_travel/pages/modules/search/models/ModelGallery.dart';

/// 搜索模块视图
class ViewSearchContent extends StatefulWidget {
  ViewSearchContent({Key key}) : super(key: key);

  _ViewSearchContentState createState() => _ViewSearchContentState();
}

class _ViewSearchContentState extends State<ViewSearchContent> with CommonTravelItem {

	BlocGalleryList blocGalleryList;

	@override
	Widget build(BuildContext context) {
		// 连接数据源
		this.blocGalleryList = BlocProvider.of<BlocGalleryList>(context);

		// 连接视图
		return StreamBuilder<ModelGallery>(
			stream: this.blocGalleryList.outGallery,
			builder: (context, snapshot) {
				if (snapshot.hasData) {
					// 数据源到位时渲染列表
					return this.buildSearchLayout(snapshot);
				} else {
					return this.buildEmptyLayout(context);
				}
			},
		);
	}

	/// 空数据结构提示
	Widget buildEmptyLayout(BuildContext context) {
		return Column(
			mainAxisAlignment: MainAxisAlignment.center,
			crossAxisAlignment: CrossAxisAlignment.center,
			children: [
				Container(
					width: MediaQuery.of(context).size.width,
					child: Text(
						'加载中...',
						textAlign: TextAlign.center,
					),
				)
			],
		);
	}

	/// 基础页面结构
	Widget buildSearchLayout(AsyncSnapshot<ModelGallery> snapshot) {
		List<CommonGalleryItem> list1 = [
		CommonGalleryItem(
			id: 0.toString(), image: 'assets/p1.jpg', description: 'Sun Bath'),
		CommonGalleryItem(
			id: 1.toString(),
			image: 'assets/beach5.jpg',
			description: 'Blue oceans'),
		CommonGalleryItem(
			id: 2.toString(),
			image: 'assets/p2.jpg',
			description: 'Mihiri Island.'),
		];

		List<CommonGalleryItem> list2 = [
		CommonGalleryItem(
			id: 0.toString(),
			image: 'assets/p3.jpg',
			description: 'The Sun Raise'),
		CommonGalleryItem(
			id: 1.toString(),
			image: 'assets/p5.jpg',
			description: 'Tiland buject'),
		CommonGalleryItem(
			id: 2.toString(),
			image: 'assets/p6.jpg',
			description: 'Beach Baros.'),
		];

		return Container(
			width: MediaQuery.of(context).size.width,
			color: Colors.white,
			child: ListView(
			children: <Widget>[
				this.buildMarkTitle(),
				this.buildStartIcon(),
				this.buildTravelDate('Aug 12, 2012 - Baros Island ${snapshot.data.name}'),
				this.buildTravelSep(),
				this.buildImageGrid(context, list1, paddingTop: 0.0),
				this.buildImgGalleryDetail(
					context, 'Day 1- Sun Bath', 'Teresa Soto', ''),
				SizedBox(height: 45.0),
				this.buildTravelDate('Aug 13, 2012 - Mihiri Island'),
				this.buildTravelSep(),
				this.buildImageGrid(context, list2, paddingTop: 0.0),
				this.buildImgGalleryDetail(
					context, 'Day 2- Sun Raise', 'Tiland buject', ''),
			],
		));
	}

	/// 顶部标题
	Widget buildMarkTitle() {
		return Container(
			width: MediaQuery.of(context).size.width,
			child: Text(
			'Mark, 4 Others',
			textAlign: TextAlign.center,
			style: TextStyle(
					fontSize: 17.0,
					color: Colors.black.withOpacity(0.7)
				),
			)
		);
	}

	/// 构建START图标
	Widget buildStartIcon() {
		return Padding(
			padding: EdgeInsets.all(7.0),
			child: Image.asset('assets/start.png', width: 150.0, height: 150.0)
		);
	}

	/// 旅行日志时间
	Widget buildTravelDate(String travelTitle) {
		return Text(
			travelTitle,
			textAlign: TextAlign.center,
			style: TextStyle(color: Colors.black.withOpacity(0.8))
		);
	}

	/// 旅行日志分隔
	Widget buildTravelSep() {
		return Image.asset(
			'assets/dot.png',
			width: 10.0,
			height: 80.0
		);
	}
}
