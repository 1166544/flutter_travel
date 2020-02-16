import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_travel/modules/common/CommonNavigator.dart';
import 'package:flutter_travel/modules/common/CommonText.dart';
import 'package:flutter_travel/modules/search/views/components/ComponentSearchStructs.dart';

/// 搜索页
class SearchPage extends StatefulWidget {
  final Widget child;

  SearchPage({Key key, this.child}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> with CommonNavigator {
	/// 隐藏页面头部效果
	@override
	Widget build(BuildContext context) {
		return Container(
			child: AnnotatedRegion<SystemUiOverlayStyle>(
				value: SystemUiOverlayStyle.dark,
				child: Scaffold(
					appBar: PreferredSize(
						child: Offstage(
							offstage: true,
							child: AppBar(
								title: CommonText(''),
								brightness: Brightness.dark
							)
						),
						preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 007),
					),
					body: this.getBody()
				),
			),
		);
	}

	/// 页面布局
	Widget getBody() {
		return Padding(
			padding: EdgeInsets.fromLTRB(0, MediaQuery.of(context).padding.top, 0, 0),
			child: ComponentSearchStructs(),
		);
	}
}
