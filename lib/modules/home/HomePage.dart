import 'package:flutter/material.dart';
import 'package:flutter_travel/core/bloc/BlocProvider.dart';
import 'package:flutter_travel/core/manager/ManagerGlobal.dart';
import 'package:flutter_travel/modules/common/CommonNavigator.dart';
import 'package:flutter_travel/modules/home/blocs/BlocNewsList.dart';
import 'package:flutter_travel/modules/home/views/pages/PageFashion.dart';
import 'package:flutter_travel/modules/home/views/pages/PageFocus.dart';
import 'package:flutter_travel/modules/home/views/pages/PageGlobal.dart';
import 'package:flutter_travel/modules/home/views/pages/PageMilitary.dart';
import 'package:flutter_travel/modules/home/views/pages/PageSociality.dart';
import 'package:flutter_travel/redux/actions/ActionPage.dart';
import 'package:flutter_travel/redux/states/StateApp.dart';
import 'package:redux/redux.dart';

/// 资讯内容页面
class HomePage extends StatefulWidget {
	final Widget child;

	HomePage({Key key, this.child}) : super(key: key);

	_HomePageState createState() => _HomePageState();
}

/// 首页
class _HomePageState extends State<HomePage> with CommonNavigator, SingleTickerProviderStateMixin {

	/// TAB菜单
	final List<Tab> _tabsData = <Tab>[
		Tab(text: '头条'),
		Tab(text: '时尚'),
		Tab(text: '军事'),
		Tab(text: '社会'),
		Tab(text: '国际'),
	];

	/// TAB视图
	final List<Widget> _tabsView = <Widget>[
		PageFocus(),
		PageFashion(),
		PageMilitary(),
		PageSociality(),
		PageGlobal(),
	];

	TabController _tabController;
	Store<AppState> store;

	@override
	void initState() {
		super.initState();
		this._tabController = new TabController(vsync: this, length: this._tabsData.length);
		this._tabController.addListener(this.onTapUpdate);
	}

	/// TAB更新
	void onTapUpdate() {
		// print(this._tabController.toString());
		// print(this._tabController.index);
		// print(this._tabController.length);
		// print(this._tabController.previousIndex);
		// print(this._tabsData[this._tabController.index].text);
		// 更新选中标题
		this._updateTitle(this._tabsData[this._tabController.index].text);
	} 

	@override
	Widget build(BuildContext context) {
		this.store = ManagerGlobal.instance.getStoreInstance();
		this._updateTitle(this._tabsData[0].text);

		return Scaffold(
			// appBar: AppBar(
			// 	elevation: 0.0,
			// 	backgroundColor: Colors.white,
			// ),
			body: Column(
				crossAxisAlignment: CrossAxisAlignment.start,
				children: [
					Container(
						padding: EdgeInsets.fromLTRB(10, 50, 0, 0),
						decoration: BoxDecoration(
							color: Colors.white.withOpacity(0.0),
							border: Border(
								bottom: BorderSide(
									color: Colors.grey.withOpacity(0.5), 
									width: 0.8
								)
							)
						),
						child: TabBar(
							controller: this._tabController,
							indicatorColor: Color(0xFF5e81f4),
							labelColor: Colors.black,
							tabs: this._tabsData,
						)
					),
					SizedBox(height: 5),
					Expanded(child: BlocProvider(
						bloc: blocNewsList,
						child: TabBarView(
							controller: this._tabController,
							children: this._tabsView,
						),
					))
				]
			),
		);
	}

	/// 更新标题
	void _updateTitle(String title) {
		if (this.store != null) {
			this.store.dispatch(ActionPageUpdate(title));
		}
	}

	@override
	void dispose() {
		this._tabController.dispose();
		super.dispose();
	}

}
