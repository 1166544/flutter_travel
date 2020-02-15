import 'package:flutter/material.dart';
import 'package:flutter_travel/modules/common/CommonText.dart';
import 'package:flutter_travel/modules/profile/models/ModelProfile.dart';
import 'package:flutter_travel/redux/states/StateAuth.dart';

/// 中部访问信息
class ComponentVisitors extends StatefulWidget {
	final AsyncSnapshot<ModelProfile> snapshot;
	final StateAuth auth;
  	ComponentVisitors({Key key, this.snapshot, this.auth}) : super(key: key);

  	_ComponentVisitorsState createState() => _ComponentVisitorsState();
}

class _ComponentVisitorsState extends State<ComponentVisitors> {
	@override
	Widget build(BuildContext context) {
		if (widget.auth.user == null) {
			return Container();
		}
		return Container(
			padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 40.0),
			decoration: BoxDecoration(
				color: Color(0xFFebeff9)
			),
			child: Row(
				crossAxisAlignment: CrossAxisAlignment.center,
				mainAxisAlignment: MainAxisAlignment.spaceEvenly,
				children: <Widget>[
					this.getVisitorItem(widget.auth.user.user.publicReposCount, 'Repos', 1.8),
					this.getVisitorItem(widget.auth.user.user.publicGistsCount, 'Gists', 0.4),
					this.getVisitorItem(widget.auth.user.user.followersCount, 'Followers', 1.0),
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
					CommonText(
						score.toString(),
						style: TextStyle(
							fontSize: 24.0,
							fontWeight: FontWeight.bold,
							color: score > 50 ? Color(0xFF6d6d8d) : Colors.black
						)
					),
					SizedBox(height: 15.0),
					CommonText(
						desc,
						style: TextStyle(
							fontSize: 13.0,
							fontWeight: FontWeight.bold,
							color: score > 50 ? Color(0xFF6d6d8d) : Colors.black.withOpacity(0.5)
						)
					),
					SizedBox(height: 6.0),
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
											Color(0xfffe7850),
											Color(0xfffe7850),
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