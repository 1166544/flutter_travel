import 'package:flutter/material.dart';
import 'package:flutter_travel/core/bloc/BlocProvider.dart';
import 'package:flutter_travel/pages/modules/home/blocs/BlocSearch.dart';
import 'package:flutter_travel/pages/modules/home/views/compnents/ComponentSearchContent.dart';

/// 搜索结果页
class PageSearchResult extends StatefulWidget {

	final String searchContent;

	PageSearchResult({Key key, this.searchContent}) : super(key: key);

  	_PageSearchResultState createState() => _PageSearchResultState();
}

class _PageSearchResultState extends State<PageSearchResult> {

	_PageSearchResultState(): super();

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
				bloc: BlocSearch(),
				child: ComponentSearchContent(searchContent: widget.searchContent),
			),
		);
	}
}