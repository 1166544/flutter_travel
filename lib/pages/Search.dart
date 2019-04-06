import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  final Widget child;

  SearchPage({Key key, this.child}) : super(key: key);

  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
	return Container(
	   child: Text('Search'),
	);
  }
}
