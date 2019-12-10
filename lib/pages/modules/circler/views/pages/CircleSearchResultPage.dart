import 'package:flutter/material.dart';
import 'package:flutter_travel/core/bloc/BlocProvider.dart';
import 'package:flutter_travel/pages/modules/circler/blocs/CirclerBlocSearch.dart';
import 'package:flutter_travel/pages/modules/circler/views/compnents/CirclerSearchContent.dart';

/// 搜索结果页
class CircleSearchResultPage extends StatefulWidget {

	final String searchContent;

	CircleSearchResultPage({Key key, this.searchContent}) : super(key: key);

  	_CircleSearchResultPageState createState() => _CircleSearchResultPageState();
}

class _CircleSearchResultPageState extends State<CircleSearchResultPage> {

	_CircleSearchResultPageState(): super();

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text('Search Keywords: ${widget.searchContent}', style: TextStyle(
					color: Colors.black,
					fontWeight: FontWeight.bold,
					fontSize: 20.0
				)),
				elevation: 0.0,
				centerTitle: true,
				backgroundColor: Color(0xffebeff8),
			),
			body: BlocProvider(
				bloc: CirclerBlocSearch(),
				child: CirclerSearchContent(searchContent: widget.searchContent),
			),
		);
	}
}