import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_travel/pages/common/CommonNavigator.dart';
import 'package:flutter_travel/pages/modules/news/NewsList.dart';
import 'package:flutter_travel/redux/states/StateApp.dart';
import 'package:redux/redux.dart';

/// 资讯模块
class NewsPage extends StatefulWidget {
	final Store<AppState> store;

	NewsPage({Key key, this.store}) : super(key: key);

	_NewsPageState createState() => _NewsPageState();
}

/// 资讯页面，无APPBAR
class _NewsPageState extends State<NewsPage> with CommonNavigator, SingleTickerProviderStateMixin {

	final List<Tab> tabsData = <Tab>[
		Tab(text: 'LEFT'),
		Tab(text: 'RIGHT'),
	];

	TabController _tabController;
	
	@override
	void initState() {
		super.initState();
		_tabController = TabController(vsync: this, length: tabsData.length);
	}

	@override
	void dispose() {
		_tabController.dispose();
		super.dispose();
	}
	
	@override
	Widget build(BuildContext context) {
		return StoreProvider<AppState>(
			store: widget.store,
			child: this.getPageEntrance(context)
		);
	}

	/// 页面入口
	Widget getPageEntrance(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				backgroundColor: Colors.white,
				bottom: TabBar(
					controller: this._tabController,
					tabs: this.tabsData,
					labelColor: Colors.black,
					indicatorColor: Color(0xFF5e81f4),
					indicatorWeight: 3.0,
				),
				title: Text('Materials', style: TextStyle(color: Colors.black)),
			),
			body: TabBarView(
				controller: this._tabController,
				children: <Widget>[
					NewsList(),
					NewsList(),
				],
			),
		);
	}

}
