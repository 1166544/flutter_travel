import 'package:flutter/material.dart';
import 'package:flutter_travel/modules/common/CommonText.dart';

/// 分类
class ComponentSearchType extends StatefulWidget {
	ComponentSearchType({Key key}) : super(key: key);

	_ComponentSearchTypeState createState() => _ComponentSearchTypeState();
}

class _ComponentSearchTypeState extends State<ComponentSearchType> {
	@override
	Widget build(BuildContext context) {
		return Padding(
			padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
			child: Row(
				crossAxisAlignment: CrossAxisAlignment.center,
				mainAxisAlignment: MainAxisAlignment.spaceEvenly,
				children: <Widget>[
					this.getTypeIcon(
						[Color(0xFF5c46e1), Color(0xFF9661f3)], 
						Icons.movie, 'Movie'
					),
					this.getTypeIcon(
						[Color(0xFFfa7401), Color(0xFFf89e1f)], 
						Icons.location_city, 'City'
					),
					this.getTypeIcon(
						[Color(0xFF109fe6), Color(0xFF78cef5)], 
						Icons.games, 'Game'
					),
					this.getTypeIcon(
						[Color(0xFFf64027), Color(0xFFf8935e)], 
						Icons.live_tv, 'Live'
					),
					this.getTypeIcon(
						[Color(0xFF99979a), Color(0xFFe2e2e2)], 
						Icons.border_vertical, 'More'
					),
				],
			),
		);
	}

	/// 分类按钮
	Widget getTypeIcon(List<Color> colorList, IconData iconData, String iconTitle) {
		return Column(
			children: <Widget>[
					Container(
					width: 60,
					height: 60,
					decoration: BoxDecoration(
						shape: BoxShape.rectangle,
						borderRadius: BorderRadius.circular(50),
						gradient: LinearGradient(
							colors: colorList,
							begin: Alignment.topLeft,
							end: Alignment.bottomRight,
							stops: [0.4, 1]
						)
					),
					child: Center(
						child: Icon(iconData, size: 26, color: Colors.white)
					),
				),
				SizedBox(height: 8),
				CommonText(iconTitle, color: Colors.black.withOpacity(0.9), fontSize: 18)
			],
		);
	}
}