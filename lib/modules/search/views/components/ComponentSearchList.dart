import 'package:flutter/material.dart';
import 'package:flutter_travel/core/manager/ManagerEnviroment.dart';
import 'package:flutter_travel/modules/common/CommonImageNetwork.dart';
import 'package:flutter_travel/modules/common/CommonText.dart';

/// 长列表
class ComponentSearchList extends StatefulWidget {
	ComponentSearchList({Key key}) : super(key: key);

	_ComponentSearchListState createState() => _ComponentSearchListState();
}

class _ComponentSearchListState extends State<ComponentSearchList> {
	String coverUrl = ManagerEnviroment.instance.getEnv().loginLogoUrl();

  	@override
  	Widget build(BuildContext context) {
		return Container(
			padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
			child: Column(
				mainAxisAlignment: MainAxisAlignment.start,
				crossAxisAlignment: CrossAxisAlignment.start,
				children: <Widget>[
					// 标题
					this.getContentTitle(),

					// 内容
					this.getContentText(),

					// 内容图片、视频
					this.getContentMedia(),

					// 操作按钮
					this.getContentOperationButtton()
				]
			),
		);
	}

	/// 操作按钮
	Widget getContentOperationButtton() {
		return Padding(
			padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
			child: Column(
				children: <Widget>[
					Row(
						children: <Widget>[
							this.getOperateButton(Icons.collections_bookmark, color: Colors.lightBlue),
							SizedBox(width: 32),
							this.getOperateButton(Icons.chat, color: Colors.grey),
							SizedBox(width: 32),
							this.getOperateButton(Icons.settings_ethernet, color: Colors.grey),
							Spacer(),
							this.getOperateButton(Icons.timeline, color: Colors.grey),
							SizedBox(width: 22)
						],
					),
					SizedBox(height: 15),
					Container(
						height: 2,
						decoration: BoxDecoration(
							shape: BoxShape.rectangle,
							color: Colors.grey.withOpacity(0.1)
						),
					),
					SizedBox(height: 15),
				]
			),
		);
	}

	/// 操作小图标
	Widget getOperateButton(IconData icon, {Color color = Colors.grey, int num = 12}) {
		return Row(
			crossAxisAlignment: CrossAxisAlignment.start,
			children: <Widget>[
				Icon(icon, size: 22, color: color),
				CommonText(num.toString(), color: color, fontSize: 10)
			]
		);
	}

	/// 内容图片、视频
	Widget getContentMedia({int type = 2}) {
		Widget renderContent;

		// pageInfo存在-视频
		// pics存在，图片宫格形式
		// 三图以下 column
		// 三图以上 grid

		switch(type) {
			case 0:
				// 长方形三栏展示方式
				renderContent = this.getThreeColumn();
				break;
			case 1:
				// 方形三栏展示方式
				renderContent = this.getThreeRectColumn();
				break;
			case 2:
				// 视频展示方式
				renderContent = this.getVideoColumn();
				break;
			default:
				renderContent = this.getThreeColumn();
				break;
		}

		return renderContent;
	}

	/// 长方形三栏展示方式
	/// * [double gap] 间隔
	/// * [double padding] 左右间矩
	/// * [double radius] 圆角度
	/// * [double rightWidth] 右边宽度
	/// * [double rightHeight] 右边高度
	Widget getThreeRectColumn({double gap = 10, double rightHeight = 90, double padding = 20, double rightWidth = 120, double radius = 5.0}) {
		return Container(
			padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
			child: Row(
				mainAxisAlignment: MainAxisAlignment.start,
				crossAxisAlignment: CrossAxisAlignment.start,
				children: <Widget>[
					this.getColumnImage(
						width: MediaQuery.of(context).size.width - padding - gap - rightWidth,
						height: rightHeight * 2 + gap,
						radius: radius
					),
					SizedBox(width: gap),
					Column(
						crossAxisAlignment: CrossAxisAlignment.start,
						children: <Widget>[
							this.getColumnImage(width: rightWidth, height: rightHeight, radius: radius),
							SizedBox(height: gap),
							this.getColumnImage(width: rightWidth, height: rightHeight, radius: radius),
						],
					),
				]
			)
		);
	}

