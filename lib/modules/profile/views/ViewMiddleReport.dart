import 'package:flutter/material.dart';
import 'package:flutter_travel/modules/profile/models/ModelProfile.dart';
import 'package:flutter_travel/modules/profile/views/ViewProfileComment.dart';

/// 中部报告信息
class ViewMiddleReport extends StatefulWidget {
  ViewMiddleReport({Key key, AsyncSnapshot<ModelProfile> snapshot}) : super(key: key);

  _ViewMiddleReportState createState() => _ViewMiddleReportState();
}

class _ViewMiddleReportState extends State<ViewMiddleReport> with ViewProfileComment {
  @override
  Widget build(BuildContext context) {
	return Container(
		padding: EdgeInsets.fromLTRB(20.0, 35.0, 20.0, 0.0),
		child: Column(
			crossAxisAlignment: CrossAxisAlignment.start,
			children: <Widget>[
				this.getUnderlineText('Reported Ava'),
				SizedBox(height: 15.0),
				Text(
					'2 tables away 6-7 hours nor more than 8 tables \nper day',
					style: TextStyle(
						fontSize: 12.0,
						color: Color(0xFF252949)
					)
				),
				SizedBox(height: 30.0),
				// 绿色进度条
				Text(
					'Taper',
					style: TextStyle(
						fontSize: 12.0,
						color: Colors.grey
					)
				),
				SizedBox(height: 10.0),
				Stack(
					children: <Widget>[
						Container(
							height: 6.0,
							decoration: BoxDecoration(
								borderRadius: BorderRadius.circular(12.0),
								color: Color(0xFFdce5e3)
							),
						),
						Container(
							width: MediaQuery.of(this.context).size.width * 0.50,
							height: 6.0,
							decoration: BoxDecoration(
								borderRadius: BorderRadius.circular(12.0),
								gradient: LinearGradient(
									begin: Alignment.centerLeft,
									end: Alignment.centerRight,
									colors: [
										Color(0xFFe3f2ef),
										Color(0xFF7bc6bc)
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