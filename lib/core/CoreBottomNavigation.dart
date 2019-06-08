import 'package:flutter/material.dart';
import 'package:flutter_travel/pages/PageCircler.dart';
import 'package:flutter_travel/pages/PageGraphics.dart';
import 'package:flutter_travel/pages/PageHome.dart';
import 'package:flutter_travel/pages/PageSearch.dart';

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
class BottomNavigation extends StatefulWidget {
	@override
	State<StatefulWidget> createState() => BottomNavigationState();
}

/// TAB VIEW STATE入口类
class BottomNavigationState extends State<BottomNavigation> {
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
			// Home
			case TabItem.Home:
				return PageSearch();

			// Search
			case TabItem.Search:
				return PageHome();

			// Graphics
			case TabItem.Graphics:
				return PageGraphics();

			// Circler
			case TabItem.Circler:
				return PageCircler();

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
		return currentItem == item ? Theme.of(context).primaryColor : Colors.grey;
	}
}
