import 'package:flutter/material.dart';
import 'package:flutter_travel/pages/modules/profile/models/ModelProfile.dart';
import 'package:flutter_travel/pages/modules/profile/views/ViewProfileComment.dart';

/// 中实现信息
class ViewPresciption extends StatefulWidget {
  ViewPresciption({Key key, AsyncSnapshot<ModelProfile> snapshot}) : super(key: key);

  _ViewPresciptionState createState() => _ViewPresciptionState();
}

class _ViewPresciptionState extends State<ViewPresciption> with ViewProfileComment {
  @override
  Widget build(BuildContext context) {
	return Container(
			padding: EdgeInsets.fromLTRB(20.0, 55.0, 20.0, 45.0),
			child: Column(
				crossAxisAlignment: CrossAxisAlignment.start,
				children: <Widget>[
					this.getUnderlineText('Prescription'),
					SizedBox(height: 15.0),
					Container(
						decoration: BoxDecoration(
							color: Color(0xFFe1e6f0)
						),
						padding: EdgeInsets.all(18.0),
						child: Column(
							children: <Widget>[
								this.getPresciptonItem('Learned phrases', '12'),
								SizedBox(height: 12),
								this.getPresciptonItem('Phrases left to learn', '36'),
								SizedBox(height: 12),
								this.getPresciptonItem('Total learning time', '8.2h'),
							],
						),
					),
					SizedBox(height: 15.0),
					Text(
						'730',
						style: TextStyle(
							fontSize: 39.0,
							color: Colors.black,
							fontWeight: FontWeight.bold
						)
					),
					Row(
						children: <Widget>[
							Text(
								'visitors last 7 days',
								style: TextStyle(
									fontSize: 19.0,
									color: Color(0xFF9395a3)
								)
							),
							Icon(Icons.arrow_right, color: Color(0xFF9395a3))
						],
					)
				]
			)
		);
  	}
  
	/// 实现横条内容
	Widget getPresciptonItem(String title, String subTitle) {
		return Row(
			children: <Widget>[
				Text(
					title,
					style: TextStyle(
						fontSize: 12.0,
						color: Colors.black
					)
				),
				Spacer(),
				Text(
					subTitle,
					style: TextStyle(
						fontSize: 12.0,
						color: Colors.black,
						fontWeight: FontWeight.bold
					)
				)
			],
		);
	}

}