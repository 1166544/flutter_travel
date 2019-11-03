import 'package:flutter/material.dart';

/// 搜索条
class CirclerSearchBar extends StatefulWidget {
	CirclerSearchBar({Key key}) : super(key: key);

	_CirclerSearchBarState createState() => _CirclerSearchBarState();
}

class _CirclerSearchBarState extends State<CirclerSearchBar> {
	@override
	Widget build(BuildContext context) {
		return Padding(
				padding: EdgeInsets.fromLTRB(10.0, 25.0, 10.0, 0),
				child: Row(
					children: <Widget>[
						Expanded(
							flex: 8,
							child: TextField(
								textAlign: TextAlign.left,
								style: TextStyle(fontSize: 12.0, color: Colors.black),
								decoration: InputDecoration(
									fillColor: Color(0xFFe4e9f5),
									filled: true,
									labelText: 'Search',
									labelStyle: TextStyle(color: Colors.grey, fontSize: 15.0),
									prefixIcon: Container(
										child: Icon(Icons.search, color: Colors.black.withOpacity(0.6), size: 26.0),
									),
									suffixText: 'Enter search keywords',
									border: InputBorder.none
								),
								onChanged: (text) {
									print('change $text');
								},
								onSubmitted: (text) {
									print('submit $text');
								}
							)
						),
						Expanded(
							child: IconButton(
								icon:Icon(Icons.airplay),
								color: Colors.black,
								iconSize: 30.0,
								onPressed: (){
									// hole
								}
							),
						),
				],
			),
		);
	}
}