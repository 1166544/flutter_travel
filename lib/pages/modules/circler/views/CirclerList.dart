import 'package:flutter/material.dart';
import 'package:flutter_travel/pages/modules/circler/models/CirclerModelImage.dart';
import 'package:flutter_travel/pages/modules/circler/models/CirclerModelNewsItem.dart';

/// 列表结构
class CirclerList extends StatelessWidget {

	List<CirclerModelNewsItem> _list;

  	CirclerList(List<CirclerModelNewsItem> list, {Key key}) : super(key: key) {
		this._list = list;
	}

	@override
	Widget build(BuildContext context) {
		return Padding(
			padding: EdgeInsets.fromLTRB(10.0, 35.0, 0.0, 0.0),
			child: Column(
				crossAxisAlignment: CrossAxisAlignment.start,
				children: <Widget>[
				Text('Experiences',
					style:
						TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontFamily: 'Montserrat')),
				SizedBox(height: 20.0),
				Column(
					children: this.generateLayoutList(context),
				)
				],
			),
		);
	}

	/// 生成渲染列表
	List<Widget> generateLayoutList(BuildContext context) {
		List<Widget> lsitWidget = [];
		int count = this._list.length;

		for (var i = 0; i < count; i++) {
			CirclerModelNewsItem item = this._list[i];

			List<CirclerModelImage> imageurls = item.imageurls;
			var cover1 = '';

			if (imageurls.length > 0) {
				cover1 = imageurls[0].urlWebp;
			}
			lsitWidget.add(
				this.buildExperienceItem(
				context,
				cover1,
				cover1,
				cover1,
				item.pulltime,
				item.site,
				item.title,
				item.abs
			));
			lsitWidget.add(
				SizedBox(height: 30.0)
			);
		}

		return lsitWidget;
	}

	/// 构建留言区
	Widget buildExperienceItem(
		BuildContext context,
		String avataUrl,
		String chapter1Url,
		String chapter2Url,
		dynamic chatNum,
		dynamic favNum,
		String chatTitle,
		String chatDesc) {
		return Column(
		children: <Widget>[
			// 第1行 标题
			Row(
				crossAxisAlignment: CrossAxisAlignment.start,
				children: <Widget>[
					Container(
						width: 120.0,
						height: 90.0,
						decoration: BoxDecoration(
						image: DecorationImage(
							image:NetworkImage(avataUrl), 
							fit: BoxFit.cover),
							borderRadius: BorderRadius.all(Radius.circular(7.0))
						)
					),
					SizedBox(width: 15.0),
					Column(
						children: <Widget>[
							Container(
								width: MediaQuery.of(context).size.width - 160,
								child: Text(chatTitle,
									maxLines: 2,
									softWrap: true,
									style: TextStyle(
										fontSize: 16.0,
										color: Colors.black87,
										fontWeight: FontWeight.bold)),
							),
							SizedBox(height: 5.0),
							Container(
								width: MediaQuery.of(context).size.width - 160,
								child: Text(chatDesc,
									maxLines: 2,
									softWrap: true,
									style: TextStyle(
										fontSize: 13.0,
										color: Colors.black87.withOpacity(0.5)
									)),
							),
							SizedBox(height: 5.0),
							Container(
								width: MediaQuery.of(context).size.width - 160,
								child: Row(
								children: <Widget>[
										Container(
											width: 10.0,
											height: 10.0,
											decoration: BoxDecoration(
											image: DecorationImage(
												image: AssetImage('assets/speechbubble.png'),
												fit: BoxFit.cover),
											),
										),
										SizedBox(width: 10.0),
										Text(chatNum.toString(),
											style: TextStyle(color: Colors.grey, fontSize: 12.0)),
										Spacer(),
									],
								),
							)
						],
					)
				],
			),
		],
		);
	}
}