import 'package:flutter/material.dart';
import 'package:flutter_travel/modules/common/CommonText.dart';

/// 长列表
class ComponentSearchList extends StatefulWidget {
	ComponentSearchList({Key key}) : super(key: key);

	_ComponentSearchListState createState() => _ComponentSearchListState();
}

class _ComponentSearchListState extends State<ComponentSearchList> {
  	@override
  	Widget build(BuildContext context) {
		return Padding(
				padding: EdgeInsets.fromLTRB(10, 30, 5, 0),
				child: Column(
					children: <Widget>[
						this.getHotTitle(),
						this.getTrendsList()
					]
				)
		);
	}

	Widget getTrendsList() {
		return Text('');
	}

	/// 标题
	Widget getHotTitle() {
		return Row(
			crossAxisAlignment: CrossAxisAlignment.center,
			mainAxisAlignment: MainAxisAlignment.center,
			children: <Widget>[
				CommonText('Trends', fontWeight: FontWeight.bold, fontSize: 20),
				Spacer(),
				Row(
					crossAxisAlignment: CrossAxisAlignment.center,
					mainAxisAlignment: MainAxisAlignment.center,
					children: <Widget>[
						CommonText('more', color: Colors.grey, fontSize: 16),
						Icon(Icons.arrow_right, size: 19, color: Colors.grey)
					]
				)
			]
		);
	}
}