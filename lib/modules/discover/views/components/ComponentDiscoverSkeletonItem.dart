import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_travel/modules/common/CommonLoading.dart';

/// 加载中骨架外观页面(淡灰色)
class ComponentDiscoverSkeletonItem extends CommonSkeletonItem {
  ComponentDiscoverSkeletonItem({Key key}) : super(key: key);

  CommonSkeletonItemState createState() => _ComponentDiscoverSkeletonItemState();
}

class _ComponentDiscoverSkeletonItemState extends CommonSkeletonItemState {
	
	Widget buildLayout(BuildContext context) {
		List<Widget> renderList = [];
		for (var i = 0; i < 10; i++) {
			renderList.add(this.getRenderItem(context));
		}
		return ListView(
			children: renderList,
		);
	}

	/// 渲染内容
	Widget getRenderItem(BuildContext context) {
		return Column(
			children: [
				this.buildTravelDate(context),
				SizedBox(height: 10),
				this.buildImageGrid(context),
				this.buildImgGalleryDetail(context)
			],
		);
	}

	/// 图片详情
	Widget buildImgGalleryDetail(BuildContext context) {
		return Padding(
			padding: EdgeInsets.only(left: 25.0, right: 15.0, top: 15.0),
			child: Column(
				children: [
					this.getSkeletonItem(
						width: MediaQuery.of(context).size.width - 100,
						height: 20,
						decoration: BoxDecoration(
							shape: BoxShape.rectangle,
							color: Colors.grey.withOpacity(0.3)
						),
					),
					SizedBox(height: 3),
					this.getSkeletonItem(
						width: MediaQuery.of(context).size.width - 100,
						height: 10,
						decoration: BoxDecoration(
							shape: BoxShape.rectangle,
							color: Colors.grey.withOpacity(0.3)
						),
					),
					SizedBox(height: 50)
				]
			)
		);
	}

	/// 旅行日志时间
	Widget buildTravelDate(BuildContext context, {String travelTitle}) {
		return getSkeletonItem(width: MediaQuery.of(context).size.width - 200, height: 10);
	}

	/// 构建图片网格
	Widget buildImageGrid(BuildContext context) {
		return Padding(
		padding: EdgeInsets.only(top: 25.0, left: 15.0, right: 15.0),
		child: Container(
			height: 225.0,
			child: Row(
			children: <Widget>[
				Container(
					height: 225.0,
					child: this.buildComumnImage(context),
				)
			],
			),
		),
		);
	}

	/// 构建封面图片(左边大图，右边上下小图结构)
	Widget buildComumnImage(BuildContext context) {
		return Row(
			children: <Widget>[
				this.buildLeftBigImage(context),
				SizedBox(width: 2.0),
				Column(
					crossAxisAlignment: CrossAxisAlignment.start,
					children: <Widget>[
						// 右上小图
						this.buildRightTopSmallImage(context),
						SizedBox(height: 2.0),
						// 右下小图
						this.buildRightBottomSmallImage(context)
					],
				),
			],
		);
	}

	/// 右下小图
	Widget buildRightBottomSmallImage(BuildContext context) {
		return this.getSkeletonItem(
			height: 111.5,
			width: MediaQuery.of(context).size.width / 2 - 72.0,
			decoration: BoxDecoration(
				border: Border.all(color: Colors.black.withOpacity(0.3), width: 0.5),
				borderRadius:
					BorderRadius.only(bottomRight: Radius.circular(15.0)),
				color: Colors.grey.withOpacity(0.3),
				shape: BoxShape.rectangle
			),
		);
	}

	/// 左部大图
	Widget buildLeftBigImage(BuildContext context) {
		return this.getSkeletonItem(
			height: 225.0,
			width: MediaQuery.of(context).size.width / 2 + 40.0,
			decoration: BoxDecoration(
				border: Border.all(color: Colors.black.withOpacity(0.3), width: 0.5),
				borderRadius: BorderRadius.only(topLeft: Radius.circular(15.0), bottomLeft: Radius.circular(15.0)),
				color: Colors.grey.withOpacity(0.5),
				shape: BoxShape.rectangle
			)
		);
	}

	/// 右上小图
	Widget buildRightTopSmallImage(BuildContext context) {
		return this.getSkeletonItem(
			height: 111.5,
			width: MediaQuery.of(context).size.width / 2 - 72.0,
			decoration: BoxDecoration(
				border: Border.all(color: Colors.black.withOpacity(0.3), width: 0.5),
				borderRadius:
					BorderRadius.only(topRight: Radius.circular(15.0)),
				color: Colors.grey.withOpacity(0.4),
				shape: BoxShape.rectangle
			)
		);
	}
}