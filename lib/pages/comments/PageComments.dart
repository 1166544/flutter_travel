import 'package:flutter/material.dart';
import 'package:flutter_travel/common/CommonNavigator.dart';

/// 留言区
class PageComments extends StatefulWidget {
  @override
  _PageCommentsState createState() => _PageCommentsState();
}

class _PageCommentsState extends State<PageComments> with CommonNavigator {
  @override
  Widget build(BuildContext context) {
	return Scaffold(
		appBar: this.getAppBar(context, 'Messages'),
		body: ListView(
			children: <Widget>[
				// 留言标题
				// 蓝色图片区
				// 留言列表
			],
		),
	);
  }
}
