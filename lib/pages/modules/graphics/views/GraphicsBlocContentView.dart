import 'package:flutter/material.dart';
import 'package:flutter_travel/core/bloc/BlocProvider.dart';
import 'package:flutter_travel/pages/common/CommonLoading.dart';
import 'package:flutter_travel/pages/common/CommonTravelItem.dart';
import 'package:flutter_travel/pages/modules/graphics/blocs/GraphicsBlocMyInfo.dart';
import 'package:flutter_travel/pages/modules/graphics/models/GraphicsBlocModel.dart';
import 'package:flutter_travel/pages/modules/graphics/views/GraphicsPresciption.dart';
import 'package:flutter_travel/pages/modules/graphics/views/GraphicsTopStructs.dart';
import 'package:flutter_travel/pages/modules/graphics/views/GraphicsVisitors.dart';
import 'package:flutter_travel/pages/modules/graphics/views/GriaphicsMiddleReport.dart';

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
		return StreamBuilder<GraphicsBlocModel>(
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
	Widget buildSearchLayout(AsyncSnapshot<GraphicsBlocModel> snapshot) {
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
	Widget buildTopStucts(AsyncSnapshot<GraphicsBlocModel> snapshot) {
		return GraphicsTopStructs(snapshot: snapshot);
	}
	
	/// 中部报告信息
	Widget buildMiddleReportStucts(AsyncSnapshot<GraphicsBlocModel> snapshot) {
		return GraphicsMiddleReport(snapshot: snapshot);
	}
	
	/// 中部访问信息
	Widget buildMiddleVisitorStucts(AsyncSnapshot<GraphicsBlocModel> snapshot) {
		return GraphicsVisitors(snapshot: snapshot);
	}
	
	/// 中部实现信息
	Widget buildMiddlePresciptionStucts(AsyncSnapshot<GraphicsBlocModel> snapshot) {
		return GraphicsPresciption(snapshot: snapshot);
	}
	
	/// 底部按钮
	Widget buildButtonStucts(AsyncSnapshot<GraphicsBlocModel> snapshot) {
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

}
