import 'package:flutter/material.dart';
import './pages/Circler.dart';
import './pages/Graphics.dart';
import './pages/Search.dart';
import './pages/home.dart';

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

/// 首页
class _TravelHomePageState extends State<TravelHomePage> with SingleTickerProviderStateMixin {

	int _currentIndex = 0;
	List<Widget> _bodysView= [
		HomePage(),
		SearchPage(),
		GraphicsPage(),
		CirclerPage(),
	];
	List<String> _bodysMenu = [
		'Home', 'Search', 'Graphics', 'Circler'
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
			body: _bodysView[this._currentIndex],

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
			BottomNavigationBarItem(
				icon: this._currentIndex == 0
					? Icon(Icons.home, color: Colors.black)
					: Icon(Icons.home, color: Colors.grey),
				title: Text(this._bodysMenu[this._currentIndex]),
			),
			BottomNavigationBarItem(
				icon: this._currentIndex == 1
					? Icon(Icons.search, color: Colors.black)
					: Icon(Icons.search, color: Colors.grey),
				title: Text(this._bodysMenu[this._currentIndex]),
			),
			BottomNavigationBarItem(
				icon: this._currentIndex == 2
					? Icon(Icons.graphic_eq, color: Colors.black)
					: Icon(Icons.graphic_eq, color: Colors.grey),
				title: Text(this._bodysMenu[this._currentIndex]),
			),
			BottomNavigationBarItem(
				icon: this._currentIndex == 3
					? Icon(Icons.add_circle_outline, color: Colors.black)
					: Icon(Icons.add_circle_outline, color: Colors.grey),
				title: Text(this._bodysMenu[this._currentIndex]),
			)
		];
	}
}
