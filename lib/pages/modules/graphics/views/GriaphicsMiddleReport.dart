import 'package:flutter/material.dart';
import 'package:flutter_travel/pages/modules/graphics/models/GraphicsBlocModel.dart';
import 'package:flutter_travel/pages/modules/graphics/views/GraphicsCommentView.dart';

/// 中部报告信息
class GraphicsMiddleReport extends StatefulWidget {
  GraphicsMiddleReport({Key key, AsyncSnapshot<GraphicsBlocModel> snapshot}) : super(key: key);

  _GraphicsMiddleReportState createState() => _GraphicsMiddleReportState();
}

class _GraphicsMiddleReportState extends State<GraphicsMiddleReport> with GraphicsCommentView {
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