import 'package:flutter/material.dart';
import 'package:flutter_travel/core/bloc/BlocProvider.dart';
import 'package:flutter_travel/pages/common/CommonLoading.dart';
import 'package:flutter_travel/pages/common/CommonTravelItem.dart';
import 'package:flutter_travel/pages/modules/circler/blocs/CirclerBlocNewsList.dart';
import 'package:flutter_travel/pages/modules/circler/models/CirclerModelNewsItem.dart';
import 'package:flutter_travel/pages/modules/circler/models/CirclerModelsNewsList.dart';
import 'package:flutter_travel/pages/modules/circler/views/CiclerImproving.dart';
import 'package:flutter_travel/pages/modules/circler/views/CircleTitle.dart';
import 'package:flutter_travel/pages/modules/circler/views/CirclerGrid.dart';
import 'package:flutter_travel/pages/modules/circler/views/CirclerList.dart';
import 'package:flutter_travel/pages/modules/circler/views/CirclerScroll.dart';
import 'package:flutter_travel/pages/modules/circler/views/CirclerSearchBar.dart';

/// 资讯显示列表
class CirclerDisplayPage extends StatefulWidget {
  CirclerDisplayPage({Key key}) : super(key: key);

  _CirclerDisplayPageState createState() => _CirclerDisplayPageState();
}

class _CirclerDisplayPageState extends State<CirclerDisplayPage> with CommonTravelItem {
  
	CirclerBlocNewsList blocGalleryList;
	GlobalKey<RefreshIndicatorState> refreshKey = GlobalKey<RefreshIndicatorState>();

	@override
	Widget build(BuildContext context) {
		// 连接数据源
		this.blocGalleryList = BlocProvider.of<CirclerBlocNewsList>(context);

		// 连接视图，下拉刷新
		return RefreshIndicator(
			key: this.refreshKey,
			color: Colors.grey.withOpacity(0.5),
			child: this.getStreamBuilder(context),
			onRefresh: this.refreshData,
		);
	}

	Future<Null> refreshData() async {
		await this.blocGalleryList.update();
	}

	/// 连接stream数据源
	Widget getStreamBuilder(BuildContext context) {
		return StreamBuilder<CirclerModelsNewsList>(
			stream: this.blocGalleryList.outGallery,
			builder: (context, snapshot) {
				// 数据源到位时渲染列表
				if (snapshot.hasData) {
					return this.buildLayout(snapshot);
				} else {
					return this.buildEmptyLayout(context);
				}
			}
		);
	}

	/// 空数据结构提示
	Widget buildEmptyLayout(BuildContext context) {
		return new CommonLoading();
	}

	/// 构建外观
	Widget buildLayout(AsyncSnapshot<CirclerModelsNewsList> snapshot) {
		List<CirclerModelNewsItem> snapshotList = snapshot.data.news;
		List<CirclerModelNewsItem> coverList = [];
		List<CirclerModelNewsItem> experienceList = [];
		List<CirclerModelNewsItem> newsLetter = [];
		
		// 数据分层
		while (snapshotList.length != 0) {
			CirclerModelNewsItem item = snapshotList.removeLast(); 

			if (coverList.length < 5) {
				if (item.imageurls.length >= 1) {
					coverList.add(item);
				}
			} else {
				if (experienceList.length < 10) {
					experienceList.add(item);
				} else {
					newsLetter.add(item);
				}
			}
		}

		return ListView(
			padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
			children: <Widget>[
			// 封面
			// CirclerCover(),

			// 搜索条
			CirclerSearchBar(snapshot),

			// 改进提示
			CircleImproving(snapshot),

			// 第1行
			CircleTitle(snapshot),

			// 第2行 横向滚动列表
			CirclerScroll(coverList),

			// 第3行
			CirclerList(experienceList),

			// 第四行
			CirclerGrid(newsLetter),
			
			],
		);
	}
}