	/// 圆角图片
	Widget getColumnImage({double width = 120, double height = 90, double radius = 3.0}) {
		return Container(
			width: width,
			height: height,
			decoration: BoxDecoration(
				border: Border.all(color: Colors.black.withOpacity(0.2), width: 0.5),
				borderRadius:
					BorderRadius.all(Radius.circular(radius)),
				image: DecorationImage(
					image: CommentImageNetwork.imageNetwork(this.coverUrl),
					fit: BoxFit.cover)
			),
		);
	}

	/// 方形三栏展示方式
	Widget getThreeColumn() {
		double imageWidth = MediaQuery.of(context).size.width / 3 - 10;
		return Container(
			padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
			child: Row(
				mainAxisAlignment: MainAxisAlignment.spaceBetween,
				children: <Widget>[
					this.getColumnImage(width: imageWidth),
					this.getColumnImage(width: imageWidth),
					this.getColumnImage(width: imageWidth),
				]
			)
		);
	}

	/// 视频展示方式
	Widget getVideoColumn() {
		double videoWidth = MediaQuery.of(context).size.width - 20;
		double videoHeight = 250;
		return Padding(
			padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
			child: Container(
				width: videoWidth,
				height: videoHeight,
				decoration: BoxDecoration(
					shape: BoxShape.rectangle,
					color: Color(0xFFe6e9f1),
					borderRadius: BorderRadius.circular(3.0)
				),
				child: Column(
					mainAxisAlignment: MainAxisAlignment.start,
					crossAxisAlignment: CrossAxisAlignment.start,
					children: <Widget>[
						SizedBox(height: 10),
						Padding(
							padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
							child: CommonText('@Bill: this is my favorite photos', color: Colors.black.withOpacity(0.8)),
						),
						SizedBox(height: 8),
						Center(
							child: Container(
								width: videoWidth - 14,
								height: videoHeight - 40,
								decoration: BoxDecoration(
									shape: BoxShape.rectangle,
									image: DecorationImage(
										fit: BoxFit.cover,
										image: CommentImageNetwork.imageNetwork(this.coverUrl)
									),
									borderRadius: BorderRadius.circular(3.0)
								),
								child: Center(
									child: Icon(Icons.play_arrow, size: 130, color: Colors.grey.withOpacity(0.5))
								),
							)
						)
					]
				),
			),
		);
	}

	/// 微博内容
	Widget getContentText() {
		return Padding(
			padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
			child: Column(
				mainAxisAlignment: MainAxisAlignment.start,
				crossAxisAlignment: CrossAxisAlignment.start,
				children: <Widget>[
					CommonText('The clean desk makes me fell better.', fontSize: 17, fontWeight: FontWeight.w500, color: Colors.black.withOpacity(0.7), maxLines: 5),
					CommonText('See Translation >', fontSize: 14, fontWeight: FontWeight.w300, color: Colors.grey.withOpacity(0.5)),
				]
			)
		);
	}

	/// 横向标题
	Widget getContentTitle() {
		return Container(
			width: MediaQuery.of(context).size.width,
			child: Row(
				mainAxisAlignment: MainAxisAlignment.start,
				crossAxisAlignment: CrossAxisAlignment.start,
				children: <Widget>[
					// 头象
					Hero(
						tag: coverUrl,
						child: Container(
							width: 35,
							height: 35,
							decoration: BoxDecoration(
								borderRadius: BorderRadius.circular(25),
								image: DecorationImage(
									image: CommentImageNetwork.imageNetwork(coverUrl),
									fit: BoxFit.cover
								),
								boxShadow: [
									BoxShadow(
										color: Colors.grey.withOpacity(0.3),
										offset: Offset(1.0, 1.0),
										blurRadius: 1,
										spreadRadius: 1
									)
								] 
							),
						),
					),
					SizedBox(width: 5),
					Column(
						mainAxisAlignment: MainAxisAlignment.start,
						crossAxisAlignment: CrossAxisAlignment.start,
						children: <Widget>[
							CommonText('Tammy Garza', fontWeight: FontWeight.w500, fontSize: 18),
							CommonText('Just now, from iphone X', fontWeight: FontWeight.normal, fontSize: 13, color: Colors.grey.withOpacity(0.7)),
						]
					),
					Spacer(),
					Icon(Icons.keyboard_arrow_down, size: 22, color: Colors.grey.withOpacity(0.5))
				]
			)
		);
	}
}