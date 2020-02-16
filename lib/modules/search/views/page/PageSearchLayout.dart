import 'package:flutter/material.dart';

class PageSearchLayout extends StatefulWidget {
	PageSearchLayout({Key key}) : super(key: key);

	_PageSearchLayoutState createState() => _PageSearchLayoutState();
}

class _PageSearchLayoutState extends State<PageSearchLayout> {
	@override
	Widget build(BuildContext context) {
		return Text('data');
	}

	/// 页面布局
	Widget getBody() {
		return Text('test');
	}
}