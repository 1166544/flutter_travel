import 'package:flutter/material.dart';
import 'package:flutter_travel/pages/modules/circler/views/CiclerImproving.dart';
import 'package:flutter_travel/pages/modules/circler/views/CircleTitle.dart';
import 'package:flutter_travel/pages/modules/circler/views/CirclerGrid.dart';
import 'package:flutter_travel/pages/modules/circler/views/CirclerList.dart';
import 'package:flutter_travel/pages/modules/circler/views/CirclerScroll.dart';
import 'package:flutter_travel/pages/modules/circler/views/CirclerSearchBar.dart';
// import 'package:flutter_travel/pages/modules/circler/views/CirclerCover.dart';

/// 资讯显示列表
class CirclerDisplayPage extends StatefulWidget {
  CirclerDisplayPage({Key key}) : super(key: key);

  _CirclerDisplayPageState createState() => _CirclerDisplayPageState();
}

class _CirclerDisplayPageState extends State<CirclerDisplayPage> {
  @override
  Widget build(BuildContext context) {
	return ListView(
			padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
			children: <Widget>[
			// 封面
			// CirclerCover(),

			// 搜索条
			CirclerSearchBar(),

			// 改进提示
			CircleImproving(),

			// 第1行
			CircleTitle(),

			// 第2行 横向滚动列表
			CirclerScroll(),

			// 第3行
			CirclerGrid(),

			// 第四行
			CirclerList()
			
			],
		);
  }
}