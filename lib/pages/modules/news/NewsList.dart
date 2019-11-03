import 'package:flutter/material.dart';
import 'package:flutter_travel/pages/common/CommonNavigator.dart';

/// 资讯列表
class NewsList extends StatefulWidget {

	_NewsListState createState() => _NewsListState(); 
}

/// 资讯页面 
class _NewsListState extends State<NewsList> with CommonNavigator {
	
	@override
	Widget build(BuildContext context) {
		return Column(
			children: <Widget>[
				// 搜索框
				this.getSearchBar(),
				
				// 装饰条 
				this.getDecoractorBar(),

				// 头条列表
				this.getTopicList(),

				// 非头条列表
				this.getNewsList()
			],
		);
	}

	/// 搜索框
	Widget getSearchBar() {
		// e4e9f5
		return Container(
			padding: EdgeInsets.all(15.0),
			decoration: BoxDecoration(
				color: Color(0xe4e9f5)
			),
			child: TextField(
				textAlign: TextAlign.left,
				style: TextStyle(fontSize: 12.0, color: Colors.black),
				decoration: InputDecoration(
					fillColor: Color(0xe4e9f5),
					filled: true,
					labelText: 'Search',
					labelStyle: TextStyle(color: Colors.grey, fontSize: 15.0),
					prefixIcon: Container(
						child: Icon(Icons.search, color: Colors.black.withOpacity(0.6), size: 26.0),
					),
					suffixText: 'Enter search keywords',
					border: InputBorder.none
				),
				onChanged: (text) {
					print('change $text');
				},
				onSubmitted: (text) {
					print('submit $text');
				}
			),
		);
	}

	/// 装饰条
	getDecoractorBar() {
		return Container(
			width: MediaQuery.of(context).size.width - 30.0,
			height: 30.0,
			decoration: BoxDecoration(
				color: Color(0xFFFFFFFF),
				shape: BoxShape.rectangle,
				// 只有顶部圆角效果，底部无圆角效果
				borderRadius: BorderRadius.only(
					topLeft: Radius.circular(20.0),
					topRight: Radius.circular(20.0),
					bottomLeft: Radius.circular(0.0),
					bottomRight: Radius.circular(0.0),
				),
				boxShadow: [
					BoxShadow(
						color: Colors.black.withOpacity(0.1),
						blurRadius: 3.0,
						spreadRadius: 0.0,
						offset: Offset(0.0, 2.5),
					)
				]
			)
		);
	}

	/// 头条列表
	getNewsList() {
		return Text('test');
	}

	/// 非头条列表
	getTopicList() {
		return Text('test');
	}

}
