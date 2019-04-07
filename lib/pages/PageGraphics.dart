import 'package:flutter/material.dart';

class PageGraphics extends StatefulWidget {
  final Widget child;

  PageGraphics({Key key, this.child}) : super(key: key);

  _PageGraphicsState createState() => _PageGraphicsState();
}

class _PageGraphicsState extends State<PageGraphics> {
  @override
  Widget build(BuildContext context) {
	return Container(
	   child: Text('Graphics', style: TextStyle(color: Colors.black),),
	);
  }
}
