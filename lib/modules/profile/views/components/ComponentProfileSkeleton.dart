import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_travel/modules/common/CommonLoading.dart';

/// 我的详情页骨架
class ComponentProfileSkeleton extends CommonSkeletonItem {
	
	Widget buildLayout(BuildContext context) {
		return ListView(
			children: <Widget>[
				// 顶部头像
				this.buildTopStucts(),

				// 中部报告信息
				this.buildMiddleReportStucts(),

				// 中部实现信息
				this.buildMiddlePresciptionStucts(context),

				// 中部访问信息
				this.buildMiddleVisitorStucts(),
			]
		);
	}

	/// 中部访问信息
	Widget buildMiddleVisitorStucts() {
		return Container(
			padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 40.0),
			decoration: BoxDecoration(
				color: Color(0xFFebeff9)
			),
			child: Row(
				crossAxisAlignment: CrossAxisAlignment.center,
				mainAxisAlignment: MainAxisAlignment.spaceEvenly,
				children: <Widget>[
					this.getVisitorItem(),
					this.getVisitorItem(),
					this.getVisitorItem(),
				]
			)
		);
	}

	/// 访问人数显示项
	Widget getVisitorItem() {
		return Container(
			decoration: BoxDecoration(
				color: Colors.white,
				borderRadius: BorderRadius.circular(10.0)
			),
			width: 130.0,
			height: 130.0,
			padding: EdgeInsets.only(left: 15.0, right: 15.0),
			child: Column(
				mainAxisAlignment: MainAxisAlignment.center,
				children: <Widget>[
					this.getSkeletonItem(width: 55, height: 15, color: Colors.grey.withOpacity(0.3)),
					SizedBox(height: 15.0),
					this.getSkeletonItem(width: 55, height: 15, color: Colors.grey.withOpacity(0.5)),
					SizedBox(height: 12.0),
					Container(
						height: 4.0,
						decoration: BoxDecoration(
							borderRadius: BorderRadius.circular(18.0),
							color: Colors.grey
						),
					)
				],
			),
		);
	}

	/// 中部实现信息
	Widget buildMiddlePresciptionStucts(BuildContext context) {
		return Container(
				padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 25.0),
				child: Column(
					crossAxisAlignment: CrossAxisAlignment.start,
					children: <Widget>[
						this.getSkeletonItem(width: 180, height: 10, color: Colors.grey.withOpacity(0.5)),
						SizedBox(height: 15.0),
						Container(
							width: MediaQuery.of(context).size.width - 40,
							decoration: BoxDecoration(
								color: Colors.grey.withOpacity(0.3)
							),
							padding: EdgeInsets.all(18.0),
							child: Column(
								children: <Widget>[
									this.getSkeletonItem(width: MediaQuery.of(context).size.width - 76, height: 10),
									SizedBox(height: 12),
									this.getSkeletonItem(width: MediaQuery.of(context).size.width - 76, height: 10, color: Colors.grey.withOpacity(0.5)),
									SizedBox(height: 12),
									this.getSkeletonItem(width: MediaQuery.of(context).size.width - 76, height: 10, color: Colors.grey.withOpacity(0.3)),
								],
							),
						),
				]
			)
		);
	}

	Widget buildMiddleReportStucts() {
		return Container(
			padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
			child: Column(
				crossAxisAlignment: CrossAxisAlignment.start,
				children: <Widget>[

					// 趋势分析面板
					this.getTrendsItem(),
					
					SizedBox(height: 33.0),
					
					// 趋势分析块
					this.getTrendsBlock(),
					
					SizedBox(height: 30.0),
					
					// 带黄底横线标题
					this.getSkeletonItem(width: 150, height: 10),
					
					SizedBox(height: 15.0),
					
					// 带黄底横线标题
					this.getSkeletonItem(width: 150, height: 10, color: Colors.grey.withOpacity(0.5)),
					
					SizedBox(height: 16.0),
					
					// 绿色进度条文本
					this.getSkeletonItem(width: 150, height: 10, color: Colors.grey.withOpacity(0.3)),
					
					SizedBox(height: 10.0),
					
					// 进度条顶部
					this.getStackItem()
				],
			),
		);
	}

	/// 进度条
	Widget getStackItem() {
		return Container(
			height: 6.0,
			decoration: BoxDecoration(
				borderRadius: BorderRadius.circular(12.0),
				color: Color(0xFFdce5e3)
			),
		);
	}

	/// 趋势分析块
	Widget getTrendsBlock() {
		return Row(
			mainAxisAlignment: MainAxisAlignment.spaceBetween,
			children: [
				this.getTrendsBlockItem(),
				SizedBox(width: 10),
				this.getTrendsBlockItem()
			]
		);
	}

	Widget getTrendsBlockItem() {
		return Expanded(child: Container(
			height: 120,
			padding: EdgeInsets.fromLTRB(15, 15, 15, 20),
			decoration: BoxDecoration(
				borderRadius: BorderRadius.circular(8.0),
				color: Colors.grey.withOpacity(0.5)
			),
			child: Column(
				mainAxisAlignment: MainAxisAlignment.start,
				crossAxisAlignment: CrossAxisAlignment.start,
				children: [
					this.getSkeletonItem(width: 100, height: 15),
					Spacer(),
					Row(
						mainAxisAlignment: MainAxisAlignment.start,
						crossAxisAlignment: CrossAxisAlignment.start,
						children: [
							this.getSkeletonItem(width: 50, height: 50, color: Colors.grey.withOpacity(0.3)),
							SizedBox(width: 7),
							this.getSkeletonItem(width: 10, height: 5)
						]
					)
				]
			),
		));
	}

	/// 趋势分析面板
	Widget getTrendsItem() {
		return Row(
			mainAxisAlignment: MainAxisAlignment.spaceBetween,
			children: [
				this.getTrendsIcon(Icons.dock, Colors.black, 'Repos', descNum: 1),
				this.getTrendsIcon(Icons.dock, Colors.black.withOpacity(0.3), 'Gists', descNum: 2),
				this.getTrendsIcon(Icons.dock, Colors.black.withOpacity(0.3), 'Private'),
				this.getTrendsIcon(Icons.dock, Colors.black.withOpacity(0.3), 'Owned'),
			]
		);
	}

	/// 趋势小图标
	Widget getTrendsIcon(IconData icon, Color color, String descTitle, {int descNum = 0}) {
		return Column(
			children: [
				Icon(icon, size: 20, color: color.withOpacity(0.3)),
				SizedBox(height: 5),
				this.getSkeletonItem(width: 30, height: 10)
			]
		);
	}

	Widget buildTopStucts() {
		return Container(
			padding: EdgeInsets.fromLTRB(20.0, 25.0, 15.0, 20.0),
			child: Row(
				mainAxisAlignment: MainAxisAlignment.start,
				crossAxisAlignment: CrossAxisAlignment.start,
				children: <Widget>[
					this.getAvataItem(),
					Spacer(),
					this.getEditItem()
				],
			),
		);
	}

	/// 编辑个人信息
	Widget getEditItem() {
		return this.getSkeletonItem(width: 20, height: 8);
	}

	/// 头像信息
	Widget getAvataItem() {
		return Row(
			mainAxisAlignment: MainAxisAlignment.start,
			crossAxisAlignment: CrossAxisAlignment.start,
			children: <Widget>[
				this.getSkeletonItem(
					height: 55.0,
					width: 55.0,
					decoration: BoxDecoration(
						borderRadius: BorderRadius.circular(7),
						color: Colors.grey.withOpacity(0.5),
						boxShadow: [
							BoxShadow(
								color: Colors.grey,
								offset: Offset(1.0, 1.0),
								blurRadius: 1,
								spreadRadius: 1)
						] 
					),
				),
				SizedBox(width: 15.0),
				Column(
					mainAxisAlignment: MainAxisAlignment.start,
					crossAxisAlignment: CrossAxisAlignment.start,
					children: [
						this.getSkeletonItem(width: 150, height: 8),
						SizedBox(height: 10.0),
						this.getSkeletonItem(width: 70, height: 8, color: Colors.grey.withOpacity(0.3)),
					]
				),
			],
		);
	}
}