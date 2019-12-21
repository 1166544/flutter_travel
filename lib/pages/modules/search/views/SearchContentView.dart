import 'package:flutter/material.dart';
import 'package:flutter_travel/core/bloc/BlocProvider.dart';
import 'package:flutter_travel/pages/common/CommonLoading.dart';
import 'package:flutter_travel/pages/common/CommonTravelItem.dart';
import 'package:flutter_travel/pages/modules/circler/blocs/CirclerBlocNewsList.dart';
import 'package:flutter_travel/pages/modules/circler/models/CirclerModelImage.dart';
import 'package:flutter_travel/pages/modules/circler/models/CirclerModelNewsItem.dart';
import 'package:flutter_travel/pages/modules/circler/models/CirclerModelsNewsList.dart';
import 'package:flutter_travel/pages/modules/search/views/SearchContentRender.dart';

/// 搜索模块视图
class ViewSearchContent extends StatefulWidget {
  ViewSearchContent({Key key}) : super(key: key);

  _ViewSearchContentState createState() => _ViewSearchContentState();
}

class _ViewSearchContentState extends State<ViewSearchContent> with CommonTravelItem {

	CirclerBlocNewsList blocGalleryList;
	GlobalKey<RefreshIndicatorState> refreshKey = GlobalKey<RefreshIndicatorState>();
	final formKey = GlobalKey<FormState>();
	ScrollController _controller = new ScrollController();
	List<CirclerModelNewsItem> renderListData = [];
	bool hasMore = false;

	@override
	void initState() {
		super.initState();

		// 添加监听
		this._controller.addListener(() {
			if (this._controller.position.pixels == this._controller.position.maxScrollExtent) {
				// 最后一页数据位置生成新的数据添加到LIST列表里
				if (this.hasMore) {
					this._retriveData();
				}
			}
		});
	}

	@override
	void dispose() {
		// 移除监听，防止内存泄漏
		this._controller.dispose();
		this.blocGalleryList.dispose();
		super.dispose();
	}

	void _retriveData() {
		this.blocGalleryList.update();
	}

	@override
	Widget build(BuildContext context) {
		// 连接数据源
		this.blocGalleryList = BlocProvider.of<CirclerBlocNewsList>(context);
		this.blocGalleryList.updateParamsByReset({
			'form': 'news_webapp',
			'pd': 'webapp',
			'os': 'iphone',
			'ver': 6,
			'category_name': '时尚',
			'category_id': '',
			'action': 0
		});

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
		return StreamBuilder<CirclerModelsNewsList>(
			stream: this.blocGalleryList.outGallery,
			builder: (context, snapshot) {
				// 数据源到位时渲染列表
				if (snapshot.hasData) {
					return this.buildLayout(snapshot);
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
	Widget buildLayout(AsyncSnapshot<CirclerModelsNewsList> snapshot) {

		List<CirclerModelNewsItem> list = snapshot.data.news;
		for (var i = 0; i < list.length; i++) {

			if (list[i].imageurls != null && list[i].imageurls.length >= 3) {
				this.renderListData.add(list[i]);
			}
		}

		// 是否为最后一页
		this.hasMore = snapshot.data.hasmore;

		return ListView.separated(
			controller: this._controller,
			physics: BouncingScrollPhysics(),
			shrinkWrap: true,
			itemBuilder: (context, index) {
				if (index == this.renderListData.length) {
					if (this.hasMore) {
						return this.getLoadingItem();
					} else {
						return this.getNoMoreItem();
					}
				} else {
					var item = this.rebuildImageUrls(this.renderListData[index]);

					return SearchContentRender(snapData: item, renderIndex: index);
				}
			},
			separatorBuilder: (context, index) {
				return this.buildTravelSep();
			},
			itemCount: this.renderListData.length + 1,
		);
	}

	// 补足缺失图片
	CirclerModelNewsItem rebuildImageUrls(CirclerModelNewsItem item) {
		var url1 = 'assets/beach1.jpg';
		var url2 = 'assets/beach2.jpg';
		var url3 = 'assets/beach3.jpg';
		if (item.imageurls == null || item.imageurls.length == 0) {
			CirclerModelImage subItem1 = new CirclerModelImage();
			CirclerModelImage subItem2 = new CirclerModelImage();
			CirclerModelImage subItem3 = new CirclerModelImage();

			subItem1.url = url1;
			subItem2.url = url2;
			subItem3.url = url3;

			item.imageurls = [
				subItem1,
				subItem2,
				subItem3,
			];
		}
		if (item.imageurls != null && item.imageurls.length == 1) {
			CirclerModelImage subItem1 = new CirclerModelImage();
			CirclerModelImage subItem2 = new CirclerModelImage();

			subItem1.url = url1;
			subItem2.url = url2;

			item.imageurls = [
				subItem1,
				subItem2,
			];
		}
		if (item.imageurls != null && item.imageurls.length == 2) {
			CirclerModelImage subItem1 = new CirclerModelImage();

			subItem1.url = url1;

			item.imageurls = [
				subItem1,
			];
		}

		return item;
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
