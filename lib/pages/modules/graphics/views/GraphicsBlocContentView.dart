import 'package:flutter/material.dart';
import 'package:flutter_travel/core/bloc/BlocProvider.dart';
import 'package:flutter_travel/pages/common/CommonLoading.dart';
import 'package:flutter_travel/pages/common/CommonTravelItem.dart';
import 'package:flutter_travel/pages/modules/graphics/blocs/GraphicsBlocMyInfo.dart';
import 'package:flutter_travel/pages/modules/search/models/SearchModelGallery.dart';

/// 我的信息模块视图
class GraphicsBlocContentView extends StatefulWidget {
  GraphicsBlocContentView({Key key}) : super(key: key);

  _GraphicsBlocContentViewState createState() => _GraphicsBlocContentViewState();
}

class _GraphicsBlocContentViewState extends State<GraphicsBlocContentView> with CommonTravelItem {

	GraphicsBlocMyInfo blocGalleryList;
	GlobalKey<RefreshIndicatorState> refreshKey = GlobalKey<RefreshIndicatorState>();

	@override
	Widget build(BuildContext context) {
		// 连接数据源
		this.blocGalleryList = BlocProvider.of<GraphicsBlocMyInfo>(context);

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
		return StreamBuilder<ModelGallery>(
			stream: this.blocGalleryList.outGallery,
			builder: (context, snapshot) {
				// 数据源到位时渲染列表
				if (snapshot.hasData) {
					return this.buildSearchLayout(snapshot);
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
	Widget buildSearchLayout(AsyncSnapshot<ModelGallery> snapshot) {
		return ListView(
			children: <Widget>[
				// 顶部头像
				this.buildTopStucts(snapshot),

				// 中部报告信息
				this.buildMiddleReportStucts(snapshot),

				// 中部实现信息
				this.buildMiddlePresciptionStucts(snapshot),

				// 中部访问信息
				this.buildMiddleVisitorStucts(snapshot),

				// 底部按钮
				this.buildButtonStucts(snapshot),
			]
		);
	}
	
	/// 顶部头像
	Widget buildTopStucts(AsyncSnapshot<ModelGallery> snapshot) {
		return Container(
			decoration: BoxDecoration(
				color: Color(0xFF45489e),
				borderRadius: BorderRadius.only(
					topLeft: Radius.circular(0.0), 
					topRight: Radius.circular(0.0), 
					bottomLeft: Radius.circular(20.0), 
					bottomRight: Radius.circular(20.0),
				)
			),
			padding: EdgeInsets.fromLTRB(35.0, 65.0, 25.0, 20.0),
			child: Column(
				mainAxisAlignment: MainAxisAlignment.start,
				crossAxisAlignment: CrossAxisAlignment.start,
				children: <Widget>[
					Hero(
						tag: 'assets/chris.jpg',
						child: Container(
							height: 85.0,
							width: 85.0,
							decoration: BoxDecoration(
								borderRadius: BorderRadius.circular(62.5),
								image: DecorationImage(
									fit:BoxFit.cover,
									image: AssetImage('assets/chris.jpg')
								),
								boxShadow: [
									BoxShadow(
										color: Color(0xff302f90),
										offset: Offset(10.0, 8.0),
										blurRadius: 10.5,
										spreadRadius: 8.8)
								] 
							),
						),
					),
					SizedBox(height: 15.0),
					Text(
						'Mark Stewart',
						style: TextStyle(
							fontSize: 18.0,
							color: Colors.white,
							fontWeight: FontWeight.bold
						)
					),
					SizedBox(height: 10.0),
					Text(
						'20mg capsule',
						style: TextStyle(
							fontSize: 12.0,
							color: Color(0xFF8b8cda)
						)
					),
				],
			),
		);
	}
	
	/// 中部报告信息
	Widget buildMiddleReportStucts(AsyncSnapshot<ModelGallery> snapshot) {
		return Container(
			padding: EdgeInsets.fromLTRB(20.0, 35.0, 20.0, 0.0),
			child: Column(
				crossAxisAlignment: CrossAxisAlignment.start,
				children: <Widget>[
					this.getUnderlineText('Reported Ava'),
					SizedBox(height: 15.0),
					Text(
						'2 tables away 6-7 hours nor more than 8 tables \nper day',
						style: TextStyle(
							fontSize: 12.0,
							color: Color(0xFF252949)
						)
					),
					SizedBox(height: 30.0),
					// 绿色进度条
					Text(
						'Taper',
						style: TextStyle(
							fontSize: 12.0,
							color: Colors.grey
						)
					),
					SizedBox(height: 10.0),
					Stack(
						children: <Widget>[
							Container(
								height: 6.0,
								decoration: BoxDecoration(
									borderRadius: BorderRadius.circular(12.0),
									color: Color(0xFFdce5e3)
								),
							),
							Container(
								width: MediaQuery.of(this.context).size.width * 0.50,
								height: 6.0,
								decoration: BoxDecoration(
									borderRadius: BorderRadius.circular(12.0),
									gradient: LinearGradient(
										begin: Alignment.centerLeft,
										end: Alignment.centerRight,
										colors: [
											Color(0xFFe3f2ef),
											Color(0xFF7bc6bc)
										]
									)
								),
							),
						],
					)
				],
			),
		);
	}
	
	/// 中部实现信息
	Widget buildMiddleVisitorStucts(AsyncSnapshot<ModelGallery> snapshot) {
		return Container(
			padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 40.0),
			decoration: BoxDecoration(
				color: Color(0xFFebeff9)
			),
			child: Row(
				crossAxisAlignment: CrossAxisAlignment.center,
				mainAxisAlignment: MainAxisAlignment.spaceEvenly,
				children: <Widget>[
					this.getVisitorItem(90, 'Unknow', 0.0),
					this.getVisitorItem(11, 'Famillar', 0.4),
					this.getVisitorItem(6, 'Excellent', 1.0),
				]
			)
		);
	}
	
	/// 中部访问信息
	Widget buildMiddlePresciptionStucts(AsyncSnapshot<ModelGallery> snapshot) {
		return Container(
			padding: EdgeInsets.fromLTRB(20.0, 55.0, 20.0, 45.0),
			child: Column(
				crossAxisAlignment: CrossAxisAlignment.start,
				children: <Widget>[
					this.getUnderlineText('Prescription'),
					SizedBox(height: 15.0),
					Container(
						decoration: BoxDecoration(
							color: Color(0xFFe1e6f0)
						),
						padding: EdgeInsets.all(18.0),
						child: Column(
							children: <Widget>[
								this.getPresciptonItem('Learned phrases', '12'),
								SizedBox(height: 12),
								this.getPresciptonItem('Phrases left to learn', '36'),
								SizedBox(height: 12),
								this.getPresciptonItem('Total learning time', '8.2h'),
							],
						),
					),
					SizedBox(height: 15.0),
					Text(
						'730',
						style: TextStyle(
							fontSize: 39.0,
							color: Colors.black,
							fontWeight: FontWeight.bold
						)
					),
					Row(
						children: <Widget>[
							Text(
								'visitors last 7 days',
								style: TextStyle(
									fontSize: 19.0,
									color: Color(0xFF9395a3)
								)
							),
							Icon(Icons.arrow_right, color: Color(0xFF9395a3))
						],
					)
				]
			)
		);
	}
	
	/// 底部按钮
	Widget buildButtonStucts(AsyncSnapshot<ModelGallery> snapshot) {
		// return Text('test');
		return Container(
			padding: EdgeInsets.fromLTRB(20.0, 25.0, 20.0, 40.0),
			child: GestureDetector(
				onTap: () {
					// hole
				},
				child: Container(
					decoration: BoxDecoration(
						color: Color(0xFF5e82f5),
						borderRadius: BorderRadius.circular(9.0)
					),
					padding: EdgeInsets.all(10.0),
					child: Center(
						child: Text(
							'Logout system here',
							style: TextStyle(
								fontSize: 19.0,
								fontWeight: FontWeight.bold,
								color: Colors.white
							)
						),
					),
				)
			)
		);
	}

	/// 访问人数显示项
	Widget getVisitorItem(int score, String desc, double process) {
		final double cellWidth = 100.0;
		return Container(
			decoration: BoxDecoration(
				color: Colors.white,
				borderRadius: BorderRadius.circular(10.0)
			),
			width: cellWidth,
			height: 130.0,
			padding: EdgeInsets.only(left: 15.0, right: 15.0),
			child: Column(
				mainAxisAlignment: MainAxisAlignment.center,
				children: <Widget>[
					Text(
						score.toString(),
						style: TextStyle(
							fontSize: 28.0,
							fontWeight: FontWeight.bold,
							color: score > 50 ? Color(0xFF6d6d8d) : Colors.black
						)
					),
					SizedBox(height: 15.0),
					Text(
						desc,
						style: TextStyle(
							fontSize: 15.0,
							fontWeight: FontWeight.bold,
							color: score > 50 ? Color(0xFF6d6d8d) : Colors.black
						)
					),
					SizedBox(height: 15.0),
					Stack(
						children: <Widget>[
							Container(
								height: 4.0,
								decoration: BoxDecoration(
									borderRadius: BorderRadius.circular(18.0),
									color: Color(0xFFdce5e3)
								),
							),
							Container(
								width: cellWidth * process,
								height: 4.0,
								decoration: BoxDecoration(
									borderRadius: BorderRadius.circular(18.0),
									gradient: LinearGradient(
										begin: Alignment.centerLeft,
										end: Alignment.centerRight,
										colors: [
											Color(0xFF5e82f5),
											Color(0xFF5e82f5)
										]
									)
								),
							),
						],
					)
				],
			),
		);
	}

	/// 实现横条内容
	Widget getPresciptonItem(String title, String subTitle) {
		return Row(
			children: <Widget>[
				Text(
					title,
					style: TextStyle(
						fontSize: 12.0,
						color: Colors.black
					)
				),
				Spacer(),
				Text(
					subTitle,
					style: TextStyle(
						fontSize: 12.0,
						color: Colors.black,
						fontWeight: FontWeight.bold
					)
				)
			],
		);
	}

	/// 带黄底横线标题
	Widget getUnderlineText(String content) {
		return Text(
			content,
			style: TextStyle(
				fontSize: 16.0,
				color: Color(0xFF252949),
				decorationColor: Color(0xffffefdb),
				decorationThickness: 4.0,
				fontWeight: FontWeight.bold,
				decoration: TextDecoration.underline
			)
		);
	}
	
}
