import 'package:flutter/material.dart';

class CirclerPage extends StatefulWidget {
  final Widget child;

  CirclerPage({Key key, this.child}) : super(key: key);

  _CirclerState createState() => _CirclerState();
}

class _CirclerState extends State<CirclerPage> {
  @override
  Widget build(BuildContext context) {
	return Container(
	   child: Text('Circler'),
	);
  }
}
