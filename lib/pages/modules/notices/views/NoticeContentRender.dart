import 'package:flutter/material.dart';
import 'package:flutter_travel/pages/common/CommonNavigator.dart';
import 'package:flutter_travel/pages/common/CommonTimeFormate.dart';
import 'package:flutter_travel/pages/common/CommonTravelItem.dart';
import 'package:flutter_travel/pages/modules/circler/models/CirclerModelNewsItem.dart';
import 'package:flutter_travel/pages/modules/circler/views/pages/CircleDetailPage.dart';

class NoticeContentRender extends StatefulWidget {
	final CirclerModelNewsItem snapData;
	final int index;
	final String coverImage;

	NoticeContentRender({Key key, this.snapData, this.index, this.coverImage}) : super(key: key);

	_NoticeContentRenderState createState() => _NoticeContentRenderState();
}

class _NoticeContentRenderState extends State<NoticeContentRender> with CommonTravelItem, CommonNavigator {

	final CommonTimeFormate timeFormate = new CommonTimeFormate();

	@override
	Widget build(BuildContext context) {

		if (widget.snapData == null) {
			return this.getNoMoreItem();
		}

		if (widget.index == 0) {
			// 第1行
			return Column(
				children: <Widget>[
					// 封面
					this.buildCoverImage(),
					// 主标题
					this.buildAboutTitle(),
					SizedBox(height: 20.0),
					this.builRenderReadItem()
				],
			);
		} else {
			// 第2行以上
			return this.builRenderReadItem();
		}
	}

	/// 封面图片
	Widget buildCoverImage() {
		DecorationImage decorationImage;

		if (widget.coverImage != null) {
			decorationImage = DecorationImage(
				image: NetworkImage(widget.coverImage, headers: this.getCrossHeaders()),
				fit: BoxFit.cover
			);
		} else {
			decorationImage = DecorationImage(
				image: AssetImage('assets/road.jpg'),
				fit: BoxFit.cover
			);
		}

		return Container(
			width: MediaQuery.of(this.context).size.width,
			height: 180,
			decoration: BoxDecoration(
				image: decorationImage
			),
			child: Padding(
				padding: EdgeInsets.fromLTRB(30.0, 50.0, 30.0, 20.0),
				child: Column(
					crossAxisAlignment: CrossAxisAlignment.start,
					mainAxisAlignment: MainAxisAlignment.end,
					children: <Widget>[
						Text(
							'Back to the nature',
							style: TextStyle(
								color: Colors.white,
								fontWeight: FontWeight.bold,
								fontSize: 30.0,
								shadows: [
									Shadow(
										offset: Offset(3.0, 3.0),
										blurRadius: 3.0,
										color: Colors.black.withOpacity(0.8)
									),
								]
							),
						),
						Text(
							'Coming up under the start.',
							style: TextStyle(
								color: Colors.white,
								fontWeight: FontWeight.bold,
								fontSize: 15.0,
								shadows: [
									Shadow(
										offset: Offset(3.0, 3.0),
										blurRadius: 3.0,
										color: Colors.black.withOpacity(0.8)
									),
								]
							),
						),
					],
				),
			),
		);
	}

	/// 副标题
	Widget buildAboutTitle() {
		return Container(
			width: MediaQuery.of(this.context).size.width,
			height: 60.0,
			decoration: BoxDecoration(
				color: Colors.white,
				shape: BoxShape.rectangle,
				border: Border(bottom: BorderSide(width: 0.5, color: Colors.grey))
			),
			padding: EdgeInsets.fromLTRB(30.0, 0.0, 0.0, 0.0),
			child: Column(
				crossAxisAlignment: CrossAxisAlignment.start,
				mainAxisAlignment: MainAxisAlignment.end,
				children: <Widget>[
					Padding(
						padding: EdgeInsets.only(bottom: 10.0),
						child: Text('Latest news', style: TextStyle(fontFamily: 'Montserrat', fontSize: 17.0, fontWeight: FontWeight.bold)),
					),
					Container(
						width: 120.0,
						height: 2.0,
						decoration: BoxDecoration(
							color: Colors.black,
							shape: BoxShape.rectangle
						),
					)
				],
			),
		);
	}

	/// 构建消息列表项
	Widget builRenderReadItem() {

		List<Widget> readSubRenderList = [];

		// 加入预编译数据
		readSubRenderList.add(this.buildSubReadRenderItem());

		return Padding(
			padding: EdgeInsets.only(left: 10.0),
			child: Row(
				crossAxisAlignment: CrossAxisAlignment.start,
				mainAxisAlignment: MainAxisAlignment.start,
				children: <Widget>[
					Container(
						width: 80.0,
						child: Text(
							widget.snapData.site,
							softWrap: true,
							style: TextStyle(
								fontSize: 12.0,
								fontWeight: FontWeight.bold,
								color: Colors.grey.withOpacity(0.7)
							),
						),
					),
					GestureDetector(
						behavior: HitTestBehavior.opaque,
						onTap: () => {
							this.navigateTo(context, CircleDetailPage(requestParams: { 'nids': widget.snapData.nid }))
						},
						child: Column(
							crossAxisAlignment: CrossAxisAlignment.start,
							children: readSubRenderList
						),
					)
				],
			)
		);
	}

	/// 消息列表项
	/// * [PageNoticeVO item] 消息数据源
	Widget buildSubReadRenderItem() {
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
									widget.snapData.title,
									overflow: TextOverflow.ellipsis,
									style: TextStyle(
										fontWeight: FontWeight.bold,
										fontSize: 14.0
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
							this.buildDescribeArea()
						]
					)
			],
		);
	}

	/// 描述文本区
	Widget buildDescribeArea() {

		List<Widget> renderList= [
			SizedBox(height: 8.0),
			// 描述文本
			Container(
				width: 230.0,
				child: Text(
					widget.snapData.abs,
					softWrap: true,
					overflow: TextOverflow.ellipsis,
					maxLines: 10,
					style: TextStyle(
						color: Colors.black.withOpacity(0.8),
						fontSize: 13.0
					),
				)
			),
			SizedBox(height: 10.0)
		];

		// 添加图片
		if (widget.snapData.imageurls != null && widget.snapData.imageurls.length > 0) {
			renderList.add(this.buildImage(widget.snapData.imageurls[0].url));
		}

		// 按钮结构
		renderList.add(SizedBox(height: 7.0));
		renderList.add(this.buildOperationButton());

		return Column(
			crossAxisAlignment: CrossAxisAlignment.end,
			mainAxisAlignment: MainAxisAlignment.start,
			children: renderList,
		);
	}

	/// 显示图片
	Widget buildImage(String url) {
		return Container(
			width: 230.0,
			height: 80.0,
			decoration: BoxDecoration(
			image: DecorationImage(
					image: NetworkImage(url, headers: this.getCrossHeaders()), fit: BoxFit.cover),
					borderRadius: BorderRadius.only(
						topLeft: Radius.circular(3.0),
						topRight: Radius.circular(3.0),
						bottomLeft: Radius.circular(3.0),
						bottomRight: Radius.circular(3.0),
					),
					border: Border.all(color: Colors.grey.withOpacity(0.5))
			),
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
								child: Text('M- ${this.timeFormate.getDateText(widget.snapData.pulltime)}', style: TextStyle(
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
								child: Text('DEL / ${widget.snapData.commentCount}', style: TextStyle(
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