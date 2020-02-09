import 'package:flutter/material.dart';
import 'package:flutter_travel/modules/home/models/ModelsNewsList.dart';

/// 大标题
class ComponentTitle extends StatelessWidget {
	const ComponentTitle(AsyncSnapshot<ModelsNewsList> snapshot, {Key key}) : super(key: key);

	@override
	Widget build(BuildContext context) {
	return Padding(
		padding: EdgeInsets.fromLTRB(15.0, 30.0, 10.0, 0.0),
		child: Text("Discover News",
			style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, fontFamily: 'Montserrat'),
			maxLines: 2));
	}
}