import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_travel/pages/modules/circler/CirclerPage.dart';
import 'package:flutter_travel/pages/modules/graphics/GraphicsPage.dart';
import 'package:flutter_travel/pages/modules/home/HomePage.dart';
import 'package:flutter_travel/pages/modules/search/SearchPage.dart';
import 'package:flutter_travel/redux/states/StateGlobal.dart';
import 'package:redux/redux.dart';

/// TAB枚举
enum TabItem {
	Home,
	Search,
	Graphics,
	Circler,
}

/// TAB数据源
String tabItemName(TabItem tabItem) {
	switch (tabItem) {
		case TabItem.Home:
			return "Home";
		case TabItem.Search:
			return "Search";
		case TabItem.Graphics:
			return "Graphics";
		case TabItem.Circler:
			return "Circler";
		}
	return null;
}

/// 底部TAB按钮入口类
class NavigationTabCore extends StatefulWidget {
	final Store<StateGlobal> store;
	NavigationTabCore({Key key, this.store}) : super(key: key);

	@override
	State<StatefulWidget> createState() => NavigationTabCoreState(this.store);
}

/// TAB VIEW STATE入口类
class NavigationTabCoreState extends State<NavigationTabCore> {
	final Store<StateGlobal> store;
	NavigationTabCoreState(Store<StateGlobal> store) : store = store;

	TabItem currentItem = TabItem.Home;

	/// TAB选择处理
	_onSelectTab(int index) {
		switch (index) {
			case 0:
				this._updateCurrentItem(TabItem.Home);
			break;
			case 1:
				this._updateCurrentItem(TabItem.Search);
			break;
			case 2:
				this._updateCurrentItem(TabItem.Graphics);
			break;
			case 3:
				this._updateCurrentItem(TabItem.Circler);
			break;
		}
	}

	/// 更新TAB状态
	_updateCurrentItem(TabItem item) {
		setState(() {
			currentItem = item;
		});
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			body: this._buildBody(),
			bottomNavigationBar: this._buildBottomNavigationBar(),
		);
	}

	/// 构建界面
	Widget _buildBody() {
		// var database = AppDatabase();
		// var stream = database.countersStream();
		switch (currentItem) {
			// Home模块
			case TabItem.Home:
				return StoreProvider<StateGlobal>(
					store: this.store,
					child: SearchPage(),
				);

			// Search模块
			case TabItem.Search:
				return StoreProvider<StateGlobal>(
					store: this.store,
					child: HomePage(),
				);

			// Graphics模块
			case TabItem.Graphics:
				return StoreProvider<StateGlobal>(
					store: this.store,
					child: GraphicsPage(),
				);

			// Circler模块
			case TabItem.Circler:
				return StoreProvider<StateGlobal>(
					store: this.store,
					child: CirclerPage(),
				);
		}

		return Container();
	}

	/// 底部TAB按钮
	Widget _buildBottomNavigationBar() {
		return BottomNavigationBar(
			type: BottomNavigationBarType.fixed,
			items: [
				this._buildItem(icon: Icons.home, tabItem: TabItem.Home),
				this._buildItem(icon: Icons.search, tabItem: TabItem.Search),
				this._buildItem(icon: Icons.graphic_eq, tabItem: TabItem.Graphics),
				this._buildItem(icon: Icons.account_circle, tabItem: TabItem.Circler),
			],
			onTap: this._onSelectTab,
		);
	}

	/// 单个TAB按钮
	BottomNavigationBarItem _buildItem({IconData icon, TabItem tabItem}) {
		String text = tabItemName(tabItem);
		return BottomNavigationBarItem(
			icon: Icon(
				icon,
				color: this._colorTabMatching(item: tabItem),
			),
			title: Text(
				text,
				style: TextStyle(color: this._colorTabMatching(item: tabItem)),
			)
		);
	}

	/// TAB选中状态颜色更改
	Color _colorTabMatching({TabItem item}) {
    // 选中时使用系统色，未选中灰度
		return currentItem == item ? Theme.of(context).primaryColor : Colors.grey;
	}
}
