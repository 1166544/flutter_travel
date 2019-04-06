import 'package:flutter/material.dart';
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

	TabController tabController;
	var tripDetails;

	/// 初始化
	@override
	void initState() {
		super.initState();
		//  初始化TAB数量
		this.tabController = new TabController(length: 4, vsync: this);
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			bottomNavigationBar: Material(
			color: Colors.white,
			// 绑定TAB按钮
			child: TabBar(
				controller: this.tabController,
				indicatorColor: Colors.white,
				tabs: <Widget>[
					Tab(icon: Icon(Icons.home, color: Colors.black)),
					Tab(icon: Icon(Icons.search, color: Colors.grey)),
					Tab(icon: Icon(Icons.graphic_eq, color: Colors.grey)),
					Tab(icon: Icon(Icons.add_circle_outline, color: Colors.grey))
				]
				),
			),
			backgroundColor: Colors.white,
			// 绑定TAB内容
			body:HomePage(),
		);
  }
}
