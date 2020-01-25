import 'package:flutter/material.dart';
import 'package:flutter_travel/modules/profile/models/ModelProfile.dart';

/// 中部访问信息
class ViewVisitors extends StatefulWidget {
  ViewVisitors({Key key, AsyncSnapshot<ModelProfile> snapshot}) : super(key: key);

  _ViewVisitorsState createState() => _ViewVisitorsState();
}

class _ViewVisitorsState extends State<ViewVisitors> {
	@override
	Widget build(BuildContext context) {
		return Container(
			padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 40.0),
			decoration: BoxDecoration(
				color: Color(0xFFebeff9)
			),
			child: Row(
				crossAxisAlignment: CrossAxisAlignment.center,
				mainAxisAlignment: MainAxisAlignment.spaceEvenly,
				children: <Widget>[
					this.getVisitorItem(90, 'Unknow', 0.0),
					this.getVisitorItem(11, 'Famillar', 0.4),
					this.getVisitorItem(6, 'Excellent', 1.0),
				]
			)
		);
	}

  
	/// 访问人数显示项
	Widget getVisitorItem(int score, String desc, double process) {
		final double cellWidth = 100.0;
		return Container(
			decoration: BoxDecoration(
				color: Colors.white,
				borderRadius: BorderRadius.circular(10.0)
			),
			width: cellWidth,
			height: 130.0,
			padding: EdgeInsets.only(left: 15.0, right: 15.0),
			child: Column(
				mainAxisAlignment: MainAxisAlignment.center,
				children: <Widget>[
					Text(
						score.toString(),
						style: TextStyle(
							fontSize: 28.0,
							fontWeight: FontWeight.bold,
							color: score > 50 ? Color(0xFF6d6d8d) : Colors.black
						)
					),
					SizedBox(height: 15.0),
					Text(
						desc,
						style: TextStyle(
							fontSize: 15.0,
							fontWeight: FontWeight.bold,
							color: score > 50 ? Color(0xFF6d6d8d) : Colors.black
						)
					),
					SizedBox(height: 15.0),
					Stack(
						children: <Widget>[
							Container(
								height: 4.0,
								decoration: BoxDecoration(
									borderRadius: BorderRadius.circular(18.0),
									color: Color(0xFFdce5e3)
								),
							),
							Container(
								width: cellWidth * process,
								height: 4.0,
								decoration: BoxDecoration(
									borderRadius: BorderRadius.circular(18.0),
									gradient: LinearGradient(
										begin: Alignment.centerLeft,
										end: Alignment.centerRight,
										colors: [
											Color(0xFF5e82f5),
											Color(0xFF5e82f5)
										]
									)
								),
							),
						],
					)
				],
			),
		);
	}

}