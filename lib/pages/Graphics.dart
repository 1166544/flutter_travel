import 'package:flutter/material.dart';

class GraphicsPage extends StatefulWidget {
  final Widget child;

  GraphicsPage({Key key, this.child}) : super(key: key);

  _GraphicsPageState createState() => _GraphicsPageState();
}

class _GraphicsPageState extends State<GraphicsPage> {
  @override
  Widget build(BuildContext context) {
	return Container(
	   child: Text('Graphics'),
	);
  }
}
