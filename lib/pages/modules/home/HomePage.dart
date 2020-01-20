import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_travel/core/bloc/BlocProvider.dart';
import 'package:flutter_travel/pages/common/CommonNavigator.dart';
import 'package:flutter_travel/pages/modules/home/blocs/BlocNewsList.dart';
import 'package:flutter_travel/pages/modules/home/views/pages/PageDisplay.dart';
import 'package:flutter_travel/pages/modules/home/views/pages/PageFashion.dart';
import 'package:flutter_travel/pages/modules/home/views/pages/PageGlobal.dart';
import 'package:flutter_travel/pages/modules/home/views/pages/PageMilitary.dart';
import 'package:flutter_travel/pages/modules/home/views/pages/PageSociality.dart';
import 'package:flutter_travel/redux/actions/ActionPage.dart';
import 'package:flutter_travel/redux/states/StateApp.dart';
import 'package:redux/redux.dart';

/// 资讯内容页面
class HomePage extends StatefulWidget {
	final Widget child;

	HomePage({Key key, this.child}) : super(key: key);

	_HomePageState createState() => _HomePageState();
}

/// 我的内容（新闻列表）
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
		PageDisplay(requestParams: ''),
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
				bloc: BlocNewsList(),
				child: TabBarView(
					controller: this._tabController,
					children: this._tabsView,
				),
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

	/// Redux数据调用: 绑定全局动态标题
	Widget getSearchTitle() {
		return StoreConnector<AppState, dynamic>(
			converter: (store) {
				if (this.store == null) {
					// 更新第1个标题
					this.store = store;
					this._updateTitle(this._tabsData[0].text);
				}
				return store.state.auth.toString();
			},
			builder: (context, auth) {
				// return Text('Materials - 60 分钟杂志 ${auth.toString()}',
				return Text('Materials - 60 Minute Manaze',
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
