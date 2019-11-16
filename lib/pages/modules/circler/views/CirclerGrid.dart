import 'package:flutter/material.dart';
import 'package:flutter_travel/pages/modules/circler/models/CirclerModelNewsItem.dart';

/// 九宫格内容
class CirclerGrid extends StatelessWidget {

	List<CirclerModelNewsItem> _list;

	CirclerGrid(List<CirclerModelNewsItem> list, {Key key}) : super(key: key) {
		this._list = list;
	}

	@override
	Widget build(BuildContext context) {
	return Padding(
          padding: EdgeInsets.fromLTRB(15.0, 55.0, 0.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // 标题
              Text('My Newsleeters', style:TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontFamily: 'Montserrat')),

              SizedBox(height: 10.0),

              Container(
                width: MediaQuery.of(context).size.width - 30,
                child: Column(
					mainAxisAlignment: MainAxisAlignment.start,
					crossAxisAlignment: CrossAxisAlignment.start,
					children: <Widget>[
						this.buildNewsLetterView(
							'09',
							'Restaurants',
							'Stay informed as soon as important news breaks around the world',
							context
						),
						SizedBox(height: 20.0),
						this.buildNewsLetterView(
							'07',
							'Middle East',
							'Stay informed as soon as important news breaks around the world',
							context
						),
					],
				),
              )
            ],
          ),
        );
	}

	Widget buildNewsLetterView(String bedgeeStr, String title, String desc, BuildContext context) {
		return Container(
			width: MediaQuery.of(context).size.width,
			height: 80.0,
			decoration: BoxDecoration(
				color: Colors.grey.withOpacity(0.06),
				borderRadius: BorderRadius.all(Radius.circular(6.0)),
				border: Border.all(color: Colors.grey.withOpacity(0.4), width: 0.5)
			),
			child: Padding(
				padding: EdgeInsets.all(8.0),
				child: Column(
					crossAxisAlignment: CrossAxisAlignment.start,
					children: <Widget>[
						Row(
							children: <Widget>[
								Text(title,
								style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black)),
								Spacer(),
								Container(
									width: 50.0,
									height: 18.0,
									decoration: BoxDecoration(
										color: Colors.grey.withOpacity(0.3),
										borderRadius: BorderRadius.all(Radius.circular(2.0))
									),
									child: Center(
										child: Text('Show $bedgeeStr',
											style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold, color: Colors.black.withOpacity(0.7))),
									),
								)
							],
						),
						SizedBox(height: 6.0),
						Text(desc,
						style: TextStyle(fontSize: 12.0, color: Colors.black.withOpacity(0.8)))
					],
				),
			),
		);
	}
}