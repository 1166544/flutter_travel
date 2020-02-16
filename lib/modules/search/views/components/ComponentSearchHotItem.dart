import 'package:flutter/material.dart';
import 'package:flutter_travel/modules/common/CommonText.dart';

class ComponentSearchHotItem extends StatelessWidget {
	final int type;
	const ComponentSearchHotItem({Key key, this.type}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return this.getHotIcon();
	}

	/// 热搜小图标
	Widget getHotIcon() {
		List<Color> renderColors = [
			Color(0xFFff4c62),
			Color(0xFFff9fae),
		];
		String typeTitle = 'new';

		return Container(
			width: 30,
			height: 15,
			decoration: BoxDecoration(
				shape: BoxShape.rectangle,
				borderRadius: BorderRadius.circular(3),
				gradient: LinearGradient(
					begin: Alignment.topLeft,
					end: Alignment.bottomRight,
					stops: [0.4, 1],
					colors: renderColors
				)
			),
			child: Center(
				child: CommonText(typeTitle, color: Colors.white, fontSize: 12)
			),
		);
	}
}