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
	
	final dynamic requestParams;

  	CirclerDisplayPage({ Key key, @required this.requestParams}) : super(key: key);

	_CirclerDisplayPageState createState() => _CirclerDisplayPageState(this.requestParams);
}

class _CirclerDisplayPageState extends State<CirclerDisplayPage> with CommonTravelItem {
  
	CirclerBlocNewsList blocGalleryList;
	GlobalKey<RefreshIndicatorState> refreshKey = GlobalKey<RefreshIndicatorState>();
	dynamic _requestParms;

	_CirclerDisplayPageState(dynamic requestParams): super() {
		this._requestParms = requestParams;
	}

	@override
	Widget build(BuildContext context) {
		// 连接数据源
		this.blocGalleryList = BlocProvider.of<CirclerBlocNewsList>(context);
		this.blocGalleryList.updateParams(this._requestParms);

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
		int count = snapshotList.length;
		List<CirclerModelNewsItem> coverList = [];
		List<CirclerModelNewsItem> experienceList = [];
		List<CirclerModelNewsItem> newsLetter = [];
		
		// 数据分层
		for (var i = 0; i < count; i++) {
			CirclerModelNewsItem item = snapshotList[i]; 
			if (item.imageurls.length > 0 && experienceList.length < 10) {
				experienceList.add(item);
			} else if (item.imageurls.length >= 1 && coverList.length < 5) {
				coverList.add(item);
			} else {
				newsLetter.add(item);
			}
		}

		List<Widget> renderList = [
			// 封面
			// CirclerCover(),

			// 搜索条
			CirclerSearchBar(snapshot),

			// 改进提示
			CircleImproving(snapshot),
		];

		// 第2行 横向滚动列表
		if (coverList.length > 0) {
			renderList.add(CircleTitle(snapshot));
			renderList.add(CirclerScroll(coverList));
		}

		// 第3行
		if (experienceList.length > 0) {
			renderList.add(CirclerList(experienceList));
		}

		// 第四行
		if (newsLetter.length > 0) {
			renderList.add(CirclerGrid(newsLetter));
		}

		return ListView(
			padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
			children: renderList,
		);
	}
}