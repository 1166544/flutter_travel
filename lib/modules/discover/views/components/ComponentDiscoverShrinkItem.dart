import 'package:flutter/material.dart';

/// 收缩小按钮
class ComponentDiscoverShrinkItem extends StatelessWidget {
	final int moreLength;
  	const ComponentDiscoverShrinkItem({Key key, this.moreLength}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return Container(
		child: Center(
				child: Stack(
					children: [
						Container(
							width: 60.0,
							height: 60.0,
							child: ClipRRect(
								borderRadius: BorderRadius.circular(8),
								child: Container(
									width: 60,
									height: 60,
									decoration: BoxDecoration(
										color: Colors.grey,
										shape: BoxShape.rectangle
									),
									child: Column(
										mainAxisAlignment: MainAxisAlignment.center,
										children: [
											Text(
												'+${moreLength.toString()}', 
												style: TextStyle(
													fontSize: 15, 
													fontWeight: FontWeight.normal, 
													color: Colors.white
												)
											),
											Icon(Icons.keyboard_arrow_up, size: 20, color: Colors.white)
										]
									),
								)
							),
						)
					]
				)
			),
		);
	}
}