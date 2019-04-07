import 'package:flutter/material.dart';
import 'package:flutter_travel/common/CommonPageData.dart';
import 'package:flutter_travel/pages/PageCircler.dart';
import 'package:flutter_travel/pages/PageGraphics.dart';
import 'package:flutter_travel/pages/PageHome.dart';
import 'package:flutter_travel/pages/PageSearch.dart';

void main() => runApp(TravelApp());

class TravelApp extends StatelessWidget {
  // 程序根目录
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TravelHomePage()
    );
  }
}

/// 入口类
class TravelHomePage extends StatefulWidget {
	@override
	_TravelHomePageState createState() => _TravelHomePageState();
}

/// 定义菜单和图标
class _TravelHomePageState extends State<TravelHomePage> with SingleTickerProviderStateMixin {

	int _currentIndex = 1;
	List<CommonPageData> _bodysView= [
		CommonPageData(view: new PageHome(), pageTitle: 'Home', icon: Icons.home),
		CommonPageData(view: new PageSearch(), pageTitle: 'Search', icon: Icons.search),
		CommonPageData(view: new PageGraphics(), pageTitle: 'Graphics', icon: Icons.graphic_eq),
		CommonPageData(view: new PageCircler(), pageTitle: 'Circler', icon: Icons.home),
	];

	/// 初始化
	@override
	void initState() {
		super.initState();
	}

	/// 回收操作
	@override
	void dispose() {
		super.dispose();
	}

	/// TAB更改事件
	void onTabTapped(int index) {
		setState(() {
			this._currentIndex = index;
		});
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			// 绑定TAB内容
			body: _bodysView[this._currentIndex].view,

			// 绑定TAB菜单
			bottomNavigationBar: BottomNavigationBar(
				currentIndex: this._currentIndex,
				onTap: this.onTabTapped,
				fixedColor: Colors.black,
				type: BottomNavigationBarType.fixed,
				items: this.getTabBarMenu()
			)
		);
    }

	/// TAB菜单
	List<BottomNavigationBarItem> getTabBarMenu() {
		return [
			this.getBottomNavigationBarItem(0),
			this.getBottomNavigationBarItem(1),
			this.getBottomNavigationBarItem(2),
			this.getBottomNavigationBarItem(3)
		];
	}

	/// 单个菜单按钮定义
	BottomNavigationBarItem getBottomNavigationBarItem(int index) {
		CommonPageData pageData = this._bodysView[index];

		return BottomNavigationBarItem(
			icon: this._currentIndex == index
				? Icon(pageData.icon, color: Colors.black)
				: Icon(pageData.icon, color: Colors.grey),
			title: Text(pageData.pageTitle),
		);
	}
}
