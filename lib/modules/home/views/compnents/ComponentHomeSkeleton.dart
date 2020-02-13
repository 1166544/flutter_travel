import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_travel/modules/common/CommonLoading.dart';

/// 首页面骨架屏
class ComponentHomeSkeleton extends CommonSkeletonItem {
	Widget build(BuildContext context) {
		List<Widget> renderList = [];

		renderList.add(this.getComponentImproving());

		for (var i = 0; i < 5; i++) {
			renderList.add(this.getComponentList(context));
		}

		return ListView(
			children: renderList
		);
	}

	/// 展示列表
	Widget getComponentList(BuildContext context) {
		return Padding(
			padding: EdgeInsets.fromLTRB(10.0, 35.0, 0.0, 0.0),
			child: Column(
				crossAxisAlignment: CrossAxisAlignment.start,
				children: <Widget>[
					this.generateLayoutList(context)
				],
			),
		);
	}

	/// 新闻列表骨架
	Widget generateLayoutList(BuildContext context) {
		return Row(
			crossAxisAlignment: CrossAxisAlignment.start,
			children: <Widget>[
				this.getSkeletonItem(
					width: 120.0,
					height: 105.0,
					decoration: BoxDecoration(
						shape: BoxShape.rectangle,
						color: Colors.grey.withOpacity(0.8),
						border: BorderDirectional(
							top: BorderSide(color: Colors.grey, width: 0.5),
							start: BorderSide(color: Colors.grey, width: 0.5),
							end: BorderSide(color: Colors.grey, width: 0.5),
							bottom: BorderSide(color: Colors.grey, width: 0.5),
						),
						borderRadius: BorderRadius.circular(8)
					),
				),
				SizedBox(width: 12.0),
				Column(
					children: <Widget>[
						this.getSkeletonItem(
							width: MediaQuery.of(context).size.width - 160, 
							height: 14
						),
						SizedBox(height: 5.0),
						this.getSkeletonItem(
							width: MediaQuery.of(context).size.width - 160,
							height: 40,
							color: Colors.grey.withOpacity(0.5)
						),
						SizedBox(height: 5.0),
						Container(
							width: MediaQuery.of(context).size.width - 160,
							height: 40,
							child: Row(
								children: [
									this.getSkeletonItem(
										width: 50,
										height: 30,
										color: Colors.grey.withOpacity(0.4)
									),
									Expanded(
										child: Container(
											margin: EdgeInsets.fromLTRB(5.0, 0, 0, 0),
											height: 30,
											decoration: BoxDecoration(
												shape: BoxShape.rectangle,
										color: Colors.grey.withOpacity(0.2)
											)
										)
									)
								]
							)
						)
					],
				)
			],
		);
	}

	/// 改进提示
	Widget getComponentImproving() {
		return Padding(
			padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0),
			child: this.buidCircleIconBar('98%',
				'Keep improving!',
				Colors.grey.withOpacity(0.3),
				Colors.grey.withOpacity(0.3),
				Colors.grey.withOpacity(0.3),
			)
		);
	}

	/// 构建圆角横条
	Widget buidCircleIconBar(
		String startCount, String hotelName, Color colorValue, Color colorCenter, Color shapeColor) {

		return Container(
			// RadialGridient圆形渐变效果
			decoration: BoxDecoration(
				color: colorValue,
				borderRadius: BorderRadius.circular(8.0),
				border: Border.all(color: Colors.grey.withOpacity(0.5)),
				gradient: RadialGradient(
					center: Alignment(-0.9, 3),
					radius: 3.7,
					colors: [colorValue, colorCenter, shapeColor],
					stops: [0.3, 0.7, 1.5])),
			child: Padding(
				padding: EdgeInsets.fromLTRB(25.0, 13.0, 25.0, 13.0),
				child: Row(
				crossAxisAlignment: CrossAxisAlignment.center,
				mainAxisAlignment: MainAxisAlignment.start,
				children: <Widget>[
					Column(
						mainAxisAlignment: MainAxisAlignment.start,
						crossAxisAlignment: CrossAxisAlignment.start,
						children: <Widget>[
							this.getSkeletonItem(width: 100, height: 15, color: Colors.grey.withOpacity(0.5)),
							Container(
								padding: EdgeInsets.fromLTRB(0.0, 5.0, 0, 0),
								child: this.getSkeletonItem(width: 220, height: 25),
								width: 220,
							),
						],
					),
					Spacer(),
					Container(
						width: 60.0,
						height: 60.0,
						decoration: BoxDecoration(
							color: Colors.grey.withOpacity(0.6),
							borderRadius: BorderRadius.circular(50.0),
							boxShadow: [
							BoxShadow(
								color: Colors.white.withOpacity(0.5),
								offset: Offset(0.0, 0.0),
								blurRadius: 0.0,
								spreadRadius: 1.8)
							],
						),
						child: this.getImproveTitle(),
					),
				],
				),
			),
		);
	}

	/// Redux数据调用: 绑定全局动态标题
	Widget getImproveTitle() {
		return Center(
			child: Text(
				'98%',
				style: TextStyle(
					fontSize: 16.0,
					color: Colors.white,
					fontWeight: FontWeight.bold)
			),
		);
	}
}