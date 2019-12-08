import 'package:flutter/material.dart';
import 'package:flutter_travel/pages/common/CommonNavigator.dart';
import 'package:flutter_travel/pages/modules/circler/models/CirclerModelSearch.dart';
import 'package:flutter_travel/pages/modules/notices/NoticePageVO.dart';
import 'package:flutter_travel/pages/modules/notices/NoticeReadVO.dart';

/// 搜索结果渲染条
class CircleSearchRender extends StatefulWidget {
	final CircleModelSearchItem snapData;

	CircleSearchRender({Key key, this.snapData}) : super(key: key);

	_CircleSearchRenderState createState() => _CircleSearchRenderState(this.snapData);
}

class _CircleSearchRenderState extends State<CircleSearchRender> with CommonNavigator {

	CircleModelSearchItem snapData;

	_CircleSearchRenderState(CircleModelSearchItem snapData) : super() {
		this.snapData = snapData;
	}

	@override
	Widget build(BuildContext context) {
		
		// 无图模式
		if (this.snapData.img.length == 0) {
			return this.buildNoneImageLayout(MediaQuery.of(context).size.width);
		}

		// 1张图模式
		if (this.snapData.img.length == 1) {
			return this.buildSingleImageLayout(this.snapData.img[0]);
		}

		// 2张以上图模式
		if (this.snapData.img.length >= 3) {
			return this.buildMultiImageLayout();
		}
		if (this.snapData.imgsrcurl != null) {
			return this.buildSingleImageLayout(this.snapData.imgsrcurl);
		}

		return Text('');
	}

	/// 无图模式
	Widget buildNoneImageLayout(double displayWidth) {
		return Container(
			width: displayWidth,
			padding: EdgeInsets.fromLTRB(10.0, 25.0, 10.0, 10.0),
			child: Column(
				children: <Widget>[
					Text(
						this.snapData.abstractValue,
						style: TextStyle(color: Colors.black, fontSize: 18.0)
					),
					SizedBox(height: 5),
					Row(
						children: <Widget>[
							Text(
								this.snapData.subsitename,
								style: TextStyle(color: Colors.grey, fontSize: 13.0)
							),
							SizedBox(width: 10.0),
							Text(
								this.snapData.posttime,
								style: TextStyle(color: Colors.grey, fontSize: 13.0)
							)
						],
					)
				],
			),
		);
	}

	/// 1张图模式
	Widget buildSingleImageLayout(String url) {
		return Container(
			width: MediaQuery.of(context).size.width,
			padding: EdgeInsets.fromLTRB(0.0, 10.0, 10.0, 10.0),
			child: Row(
				children: <Widget>[
					this.buildNoneImageLayout(MediaQuery.of(context).size.width * 0.70),
					Container(
						width: 90.0,
						height: 120.0,
						decoration: BoxDecoration(
							image: DecorationImage(
								image: NetworkImage(url, headers: this.getCrossHeaders()),
								fit: BoxFit.cover
							),
							border: Border.all(
								color: Colors.grey.withOpacity(0.5),
								width: 0.5
							),
							borderRadius: BorderRadius.all(Radius.circular(7.0))
						),
					)
				],
			),
		);
	}

	/// 2张以上图模式
	Widget buildMultiImageLayout() {
		return Container(
			padding: EdgeInsets.fromLTRB(10.0, 25.0, 10.0, 10.0),
			child: Column(
				children: <Widget>[
					Text(
						this.snapData.abstractValue,
						style: TextStyle(color: Colors.black, fontSize: 18.0)
					),
					Container(
						padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
						width: MediaQuery.of(context).size.width,
						height: 100.0,
						child: ListView(
							scrollDirection: Axis.horizontal,
							children: <Widget>[
								this.buildImage(this.snapData.img[0]),
								SizedBox(width: 10.0),
								this.buildImage(this.snapData.img[1]),
								SizedBox(width: 10.0),
								this.buildImage(this.snapData.img[2]),
							],
						),
					),
					SizedBox(height: 5),
					Row(
						children: <Widget>[
							Text(
								this.snapData.subsitename,
								style: TextStyle(color: Colors.grey, fontSize: 13.0)
							),
							SizedBox(width: 10.0),
							Text(
								this.snapData.posttime,
								style: TextStyle(color: Colors.grey, fontSize: 13.0)
							)
						],
					)
				],
			)
		);
	}

	/// 图片布局
	Widget buildImage(String url) {
		return Container(
			width: 120.0,
			height: 90.0,
			decoration: BoxDecoration(
				image: DecorationImage(
					image: NetworkImage(url, headers: this.getCrossHeaders()),
					fit: BoxFit.cover
				),
				border: Border.all(
					color: Colors.grey.withOpacity(0.5),
					width: 0.5
				),
				borderRadius: BorderRadius.all(Radius.circular(7.0))
			),
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