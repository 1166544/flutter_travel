import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_travel/core/bloc/BlocProvider.dart';
import 'package:flutter_travel/pages/common/CommonGalleryItem.dart';
import 'package:flutter_travel/pages/common/CommonLoading.dart';
import 'package:flutter_travel/pages/common/CommonTravelItem.dart';
import 'package:flutter_travel/pages/modules/search/blocs/SearchBlocGalleryList.dart';
import 'package:flutter_travel/pages/modules/search/models/SearchModelGallery.dart';
import 'package:flutter_travel/pages/utils/Utils.dart';

/// 搜索模块视图
class ViewSearchContent extends StatefulWidget {
  ViewSearchContent({Key key}) : super(key: key);

  _ViewSearchContentState createState() => _ViewSearchContentState();
}

class _ViewSearchContentState extends State<ViewSearchContent> with CommonTravelItem {

	BlocGalleryList blocGalleryList;
	GlobalKey<RefreshIndicatorState> refreshKey = GlobalKey<RefreshIndicatorState>();

	@override
	Widget build(BuildContext context) {
		// 连接数据源
		this.blocGalleryList = BlocProvider.of<BlocGalleryList>(context);

		// 连接视图, 加上下拉刷新
		return RefreshIndicator(
			key: refreshKey,
			color: Colors.lightBlue,
			child: this.getStreamBuilder(context),
			onRefresh: refreshData,
		);
	}

	/// 更新视图
	Future<Null> refreshData() async {
		await this.blocGalleryList.update();
	}

	/// 连接stream数据源
	Widget getStreamBuilder(BuildContext context) {
		return StreamBuilder<ModelGallery>(
			stream: this.blocGalleryList.outGallery,
			builder: (context, snapshot) {
				// 数据源到位时渲染列表
				if (snapshot.hasData) {
					return this.buildSearchLayout(snapshot);
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
	Widget buildSearchLayout(AsyncSnapshot<ModelGallery> snapshot) {
		return ListView.builder(
			itemCount: snapshot.data.list.length,
			itemBuilder: (context, i) {
				return this.buildListItem(
					snapshot.data.list[i],
					i,
					snapshot.data.list.length
				);
			},
		);
	}

	/// 创建动态泻染列表
	/// * [ModelGalleryItem item] 单项数据源
	/// * [int index] 列表顺序
	/// * [int total] 列表总长度
	Widget buildListItem(ModelGalleryItem item, int index, int total) {

		// Mock data in real world it will be replaced.
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

		int min = 1;
		int max = 10;
		var rnd = new Random();
		var rndNum = min + rnd.nextInt(max - min);
		var ranTitle = item.body;
		var ranTitleLength = ranTitle.length < 10 ? ranTitle.length : 10;
		var ranPreTitle = ranTitle.substring(rndNum, rndNum + ranTitleLength);

		ranPreTitle = Utils.toUppercase(ranPreTitle);
		ranTitleLength = ranTitle.length < rndNum ? ranTitle.length : rndNum;

		var ranNextTitle = ranTitle.substring(0, ranTitleLength);
		var imageList = rndNum > 5 ? list2 : list1;
		// print('print list:::::::${item.keys} ${item.values}');
		// flutter: print list:::::::(userId, id, title, body)
		// (10, 100, at nam consequatur ea labore ea harum, cupiditate quo est a modi nesciunt soluta

		List<Widget> displayList = [];

		// 开始部份
		if (index == 0) {
			displayList.add(
				this.buildMarkTitle()
			);
			displayList.add(
				this.buildStartIcon())
			;
		}

		// 中间部份
		displayList.add(
			this.buildTravelDate(Utils.toUppercase(item.title))
		);
		displayList.add(
			this.buildTravelSep()
		);
		displayList.add(
			this.buildImageGrid(context, imageList, paddingTop: 0.0)
		);
		displayList.add(
			this.buildImgGalleryDetail(context, '$ranPreTitle - $ranNextTitle', Utils.toUppercase(ranTitle), '')
		);

		// 尾部
		bool hideSepBar = index == total;
		if (!hideSepBar) {
			displayList.add(SizedBox(height: 45.0));
		}

		return Container(
			width: MediaQuery.of(context).size.width,
			color: Colors.white,
			child: Column(
				children: displayList,
			)
		);
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
