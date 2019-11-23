import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_travel/core/bloc/BlocProvider.dart';
import 'package:flutter_travel/pages/common/CommonNavigator.dart';
import 'package:flutter_travel/pages/modules/circler/blocs/CirclerBlocNewsList.dart';
import 'package:flutter_travel/pages/modules/circler/views/pages/CircleFashionPage.dart';
import 'package:flutter_travel/pages/modules/circler/views/pages/CircleMilitaryPage.dart';
import 'package:flutter_travel/pages/modules/circler/views/pages/CirclerDisplayPage.dart';
import 'package:flutter_travel/pages/modules/circler/views/pages/CirclerGlobalPage.dart';
import 'package:flutter_travel/pages/modules/circler/views/pages/CirclerSocialityPage.dart';
import 'package:flutter_travel/redux/states/StateGlobal.dart';

/// 资讯内容页面
class CirclerPage extends StatefulWidget {
	final Widget child;

	CirclerPage({Key key, this.child}) : super(key: key);

	_CirclerState createState() => _CirclerState();
}

/// 我的内容（新闻列表）
class _CirclerState extends State<CirclerPage> with CommonNavigator, SingleTickerProviderStateMixin {

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
		CirclerDisplayPage(requestParams: ''),
		CircleFashionPage(),
		CircleMilitaryPage(),
		CirclerSocialityPage(),
		CirclerGlobalPage(),
	];

	TabController _tabController;

	@override
	void initState() {
		super.initState();
		this._tabController = new TabController(vsync: this, length: this._tabsData.length);
	}

	@override
	void dispose() {
		this._tabController.dispose();
		super.dispose();
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Center(
					child: this.getSearchTitle(),
				),
				elevation: 0.0,
				backgroundColor: Colors.white,
				bottom: TabBar(
					controller: this._tabController,
					tabs: this._tabsData,
					labelColor: Colors.black,
					indicatorColor: Color(0xFF5e81f4),
					indicatorWeight: 3.0,
				)
			),
			body: BlocProvider(
				bloc: CirclerBlocNewsList(),
				child: TabBarView(
					controller: this._tabController,
					children: this._tabsView,
				),
			),
		);
	}

	/// Redux数据调用: 绑定全局动态标题
	Widget getSearchTitle() {
		return StoreConnector<StateGlobal, int>(
			converter: (store) => store.state.count,
			builder: (context, count) {
				return Text('Materials - 60 Minutes ${count.toString()}',
					style: TextStyle(
					color: Colors.black,
					fontWeight: FontWeight.bold,
					fontSize: 20.0
					)
				);
			}
		);
	}
}
