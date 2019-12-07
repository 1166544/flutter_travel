import 'package:flutter/material.dart';
import 'package:flutter_travel/core/bloc/BlocProvider.dart';
import 'package:flutter_travel/pages/common/CommonLoading.dart';
import 'package:flutter_travel/pages/common/CommonTravelItem.dart';
import 'package:flutter_travel/pages/modules/circler/blocs/CirclerBlocSearch.dart';
import 'package:flutter_travel/pages/modules/circler/models/CirclerModelSearch.dart';
import 'package:flutter_travel/pages/modules/circler/views/compnents/CirclerSearchBar.dart';
import 'package:flutter_travel/pages/modules/graphics/models/GraphicsBlocModel.dart';
import 'package:flutter_travel/pages/modules/notices/NoticePageVO.dart';
import 'package:flutter_travel/pages/modules/notices/NoticeReadVO.dart';

/// 搜索强结果视图
class CirclerSearchContent extends StatefulWidget {
	final String searchContent;
  	CirclerSearchContent({Key key, this.searchContent}) : super(key: key);

  _CirclerSearchContentState createState() => _CirclerSearchContentState(this.searchContent);
}

class _CirclerSearchContentState extends State<CirclerSearchContent> with CommonTravelItem {
	String _searchContent;
	CirclerBlocSearch blocGalleryList;
	final formKey = GlobalKey<FormState>();

	_CirclerSearchContentState(String searchContent) {
		this._searchContent = searchContent;
	}

	@override
	Widget build(BuildContext context) {
		// 连接数据源
		this.blocGalleryList = BlocProvider.of<CirclerBlocSearch>(context);
		this.blocGalleryList.updateParams(this._searchContent);

		return this.getStreamBuilder(context);
	}

	/// 提交搜索内容刷新本页
	void submit() {
		// hole
	}

	/// 连接stream数据源
	Widget getStreamBuilder(BuildContext context) {
		return StreamBuilder<CirclerModelSearch>(
			stream: this.blocGalleryList.outGallery,
			builder: (context, snapshot) {
				return this.buildSearchLayout();

				// 数据源到位时渲染列表
				// if (snapshot.hasData) {
				// 	return this.buildSearchLayout(snapshot);
				// } else {
				// 	return this.buildEmptyLayout(context);
				// }
			},
		);
	}

	/// 空数据结构提示
	Widget buildEmptyLayout(BuildContext context) {
		return new CommonLoading();
	}

	/// 基础页面结构
	Widget buildSearchLayout({ AsyncSnapshot<GraphicsBlocModel> snapshot }) {
		return Container(
			child: Column(
				children: <Widget>[
					// 搜索条
					CirclerSearchBar(content: this._searchContent, callBack: (val) => {
						print(val)
					}),
					// 搜索结果列表
					this.buildNotifcationList()
				],
			),
		);
	}

	/// 通知列表
	Widget buildNotifcationList() {
		List<NoticePageVO> subList = [
			new NoticePageVO(subTitle: 'New to Flutter', description: "Bookmark the API reference docs for the Flutter framework."),
		];

		List<NoticeReadVO> readList = [
			new NoticeReadVO(dateTitle: 'Mon 1, Nov', readList: subList),
			new NoticeReadVO(dateTitle: 'Sep 2, Dec', readList: subList),
		];

		List<Widget> readRenderList = [];
		for (NoticeReadVO item in readList) {
			readRenderList.add(
				this.builRenderReadItem(item)
			);
		}
		return Column(
			children: readRenderList,
		);
	}

