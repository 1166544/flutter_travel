import 'package:flutter/material.dart';
import 'package:flutter_travel/modules/common/CommonText.dart';

/// 热搜搜索条
class ComponentHotSearchBar extends StatefulWidget {
  ComponentHotSearchBar({Key key}) : super(key: key);

  _ComponentHotSearchBarState createState() => _ComponentHotSearchBarState();
}

class _ComponentHotSearchBarState extends State<ComponentHotSearchBar> {
	@override
	Widget build(BuildContext context) {
		return Container(
			width: MediaQuery.of(context).size.width,
			height: 50,	
			decoration: BoxDecoration(
				color: Colors.white,
				shape: BoxShape.rectangle
			),
			child: Container(
				margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
				decoration: BoxDecoration(
					shape: BoxShape.rectangle,
					color: Colors.grey.withOpacity(0.2),
					borderRadius: BorderRadius.all(Radius.circular(25))
				),
				child: Center(
					child: Row(
						mainAxisAlignment: MainAxisAlignment.center,
						children: [
							Icon(
								Icons.search, 
								color: Colors.grey.withOpacity(0.7), 
								size: 25
							),
							SizedBox(width: 5),
							CommonText(
								'Search your favorite video', 
								fontSize: 19, 
								color: Colors.grey.withOpacity(0.7),
								fontWeight: FontWeight.w300,
							)				
						]
					),
				),
			),
		);
	}
}