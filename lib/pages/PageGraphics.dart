import 'package:flutter/material.dart';

/// 摄影
class PageGraphics extends StatefulWidget {
  final Widget child;

  PageGraphics({Key key, this.child}) : super(key: key);

  _PageGraphicsState createState() => _PageGraphicsState();
}

/// 摄影状态
class _PageGraphicsState extends State<PageGraphics> {
  @override
  Widget build(BuildContext context) {
	return Scaffold(
		body: Container(
			decoration: BoxDecoration(
				image: DecorationImage(
					image: AssetImage('assets/road.jpg'),
					fit: BoxFit.cover,
				),
			),
			child: Container(
				decoration: BoxDecoration(
					 gradient: LinearGradient(
					begin: Alignment.topCenter,
					end: Alignment.bottomCenter,
					stops: [0.0, 0.5, 0.75, 0.9],
					colors: [
						Colors.white.withOpacity(0.0),
						Colors.white.withOpacity(0.25),
						Colors.white.withOpacity(0.75),
						Colors.white,
					],
					)
				),
			),
		),
	);
  }
}
