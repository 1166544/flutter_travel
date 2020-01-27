import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_travel/core/bloc/BlocProvider.dart';
import 'package:flutter_travel/modules/common/CommonTravelItem.dart';
import 'package:flutter_travel/modules/profile/blocs/BlocMyInfo.dart';
import 'package:flutter_travel/modules/profile/models/ModelProfile.dart';
import 'package:flutter_travel/modules/profile/views/components/ComponentMiddleReport.dart';
import 'package:flutter_travel/modules/profile/views/components/ComponentPresciption.dart';
import 'package:flutter_travel/modules/profile/views/components/ComponentProfileChart.dart';
import 'package:flutter_travel/modules/profile/views/components/ComponentTopStructs.dart';
import 'package:flutter_travel/modules/profile/views/components/ComponentVisitors.dart';
import 'package:flutter_travel/redux/actions/ActionAuth.dart';
import 'package:flutter_travel/redux/states/StateApp.dart';

/// 我的信息模块视图
class ComponentBlocContent extends StatefulWidget {
  ComponentBlocContent({Key key}) : super(key: key);

  _ComponentBlocContentState createState() => _ComponentBlocContentState();
}

class _ComponentBlocContentState extends State<ComponentBlocContent> with CommonTravelItem {

	BlocMyInfo blocGalleryList;
	GlobalKey<RefreshIndicatorState> refreshKey = GlobalKey<RefreshIndicatorState>();

	@override
	Widget build(BuildContext context) {
		// 连接数据源
		this.blocGalleryList = BlocProvider.of<BlocMyInfo>(context);

		// 连接视图, 加上下拉刷新
		return RefreshIndicator(
			key: refreshKey,
			color: Colors.lightBlue,
			child: this.getStreamBuilder(context),
			onRefresh: refreshData,
		);
	}

	@override
	void dispose() {
		super.dispose();
		this.blocGalleryList.dispose();
	}

	/// 更新视图
	Future<Null> refreshData() async {
		await this.blocGalleryList.update();
	}

	/// 连接stream数据源
	Widget getStreamBuilder(BuildContext context) {
		return StreamBuilder<ModelProfile>(
			stream: this.blocGalleryList.outGallery,
			builder: (context, snapshot) {
				// 数据源到位时渲染列表
				return this.buildSearchLayout(snapshot);
				// if (snapshot.hasData) {
				// 	return this.buildSearchLayout(snapshot);
				// } else {
				// 	return this.buildEmptyLayout(context);
				// }
			},
		);
	}

	/// 基础页面结构
	Widget buildSearchLayout(AsyncSnapshot<ModelProfile> snapshot) {
		return ListView(
			children: <Widget>[
				// 顶部头像
				this.buildTopStucts(snapshot),

				// 中部报告信息
				this.buildMiddleReportStucts(snapshot),

				// 中部表格
				this.buildMiddleChart(),

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
	Widget buildTopStucts(AsyncSnapshot<ModelProfile> snapshot) {
		return ComponentTopStructs(snapshot: snapshot);
	}
	
	/// 中部报告信息
	Widget buildMiddleReportStucts(AsyncSnapshot<ModelProfile> snapshot) {
		return ComponentMiddleReport(snapshot: snapshot);
	}
	
	/// 中部访问信息
	Widget buildMiddleVisitorStucts(AsyncSnapshot<ModelProfile> snapshot) {
		return ComponentVisitors(snapshot: snapshot);
	}
	
	/// 中部实现信息
	Widget buildMiddlePresciptionStucts(AsyncSnapshot<ModelProfile> snapshot) {
		return ComponentPresciption(snapshot: snapshot);
	}
	
	/// 底部按钮
	Widget buildButtonStucts(AsyncSnapshot<ModelProfile> snapshot) {
		return StoreConnector<AppState, dynamic>(
			converter: (store) => (BuildContext context) {
				store.dispatch(logout(context));
			},
			builder: (BuildContext context, logout) => Container(
				padding: EdgeInsets.fromLTRB(20.0, 25.0, 20.0, 40.0),
				child: GestureDetector(
					onTap: () => logout(context),
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
			)
		);
	}

	/// 中部表格
  	Widget buildMiddleChart() {
		return Container(
			padding: EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 0.0),
			child: ComponentProfileChart(),
		);
	}

}
