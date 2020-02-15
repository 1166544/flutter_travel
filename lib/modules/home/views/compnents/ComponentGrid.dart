import 'package:flutter/material.dart';
import 'package:flutter_travel/modules/common/CommonNavigator.dart';
import 'package:flutter_travel/modules/home/models/ModelNewsItem.dart';
import 'package:flutter_travel/modules/home/views/pages/PageDetail.dart';

/// 新闻子列表内容
class ComponentGrid extends StatelessWidget with CommonNavigator {

	final ModelNewsItem item;

	ComponentGrid(this.item, {Key key}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return this.buildNewsLetterView(
			this.item,
			context
		);
	}

	Widget buildNewsLetterView(ModelNewsItem item, BuildContext context) {
		return Container(
			width: MediaQuery.of(context).size.width,
			height: 100.0,
			decoration: BoxDecoration(
				color: Colors.grey.withOpacity(0.06),
				borderRadius: BorderRadius.all(Radius.circular(6.0)),
				border: Border.all(color: Colors.grey.withOpacity(0.4), width: 0.5)
			),
			child: GestureDetector(
				behavior: HitTestBehavior.opaque,
				child: this.getNewsLetterLayout(item, context),
				onTap: () => {
					this.navigateTo(context, PageDetail(requestParams: { 'nids': item.nid }))
				}
			)
		);
	}

	/// 构建布局
	Widget getNewsLetterLayout(ModelNewsItem item, BuildContext context) {
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
								width: MediaQuery.of(context).size.width - 80.0,
								child: Text(
									title,
									maxLines: 1,
									overflow: TextOverflow.ellipsis,
									softWrap: true,
									style: TextStyle(
										fontSize: 16.0, 
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
											maxLines: 1,
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
							maxLines: 3,
							style: TextStyle(
								fontSize: 14.0, 
								color: Colors.black.withOpacity(0.8)
							)
						),
					)
				],
			),
		);
	}
}