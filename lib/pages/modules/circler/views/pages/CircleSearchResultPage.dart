import 'package:flutter/material.dart';

/// 搜索结果页
class CircleSearchResultPage extends StatefulWidget {

	final String searchContent;

	CircleSearchResultPage({Key key, this.searchContent}) : super(key: key);

  	_CircleSearchResultPageState createState() => _CircleSearchResultPageState(this.searchContent);
}

class _CircleSearchResultPageState extends State<CircleSearchResultPage> {

	String _searchContent;

	_CircleSearchResultPageState(String searchContent): super() {
		this._searchContent = searchContent;
	}

	@override
	Widget build(BuildContext context) {
		return Container(
			child: Text(this._searchContent),
		);
	}
}