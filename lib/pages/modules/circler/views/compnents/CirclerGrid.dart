import 'package:flutter/material.dart';
import 'package:flutter_travel/pages/common/CommonNavigator.dart';
import 'package:flutter_travel/pages/modules/circler/models/CirclerModelNewsItem.dart';
import 'package:flutter_travel/pages/modules/circler/views/pages/CircleDetailPage.dart';

/// 九宫格内容
class CirclerGrid extends StatelessWidget with CommonNavigator {

	final List<CirclerModelNewsItem> list;

	CirclerGrid(this.list, {Key key}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return Padding(
			padding: EdgeInsets.fromLTRB(15.0, 25.0, 0.0, 0.0),
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
		int count = this.list.length;
		for (var i = 0; i < count; i++) {
			CirclerModelNewsItem item = this.list[i];

			lsitWidget.add(
				this.buildNewsLetterView(
					item,
					context
				),
			);

			lsitWidget.add(SizedBox(height: 10.0));
		}

		return lsitWidget;
	}

	Widget buildNewsLetterView(CirclerModelNewsItem item, BuildContext context) {
		return Container(
			width: MediaQuery.of(context).size.width,
			height: 90.0,
			decoration: BoxDecoration(
				color: Colors.grey.withOpacity(0.06),
				borderRadius: BorderRadius.all(Radius.circular(6.0)),
				border: Border.all(color: Colors.grey.withOpacity(0.4), width: 0.5)
			),
			child: GestureDetector(
				behavior: HitTestBehavior.opaque,
				child: this.getNewsLetterLayout(item, context),
				onTap: () => {
					this.navigateTo(context, CircleDetailPage(requestParams: { 'nids': item.nid }))
				}
			)
		);
	}

	/// 构建布局
	Widget getNewsLetterLayout(CirclerModelNewsItem item, BuildContext context) {
		String bedgeeStr = item.commentCount;
		String title = item.title;
		String desc = item.abs;

		return Padding(
			padding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0),
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
		);
	}
}