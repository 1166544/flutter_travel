import 'package:flutter/material.dart';

class PageSearch extends StatefulWidget {
  final Widget child;

  PageSearch({Key key, this.child}) : super(key: key);

  _PageSearchState createState() => _PageSearchState();
}

class _PageSearchState extends State<PageSearch> {
  @override
  Widget build(BuildContext context) {
	return Container(
	   child: Text('Search'),
	);
  }
}
