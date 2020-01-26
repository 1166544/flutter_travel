import 'package:flutter/material.dart';
import 'package:flutter_travel/core/bloc/BlocProvider.dart';
import 'package:flutter_travel/modules/common/CommonNavigator.dart';
import 'package:flutter_travel/modules/common/CommonTravelItem.dart';
import 'package:flutter_travel/modules/home/blocs/BlocNewsList.dart';
import 'package:flutter_travel/modules/home/models/ModelNewsItem.dart';
import 'package:flutter_travel/modules/home/models/ModelsNewsList.dart';
import 'package:flutter_travel/modules/home/views/compnents/ComponentGrid.dart';
import 'package:flutter_travel/modules/home/views/compnents/ComponentImproving.dart';
import 'package:flutter_travel/modules/home/views/compnents/ComponentList.dart';
import 'package:flutter_travel/modules/home/views/compnents/ComponentScroll.dart';
import 'package:flutter_travel/modules/home/views/compnents/ComponentSearchBar.dart';
import 'package:flutter_travel/modules/home/views/compnents/ComponentTitle.dart';
import 'package:flutter_travel/modules/home/views/pages/PageSearchResult.dart';

/// 资讯显示列表
class PageDisplay extends StatefulWidget {
	
	final dynamic requestParams;

  	PageDisplay({ Key key, @required this.requestParams}) : super(key: key);

	_PageDisplayState createState() => _PageDisplayState();
}

class _PageDisplayState extends State<PageDisplay> with CommonTravelItem, CommonNavigator {
  
	BlocNewsList blocGalleryList;
	bool isInited = false;
	bool hasMore = false;
	bool isPullup = false;

	GlobalKey<RefreshIndicatorState> refreshKey = GlobalKey<RefreshIndicatorState>();

	/// 渲染列表
	List<ModelNewsItem> renderListData = [];
	List<ModelNewsItem> coverList = [];
	List<ModelNewsItem> experienceList = [];

	ScrollController _controller = new ScrollController();

	_PageDisplayState(): super();
	
	@override
	void initState() {
		super.initState();

		// 添加监听
		this._controller.addListener(() {
			if (this._controller.position.pixels == this._controller.position.maxScrollExtent) {
				// 最后一页数据位置生成新的数据添加到LIST列表里
				// if (this.hasMore) {
				// 	this.retriveData();
				// }
			}
		});
	}

	@override
	void dispose() {
		this._controller.dispose();
		this.blocGalleryList.dispose();
		super.dispose();
	}

	@override
	Widget build(BuildContext context) {
		this.blocGalleryList = BlocProvider.of<BlocNewsList>(context);

		// 连接数据源
		if (!this.isInited) {
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

		// 连接视图，下拉刷新
		return RefreshIndicator(
			key: this.refreshKey,
			color: Colors.grey.withOpacity(0.5),
			child: this.getStreamBuilder(context),
			onRefresh: this.refreshData,
		);
	}

	/// 下拉刷新调用
	Future<Null> refreshData() async {
		this.isPullup = false;
		await this.blocGalleryList.update();
	}

	/// 点击加载更多
	Future<Null> retriveData() async {
		this.isPullup = true;
		await this.refreshData();
	}

	/// 连接stream数据源
	Widget getStreamBuilder(BuildContext context) {
		return StreamBuilder<ModelsNewsList>(
			stream: this.blocGalleryList.outGallery,
			builder: (context, snapshot) {
				// 数据源到位时渲染列表
				if (snapshot.hasData) {
					// 已初始化标记,在第1次收到数据之后设置
					this.isInited = true;
					return this.buildLayout(snapshot);
				} else {
					return this.buildEmptyLayout(context);
				}
			}
		);
	}

	/// 构建外观
	Widget buildLayout(AsyncSnapshot<ModelsNewsList> snapshot) {

		// 是否为最后一页
		this.hasMore = snapshot.data.hasmore;

		// 区别上拉增加，下拉刷新时清除原有数据
		if (!this.isPullup) {
			this.experienceList = [];
			this.coverList = [];
			this.renderListData = [];
		}

		List<ModelNewsItem> snapshotList = snapshot.data.news;
		int count = snapshot.data.news.length;
		
		// 数据分层
		for (var i = 0; i < count; i++) {
			ModelNewsItem item = snapshotList[i]; 
			if (item.imageurls.length > 0 && this.experienceList.length < 10) {
				this.experienceList.add(item);
			} else if (item.imageurls.length >= 1 && this.coverList.length < 5) {
				this.coverList.add(item);
			} else {
				this.renderListData.add(item);
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

		// 第四行(动态增长)标题
		renderList.add(Text('My Newsleeters', style:TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontFamily: 'Montserrat')));
		renderList.add(SizedBox(height: 10.0));
		renderList.add(this.getDynamicList(snapshotList));

		return ListView(
			controller: this._controller,
			padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
			children: renderList,
		);
	}

	/// 动态增长列表
	Widget getDynamicList(List<ModelNewsItem> snapshotList) {
		return ListView.separated(
			physics: BouncingScrollPhysics(),	// 禁用滑动事件
			shrinkWrap: true,							// 无限高度兼容
			itemBuilder: (context, index) {
				if (index == this.renderListData.length) {
					if (this.hasMore) {
						return GestureDetector(
							child: this.getLoadMoreItem(),
							onTap: this.retriveData,
						);
					} else {
						return this.getNoMoreItem();
					}
				} else {
					return ComponentGrid(this.renderListData[index]);
				}
			},
			separatorBuilder: (context, index) {
				return SizedBox(height: 5.0);
			},
			itemCount: this.renderListData.length + 1,
		);
	}
}