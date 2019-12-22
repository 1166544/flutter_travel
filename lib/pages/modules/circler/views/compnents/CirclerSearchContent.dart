import 'package:flutter/material.dart';
import 'package:flutter_travel/core/bloc/BlocProvider.dart';
import 'package:flutter_travel/pages/common/CommonLoading.dart';
import 'package:flutter_travel/pages/common/CommonTravelItem.dart';
import 'package:flutter_travel/pages/modules/circler/blocs/CirclerBlocSearch.dart';
import 'package:flutter_travel/pages/modules/circler/models/CirclerModelSearch.dart';
import 'package:flutter_travel/pages/modules/circler/views/compnents/CircleSearchRender.dart';

/// 搜索结果视图
class CirclerSearchContent extends StatefulWidget {
	final String searchContent;
  	CirclerSearchContent({Key key, this.searchContent}) : super(key: key);

  _CirclerSearchContentState createState() => _CirclerSearchContentState(this.searchContent);
}

class _CirclerSearchContentState extends State<CirclerSearchContent> with CommonTravelItem {
	String _searchContent;
	CirclerBlocSearch blocGalleryList;
	final formKey = GlobalKey<FormState>();
	ScrollController _controller = new ScrollController();
	List<CircleModelSearchItem> renderListData = [];
	bool hasMore = false;

	_CirclerSearchContentState(String searchContent) {
		this._searchContent = searchContent;
	}

	@override
	void initState() {
		super.initState();

		// 给_controller添加监听
		this._controller.addListener((){
			// 判断是否滑动到了页面的最底部
			if(_controller.position.pixels == this._controller.position.maxScrollExtent){
				// 如果不是最后一页数据，则生成新的数据添加到list里面
				if(this.hasMore) {
					this._retrieveData();
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

	void _retrieveData() {
		this.blocGalleryList.update();
	}

	@override
	Widget build(BuildContext context) {
		this.blocGalleryList = BlocProvider.of<CirclerBlocSearch>(context);
		this.blocGalleryList.updateParams(this._searchContent);

		return this.getStreamBuilder(context);
	}

	/// 提交搜索内容刷新本页
	void submit(String val) {
		this._searchContent = val;
		this.blocGalleryList.updateParams(this._searchContent);
	}

	/// 连接stream数据源
	Widget getStreamBuilder(BuildContext context) {
		return StreamBuilder<CirclerModelSearch>(
			stream: this.blocGalleryList.outGallery,
			builder: (context, snapshot) {
				// 数据源到位时渲染列表
				if (snapshot.hasData) {
					return this.buildSearchLayout(snapshot: snapshot);
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
	Widget buildSearchLayout({ AsyncSnapshot<CirclerModelSearch> snapshot }) {
		return buildNotifcationList(snapshot: snapshot);
	}

	/// 通知列表
	Widget buildNotifcationList({ AsyncSnapshot<CirclerModelSearch> snapshot }) {

		List<CircleModelSearchItem> list = snapshot.data.list;
		for (var i = 0; i < list.length; i++) {
			this.renderListData.add(list[i]);
		}

		// 是否为最后一页
		this.hasMore = snapshot.data.hasMore;

		return ListView.separated(
			controller: this._controller,
            physics: BouncingScrollPhysics(),
			shrinkWrap: true,
			itemBuilder: (context, index) {
				// 判断是否构建到了最后一条item
				if(index == this.renderListData.length){
					// 判断是不是最后一页
					if(this.hasMore){
						// 不是最后一页，返回一个loading窗
						return this.getLoadingItem();
					} else {
						// 是最后一页，显示我是有底线的
						return this.getNoMoreItem();
					}
				} else {
					return CircleSearchRender(snapData: this.renderListData[index]);
				}
			},
			// 分割线构造器
			separatorBuilder: (context,index){
				return new Divider(color: Colors.grey.withOpacity(0.3),);
			},
			itemCount: this.renderListData.length + 1,
		);
	}

}
