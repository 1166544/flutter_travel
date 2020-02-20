import 'package:flutter/material.dart';
import 'package:flutter_travel/modules/common/CommonText.dart';

class ComponentSearchHotItem extends StatelessWidget {
	final int type;
	final Color firstColor;
	final Color lastColor;
	final String text;
	const ComponentSearchHotItem({Key key, this.text, this.type, this.firstColor, this.lastColor}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return this.getHotIcon();
	}

	/// 热搜小图标
	Widget getHotIcon() {
		List<Color> renderColors = [
			this.firstColor,
			this.lastColor,
		];

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
				child: CommonText(this.text, color: Colors.white, fontSize: 12)
			),
		);
	}
}