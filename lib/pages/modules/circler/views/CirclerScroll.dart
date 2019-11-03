import 'package:flutter/material.dart';

/// 横向滚动内容
class CirclerScroll extends StatelessWidget {

	@override
	Widget build(BuildContext context) {
	return Container(
			padding: EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
			width: MediaQuery.of(context).size.width,
			height: 220.0,
			child: ListView(
			padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
			scrollDirection: Axis.horizontal,
			children: <Widget>[
				this.buildScrollImageItem(
					'assets/road.jpg',
					'assets/chris.jpg',
					'Madrid in Summer'),
				SizedBox(width: 15.0),
				this.buildScrollImageItem(
					'assets/p5.jpg',
					'assets/beach5.jpg',
					'Barcelona withe Drone'),
				SizedBox(width: 15.0),
				this.buildScrollImageItem(
					'assets/p6.jpg',
					'assets/p2.jpg',
					'Sanfrisco travel details'),
			],
			),
		);
	}
	
	/// 滚动图片
	Widget buildScrollImageItem(
		String coverUrl, String avataUrl, String titleDesc) {
		return Column(
		crossAxisAlignment: CrossAxisAlignment.start,
		children: <Widget>[
			Container(
			width: 180.0,
			height: 150.0,
			decoration: BoxDecoration(
				image: DecorationImage(
					image: AssetImage(coverUrl), fit: BoxFit.cover),
				borderRadius: BorderRadius.only(
					topLeft: Radius.circular(20.0),
					topRight: Radius.circular(20.0),
					bottomLeft: Radius.circular(0.0),
					bottomRight: Radius.circular(20.0),
				)),
			),
			SizedBox(height: 10.0),
			Row(
			mainAxisAlignment: MainAxisAlignment.start,
			crossAxisAlignment: CrossAxisAlignment.start,
			children: <Widget>[
				CircleAvatar(
				backgroundImage: AssetImage(avataUrl),
				radius: 20.0,
				),
				SizedBox(width: 15.0),
				Container(
					width: 120.0,
					height: 40.0,
					child: Text(titleDesc,
						maxLines: 2,
						softWrap: true,
						style:
							TextStyle(fontWeight: FontWeight.normal, fontSize: 12.0)))
			],
			)
		],
		);
	}
}