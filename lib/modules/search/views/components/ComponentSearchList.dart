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
		List<Widget> renderList = [
			CommonText('test', color: Colors.black),
			CommonText('test', color: Colors.black),
			CommonText('test', color: Colors.black),
			CommonText('test', color: Colors.black),
		];

		return Flexible( 
			fit: FlexFit.tight, 
			child: ListView.separated(
				padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
				itemBuilder: (context, index) {
					return renderList[index];
				}, 
				separatorBuilder: (context, index) {
					return SizedBox(height:5.0);
				}, 
				itemCount: renderList.length + 1
			)
		);
	}

	Widget getTrendsList() {
		return Text('data');
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