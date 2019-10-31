import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_travel/core/navigation/NavigationTabCore.dart';
import 'package:flutter_travel/core/navigation/NavigationTabItem.dart';
import 'package:flutter_travel/pages/modules/circler/CirclerPage.dart';
import 'package:flutter_travel/pages/modules/graphics/GraphicsPage.dart';
import 'package:flutter_travel/pages/modules/home/HomePage.dart';
import 'package:flutter_travel/pages/modules/search/SearchPage.dart';
import 'package:flutter_travel/redux/states/StateGlobal.dart';
import 'package:redux/redux.dart';

/// TAB VIEW STATE入口类
class NavigationTabCoreState extends State<NavigationTabCore> {
	final Store<StateGlobal> store;
	NavigationTabCoreState(Store<StateGlobal> store) : store = store;
	Map<NavigationTabItem, Widget> mapPageList = new Map<NavigationTabItem, Widget>();
	NavigationTabItem currentItem = NavigationTabItem.Home;

	/// TAB选择处理
	_onSelectTab(int index) {
		switch (index) {
		case 0:
			this._updateCurrentItem(NavigationTabItem.Home);
			break;
		case 1:
			this._updateCurrentItem(NavigationTabItem.Search);
			break;
		case 2:
			this._updateCurrentItem(NavigationTabItem.Graphics);
			break;
		case 3:
			this._updateCurrentItem(NavigationTabItem.Circler);
			break;
		}
	}

	/// 更新TAB状态
	_updateCurrentItem(NavigationTabItem item) {
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

	/// 储存主要首页
	/// * [TabItem tabItem] 页面枚举
	Widget getMapPage(NavigationTabItem tabItem) {
		try {
		  	if (this.mapPageList[tabItem] != null) {
				return this.mapPageList[tabItem];
			}
		} catch (e) {
			print(e);
		}

		switch (tabItem) {
			case NavigationTabItem.Home:
				// Home模块
				this.mapPageList[tabItem] = SearchPage();
				break;
			case NavigationTabItem.Search:
				// Search模块
				this.mapPageList[tabItem] = HomePage();
				break;
			case NavigationTabItem.Graphics:
				// Graphics模块
				this.mapPageList[tabItem] = GraphicsPage();
				break;
			case NavigationTabItem.Circler:
				// Circler模块
				this.mapPageList[tabItem] = CirclerPage();
				break;
		}

		return this.mapPageList[tabItem];
	}

	/// 构建界面
	Widget _buildBody() {
		return StoreProvider<StateGlobal>(
			store: this.store,
			child: this.getMapPage(currentItem)
		);
	}

	/// 底部TAB按钮
	Widget _buildBottomNavigationBar() {
		return BottomNavigationBar(
			type: BottomNavigationBarType.fixed,
			items: [
				this._buildItem(icon: Icons.home, tabItem: NavigationTabItem.Home),
				this._buildItem(icon: Icons.search, tabItem: NavigationTabItem.Search),
				this._buildItem(icon: Icons.graphic_eq, tabItem: NavigationTabItem.Graphics),
				this._buildItem(icon: Icons.account_circle, tabItem: NavigationTabItem.Circler),
			],
			onTap: this._onSelectTab,
		);
	}

	/// 单个TAB按钮
	/// *[IconData icon] 标题数据
	/// *[TabItem tabItem] TAB数据
	BottomNavigationBarItem _buildItem({IconData icon, NavigationTabItem tabItem}) {
		String text = this.tabItemName(tabItem);
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

	/// TAB数据源
	String tabItemName(NavigationTabItem tabItem) {
		switch (tabItem) {
			case NavigationTabItem.Home:
				return "Home";
			case NavigationTabItem.Search:
				return "Search";
			case NavigationTabItem.Graphics:
				return "Graphics";
			case NavigationTabItem.Circler:
				return "Circler";
		}
		return null;
	}

	/// TAB选中状态颜色更改
	/// * [TabItem item] TAB数据
	Color _colorTabMatching({NavigationTabItem item}) {
		// 选中时使用系统色，未选中灰度
		return currentItem == item ? Theme.of(context).primaryColor : Colors.grey;
	}
}