	/// 构建消息列表项
	/// * [PageReadVO item] 消息体
	Widget builRenderReadItem(NoticeReadVO item) {

		List<Widget> readSubRenderList = [];

		// 加入预编译数据
		for (NoticePageVO item in item.readList) {
			readSubRenderList.add(this.buildSubReadRenderItem(item));
		}

		return Padding(
			padding: EdgeInsets.only(left: 10.0),
			child: Row(
				crossAxisAlignment: CrossAxisAlignment.start,
				mainAxisAlignment: MainAxisAlignment.start,
				children: <Widget>[
					Container(
						width: 80.0,
						child: Text(
							item.dateTitle,
							softWrap: true,
							style: TextStyle(
								fontSize: 12.0,
								fontWeight: FontWeight.bold,
							),
						),
					),
					Column(
						crossAxisAlignment: CrossAxisAlignment.start,
						children: readSubRenderList
					)
				],
			)
		);
	}

	/// 消息列表项
	/// * [PageNoticeVO item] 消息数据源
	Widget buildSubReadRenderItem(NoticePageVO item) {
		return Column(
			crossAxisAlignment: CrossAxisAlignment.start,
			children: <Widget>[
					// 带圆圈标题行
					Row(
						children: <Widget>[
							// 圆圈
							Icon(Icons.check_circle_outline, size: 20.0, color: Colors.blue),
							// 子标题
							SizedBox(width: 12.0),
							Container(
								width: 230.0,
								child: Text(
									item.subTitle,
									overflow: TextOverflow.ellipsis,
									style: TextStyle(
										fontFamily: 'Montserrat',
										fontWeight: FontWeight.bold,
										color: Colors.black87.withOpacity(0.6)
									)
								)
							)
						]
					),
					// 带虚线行
					Row(
						crossAxisAlignment: CrossAxisAlignment.start,
						mainAxisAlignment: MainAxisAlignment.start,
						children: <Widget>[
							// 虚线
							Container(
								width: 10.0,
								height: 120.0,
								margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 30.0),
								decoration: BoxDecoration(
									color: Colors.white.withOpacity(0.0),
									border: Border(right: BorderSide(color: Colors.grey.withOpacity(0.2), width: 1.0, style: BorderStyle.solid))
								),
							),
							SizedBox(width: 22.0),
							// 描述文本区
							Column(
								crossAxisAlignment: CrossAxisAlignment.end,
								mainAxisAlignment: MainAxisAlignment.start,
								children: <Widget>[
									SizedBox(height: 8.0),
									// 描述文本
									Container(
										width: 230.0,
										child: Text(
											item.description,
											softWrap: true,
											overflow: TextOverflow.ellipsis,
											maxLines: 10,
											style: TextStyle(
												color: Colors.black.withOpacity(0.8),
												fontSize: 12.0
											),
										)
									),
									SizedBox(height: 60.0),
									// 操作按钮
									this.buildOperationButton(),
								],
							)
						]
					)
			],
		);
	}

	/// 操作按钮区
	Widget buildOperationButton() {
		return Padding(
			padding: EdgeInsets.only(bottom: 10.0),
			child: Row(
				children: <Widget>[
					InkWell(
						highlightColor: Colors.orangeAccent,
						child: Container(
							width: 110.0,
							height: 30.0,
							// 圆角背景按钮
							decoration: BoxDecoration(
								color: Colors.yellow,
								shape: BoxShape.rectangle,
								borderRadius: BorderRadius.circular(2.0)
							),
							child: Center(
								child: Text('Make readed', style: TextStyle(
											fontFamily: 'Montserrat',
											fontSize: 12.0,
											color: Colors.black
								)),
							),
						),
						onTap: () {},
					),
					SizedBox(width: 10.0),
					// 描述删除按钮使用InkWell包装
					InkWell(
						highlightColor: Colors.grey,
						child: Container(
							width: 80.0,
							height: 30.0,
							decoration: BoxDecoration(
								color: Colors.grey.withOpacity(0.5),
								shape: BoxShape.rectangle,
								borderRadius: BorderRadius.circular(2.0)
							),
							// 描述删除按钮
							child: Center(
								child: Text('DELETE', style: TextStyle(
											fontFamily: 'Montserrat',
											fontSize: 12.0,
											color: Colors.black
								)),
							),
						),
						onTap: () {},
					)
				],
			),
		);
	}

}
