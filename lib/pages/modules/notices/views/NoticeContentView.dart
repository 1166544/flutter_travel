import 'package:flutter/material.dart';
import 'package:flutter_travel/core/bloc/BlocProvider.dart';
import 'package:flutter_travel/pages/common/CommonLoading.dart';
import 'package:flutter_travel/pages/common/CommonTravelItem.dart';
import 'package:flutter_travel/pages/modules/circler/blocs/CirclerBlocNewsList.dart';
import 'package:flutter_travel/pages/modules/circler/models/CirclerModelNewsItem.dart';
import 'package:flutter_travel/pages/modules/circler/models/CirclerModelsNewsList.dart';
import 'package:flutter_travel/pages/modules/notices/views/NoticeContentRender.dart';

class NoticeContentView extends StatefulWidget {
  NoticeContentView({Key key}) : super(key: key);

  _NoticeContentViewState createState() => _NoticeContentViewState();
}

class _NoticeContentViewState extends State<NoticeContentView> with CommonTravelItem {
	
	CirclerBlocNewsList blocGalleryList;
	GlobalKey<RefreshIndicatorState> refreshKey = GlobalKey<RefreshIndicatorState>();
	ScrollController _controller = new ScrollController();
	List<CirclerModelNewsItem> renderListData = [];
	bool hasMore = false;

	@override
	void initState() {
		super.initState();

		this._controller.addListener(() {
			if (this._controller.position.pixels == this._controller.position.maxScrollExtent) {
				if (this.hasMore) {
					this._retriveData();
				}
			}
		});
	}

	@override
	void dispose() {
		this._controller.dispose();
		this.blocGalleryList.dispose();
		super.dispose();
	}

	/// 更新数据
	void _retriveData() {
		this.blocGalleryList.update();
	}

	@override
	Widget build(BuildContext context) {
		// 连接数据源
		this.blocGalleryList = BlocProvider.of<CirclerBlocNewsList>(context);
		
		// 接接本地数据
		this.blocGalleryList.updateParams(
			{
				'form': 'news_webapp',
				'pd': 'webapp',
				'os': 'iphone',
				'ver': 6,
				'category_name': '科技',
				'category_id': '',
				'action': 1
			}
		);

		return RefreshIndicator(
			key: this.refreshKey,
			color: Colors.grey.withOpacity(0.5),
			child: this.getStreamBuilder(),
			onRefresh: this.refreshData,
		);
	}

	Future<Null> refreshData() async {
		await this.blocGalleryList.update();
	}

	/// 页面结构
	Widget getStreamBuilder() {
		return StreamBuilder<CirclerModelsNewsList>(
			stream: this.blocGalleryList.outGallery,
			builder: (context, snapshot) {
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
		
		List<CirclerModelNewsItem> list = snapshot.data.news;
		String coverImage;
		for (var i = 0; i < list.length; i++) {
			CirclerModelNewsItem item = list[i];

			// 计算首页面图片
			if (coverImage == null && item.imageurls != null && item.imageurls.length > 1) {
				coverImage = item.imageurls[0].url;
			}
			this.renderListData.add(list[i]);
		}

		// 最后一页判断
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
					return NoticeContentRender(
						snapData: this.renderListData[index], 
						index: index, 
						coverImage: coverImage
					);
				}
			},
			// 分割线
			separatorBuilder: (context, index) {
				return new Divider(color: Colors.grey.withOpacity(0.5));
			},
			itemCount: this.renderListData.length + 1
		);
	}
}