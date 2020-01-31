import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_travel/core/bloc/BlocProvider.dart';
import 'package:flutter_travel/modules/common/CommonTravelItem.dart';
import 'package:flutter_travel/modules/discover/views/ViewContentRender.dart';
import 'package:flutter_travel/modules/home/blocs/BlocNewsList.dart';
import 'package:flutter_travel/modules/home/models/ModelImage.dart';
import 'package:flutter_travel/modules/home/models/ModelNewsItem.dart';
import 'package:flutter_travel/modules/home/models/ModelsNewsList.dart';

/// 探索模块视图
class ViewDiscoverContent extends StatefulWidget {
  ViewDiscoverContent({Key key}) : super(key: key);

  _ViewDiscoverContentState createState() => _ViewDiscoverContentState();
}

class _ViewDiscoverContentState extends State<ViewDiscoverContent> with CommonTravelItem {

	BlocNewsList blocGalleryList;
	GlobalKey<RefreshIndicatorState> refreshKey = GlobalKey<RefreshIndicatorState>();
	final formKey = GlobalKey<FormState>();
	ScrollController _controller = new ScrollController();
	List<ModelNewsItem> renderListData = [];
	bool hasMore = false;

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
		// 移除监听，防止内存泄漏
		this._controller.dispose();
		this.blocGalleryList.dispose();
		super.dispose();
	}

	void retriveData() {
		this.blocGalleryList.update();
	}

	@override
	Widget build(BuildContext context) {
		// 连接数据源
		this.blocGalleryList = BlocProvider.of<BlocNewsList>(context);
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
		return StreamBuilder<ModelsNewsList>(
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

	/// 基础页面结构
	Widget buildLayout(AsyncSnapshot<ModelsNewsList> snapshot) {

		List<ModelNewsItem> list = snapshot.data.news;
		for (var i = 0; i < list.length; i++) {

			if (list[i].imageurls != null && list[i].imageurls.length >= 3) {
				this.renderListData.add(list[i]);
			}
		}

		// 是否为最后一页
		this.hasMore = snapshot.data.hasmore;

		return AnimationLimiter(
			child: ListView.separated(
				controller: this._controller,
				physics: BouncingScrollPhysics(),
				shrinkWrap: true,
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
						var item = this.rebuildImageUrls(this.renderListData[index]);

						return AnimationConfiguration.staggeredList(
							position: index,
							duration: const Duration(milliseconds: 375),
							child: SlideAnimation( //滑动动画
								verticalOffset: 50.0,
								child: FadeInAnimation( //渐隐渐现动画
									child: ViewContentRender(snapData: item, renderIndex: index),
								),
							),
						);
					}
				},
				separatorBuilder: (context, index) {
					return this.buildTravelSep();
				},
				itemCount: this.renderListData.length + 1,
			)
        );

	}

	// 补足缺失图片
	ModelNewsItem rebuildImageUrls(ModelNewsItem item) {
		var url1 = 'assets/beach1.jpg';
		var url2 = 'assets/beach2.jpg';
		var url3 = 'assets/beach3.jpg';
		if (item.imageurls == null || item.imageurls.length == 0) {
			ModelImage subItem1 = new ModelImage();
			ModelImage subItem2 = new ModelImage();
			ModelImage subItem3 = new ModelImage();

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
			ModelImage subItem1 = new ModelImage();
			ModelImage subItem2 = new ModelImage();

			subItem1.url = url1;
			subItem2.url = url2;

			item.imageurls = [
				subItem1,
				subItem2,
			];
		}
		if (item.imageurls != null && item.imageurls.length == 2) {
			ModelImage subItem1 = new ModelImage();

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
			'assets/images/dot.png',
			width: 10.0,
			height: 80.0
		);
	}
}
