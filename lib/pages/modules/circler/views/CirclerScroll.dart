import 'package:flutter/material.dart';
import 'package:flutter_travel/pages/modules/circler/models/CirclerModelsNewsList.dart';

/// 横向滚动内容
class CirclerScroll extends StatelessWidget {

	CirclerScroll(AsyncSnapshot<CirclerModelsNewsList> snapshot, {Key key}): super(key: key);

	@override
	Widget build(BuildContext context) {
		return Container(
				padding: EdgeInsets.fromLTRB(15.0, 10.0, 0.0, 0.0),
				width: MediaQuery.of(context).size.width,
				height: 220.0,
				child: ListView(
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

			return Container(
				width: 290.0,
				height: 180.0,
				decoration: BoxDecoration(
					image: DecorationImage(image: AssetImage(coverUrl), fit: BoxFit.cover),
					borderRadius: BorderRadius.only(
						topLeft: Radius.circular(10.0),
						topRight: Radius.circular(10.0),
						bottomLeft: Radius.circular(10.0),
						bottomRight: Radius.circular(10.0),
					)),
				child: Container(
					padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 10.0),
					decoration: BoxDecoration(
						gradient: LinearGradient(
							begin: Alignment.topCenter,
							end: Alignment.bottomCenter,
							stops: [0.0, 0.5, 0.65, 0.9],
							colors: [
								Colors.black.withOpacity(0.0),
								Colors.black.withOpacity(0.3),
								Colors.black.withOpacity(0.5),
								Colors.black.withOpacity(0.7),
							],
						),
						borderRadius: BorderRadius.only(
						topLeft: Radius.circular(10.0),
						topRight: Radius.circular(10.0),
						bottomLeft: Radius.circular(10.0),
						bottomRight: Radius.circular(10.0),
					)
					),
					child: Row(
						mainAxisAlignment: MainAxisAlignment.start,
						crossAxisAlignment: CrossAxisAlignment.end,
						children: <Widget>[
							Container(
								width: 40.0,
								height: 40.0,
								decoration: BoxDecoration(
								image: DecorationImage(
										image:AssetImage(avataUrl), fit: BoxFit.cover),
										borderRadius: BorderRadius.only(
											topLeft: Radius.circular(7.0),
											topRight: Radius.circular(7.0),
											bottomLeft: Radius.circular(7.0),
											bottomRight: Radius.circular(7.0),
								)),
							),
							SizedBox(width: 15.0),
							Container(
								height: 40.0,
								child: Text(titleDesc,
									maxLines: 2,
									softWrap: true,
									style: TextStyle(fontWeight: FontWeight.normal, fontSize: 17.0, color: Colors.white)))
						],
					),
				),
			);

	}
}