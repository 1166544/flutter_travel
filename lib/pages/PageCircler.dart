import 'package:flutter/material.dart';

class PageCircler extends StatefulWidget {
  final Widget child;

  PageCircler({Key key, this.child}) : super(key: key);

  _CirclerState createState() => _CirclerState();
}

class _CirclerState extends State<PageCircler> {
  @override
  Widget build(BuildContext context) {
	return Container(
	   child: Text('Circler', style: TextStyle(color: Colors.black))
	);
  }
}
