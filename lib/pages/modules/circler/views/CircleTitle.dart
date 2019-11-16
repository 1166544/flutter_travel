import 'package:flutter/material.dart';
import 'package:flutter_travel/pages/modules/circler/models/CirclerModelsNewsList.dart';

/// 大标题
class CircleTitle extends StatelessWidget {
	const CircleTitle(AsyncSnapshot<CirclerModelsNewsList> snapshot, {Key key}) : super(key: key);

	@override
	Widget build(BuildContext context) {
	return Padding(
		padding: EdgeInsets.fromLTRB(15.0, 30.0, 10.0, 0.0),
		child: Text("Discover News",
			style: TextStyle(fontSize: 23.0, fontWeight: FontWeight.bold, fontFamily: 'Montserrat'),
			maxLines: 2));
	}
}