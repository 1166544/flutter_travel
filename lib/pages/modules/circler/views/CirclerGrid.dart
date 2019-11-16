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
					children: this.generateBuildList(context),
				),
              )
            ],
          ),
        );
	}

	List<Widget> generateBuildList(BuildContext context) {
		List<Widget> lsitWidget = [];
		int count = this._list.length;
		for (var i = 0; i < count; i++) {
			CirclerModelNewsItem item = this._list[i];

			lsitWidget.add(
				this.buildNewsLetterView(
					item.commentCount,
					item.title,
					item.abs,
					context
				),
			);

			lsitWidget.add(SizedBox(height: 10.0));
		}

		return lsitWidget;
	}

	Widget buildNewsLetterView(String bedgeeStr, String title, String desc, BuildContext context) {
		return Container(
			width: MediaQuery.of(context).size.width,
			height: 90.0,
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
								Container(
									width: MediaQuery.of(context).size.width - 120.0,
									child: Text(
										title,
										maxLines: 1,
										overflow: TextOverflow.ellipsis,
										softWrap: true,
										style: TextStyle(
											fontSize: 18.0, 
											fontWeight: FontWeight.bold, 
											color: Colors.black
										)
									),
								),
								Spacer(),
								Container(
									width: 45.0,
									height: 18.0,
									decoration: BoxDecoration(
										color: Colors.grey.withOpacity(0.3),
										borderRadius: BorderRadius.all(Radius.circular(2.0))
									),
									child: Container(
										width: 45.0,
										child: Padding(
											padding: EdgeInsets.fromLTRB(4.0, 2.0, 0, 0),
											child: Text(
												'Show $bedgeeStr',
												overflow: TextOverflow.ellipsis,
												softWrap: true,
												style: TextStyle(
													fontSize: 10.0, 
													fontWeight: FontWeight.bold, 
													color: Colors.black.withOpacity(0.7)
												)
											),
										)
									),
								)
							],
						),
						SizedBox(height: 6.0),
						Container(
							width: MediaQuery.of(context).size.width,
							child: Text(
								desc, 
								overflow: TextOverflow.ellipsis,
								softWrap: true,
								maxLines: 2,
								style: TextStyle(
									fontSize: 12.0, 
									color: Colors.black.withOpacity(0.8)
								)
							),
						)
					],
				),
			),
		);
	}
}