import 'package:flutter/material.dart';
import 'package:flutter_travel/pages/modules/circler/components/CircleTitle.dart';
import 'package:flutter_travel/pages/modules/circler/components/CirclerGrid.dart';
import 'package:flutter_travel/pages/modules/circler/components/CirclerList.dart';
import 'package:flutter_travel/pages/modules/circler/components/CirclerScroll.dart';
// import 'package:flutter_travel/pages/modules/circler/components/CirclerCover.dart';

/// 资讯内容页面
class CirclerPage extends StatefulWidget {
  final Widget child;

  CirclerPage({Key key, this.child}) : super(key: key);

  _CirclerState createState() => _CirclerState();
}

/// 我的内容
class _CirclerState extends State<CirclerPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      children: <Widget>[
        // 封面
        // CirclerCover(),

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
