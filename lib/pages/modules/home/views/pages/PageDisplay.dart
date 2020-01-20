import 'package:flutter/material.dart';
import 'package:flutter_travel/core/bloc/BlocProvider.dart';
import 'package:flutter_travel/pages/common/CommonNavigator.dart';
import 'package:flutter_travel/pages/common/CommonTravelItem.dart';
import 'package:flutter_travel/pages/modules/home/blocs/BlocNewsList.dart';
import 'package:flutter_travel/pages/modules/home/models/ModelNewsItem.dart';
import 'package:flutter_travel/pages/modules/home/models/ModelsNewsList.dart';
import 'package:flutter_travel/pages/modules/home/views/compnents/ComponentGrid.dart';
import 'package:flutter_travel/pages/modules/home/views/compnents/ComponentImproving.dart';
import 'package:flutter_travel/pages/modules/home/views/compnents/ComponentList.dart';
import 'package:flutter_travel/pages/modules/home/views/compnents/ComponentScroll.dart';
import 'package:flutter_travel/pages/modules/home/views/compnents/ComponentSearchBar.dart';
import 'package:flutter_travel/pages/modules/home/views/compnents/ComponentTitle.dart';
import 'package:flutter_travel/pages/modules/home/views/pages/PageSearchResult.dart';

/// 资讯显示列表
class PageDisplay extends StatefulWidget {
	
	final dynamic requestParams;

  	PageDisplay({ Key key, @required this.requestParams}) : super(key: key);

	_PageDisplayState createState() => _PageDisplayState();
}

class _PageDisplayState extends State<PageDisplay> with CommonTravelItem, CommonNavigator {
  
	BlocNewsList blocGalleryList;
	bool _isInited = false;
	bool _isPullup = false;
	GlobalKey<RefreshIndicatorState> refreshKey = GlobalKey<RefreshIndicatorState>();

	_PageDisplayState(): super();

	@override
	Widget build(BuildContext context) {
		this.blocGalleryList = BlocProvider.of<BlocNewsList>(context);

		// 连接数据源
		if (!this._isInited) {
			this.blocGalleryList.updateParams({
				'from': 'news_webapp',
				'pd': 'webapp',
				'os': 'iphone',
				'ver': 6,
				'category_id': 101,
				'action': 0,
				'wf': 0
			});
		}

		// 已初始化标记
		this._isInited = true;

		// 连接视图，下拉刷新
		return RefreshIndicator(
			key: this.refreshKey,
			color: Colors.grey.withOpacity(0.5),
			child: this.getStreamBuilder(context),
			onRefresh: this.refreshData,
		);
	}

	@override
	void dispose() {
		super.dispose();
		this.blocGalleryList.dispose();
	}

	Future<Null> refreshData() async {
		await this.blocGalleryList.update();
	}

	/// 连接stream数据源
	Widget getStreamBuilder(BuildContext context) {
		return StreamBuilder<ModelsNewsList>(
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

	/// 构建外观
	Widget buildLayout(AsyncSnapshot<ModelsNewsList> snapshot) {

		// 上拉增加，下拉刷新

		List<ModelNewsItem> snapshotList = snapshot.data.news;
		int count = snapshotList.length;
		List<ModelNewsItem> coverList = [];
		List<ModelNewsItem> experienceList = [];
		List<ModelNewsItem> newsLetter = [];
		
		// 数据分层
		for (var i = 0; i < count; i++) {
			ModelNewsItem item = snapshotList[i]; 
			if (item.imageurls.length > 0 && experienceList.length < 10) {
				experienceList.add(item);
			} else if (item.imageurls.length >= 1 && coverList.length < 5) {
				coverList.add(item);
			} else {
				newsLetter.add(item);
			}
		}

		List<Widget> renderList = [
			// 搜索条
			ComponentSearchBar(callBack: (val) => {
				this.navigateTo(context, PageSearchResult(searchContent: val))
			}),

			// 改进提示
			ComponentImproving(snapshot),
		];

		// 第2行 横向滚动列表
		if (coverList.length > 0) {
			renderList.add(ComponentTitle(snapshot));
			renderList.add(ComponentScroll(coverList));
		}

		// 第3行
		if (experienceList.length > 0) {
			renderList.add(ComponentList(experienceList));
		}

		// 第四行
		if (newsLetter.length > 0) {
			renderList.add(ComponentGrid(newsLetter));
		}

		return ListView(
			padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
			children: renderList,
		);
	}
}