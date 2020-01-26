import 'package:flutter/material.dart';
import 'package:flutter_travel/modules/common/CommonNavigator.dart';
import 'package:flutter_travel/modules/common/CommonTimeFormate.dart';
import 'package:flutter_travel/modules/home/models/ModelImage.dart';
import 'package:flutter_travel/modules/home/models/ModelNewsItem.dart';
import 'package:flutter_travel/modules/home/views/pages/PageDetail.dart';

/// 列表结构
class ComponentList extends StatelessWidget with CommonTimeFormate, CommonNavigator {

	final List<ModelNewsItem> list;

  	ComponentList(this.list, {Key key}) : super(key: key);

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
		int count = this.list.length;

		for (var i = 0; i < count; i++) {
			ModelNewsItem item = this.list[i];

			List<ModelImage> imageurls = item.imageurls;
			var cover1 = '';

			if (imageurls.length > 0) {
				cover1 = imageurls[0].urlWebp ?? imageurls[0].url;
			}
			lsitWidget.add(
				this.buildExperienceItem(
				context,
				cover1,
				item
			));
			lsitWidget.add(
				SizedBox(height: 30.0)
			);
		}

		return lsitWidget;
	}

	/// 构建列表区
	Widget buildExperienceItem(
		BuildContext context,
		String avataUrl,
		ModelNewsItem item
		) {

			String chapter1Url = avataUrl;
			String chapter2Url = avataUrl;
			dynamic chatNum = item.ts;
			dynamic favNum = item.site;
			String chatTitle = item.title;
			String chatDesc = item.abs;
		
		return GestureDetector(
			behavior: HitTestBehavior.opaque,
			child: this.getCircleListArea(context,
				avataUrl,
				chapter1Url,
				chapter2Url,
				chatNum,
				favNum,
				chatTitle,
				chatDesc),
			onTap: () => {
				this.navigateTo(
					context, 
					PageDetail(requestParams: { 'nids': item.nid }
				))
			},
		);
	}

	/// 列表结构视图
	Widget getCircleListArea(
		BuildContext context,
		String avataUrl,
		String chapter1Url,
		String chapter2Url,
		dynamic chatNum,
		dynamic favNum,
		String chatTitle,
		String chatDesc) {
		return Row(
			crossAxisAlignment: CrossAxisAlignment.start,
			children: <Widget>[
				Container(
					width: 120.0,
					height: 105.0,
					decoration: BoxDecoration(
					image: DecorationImage(
						image:NetworkImage(avataUrl, headers: this.getCrossHeaders()), 
						fit: BoxFit.cover),
						border: Border.all(
							color: Colors.grey.withOpacity(0.5), width: 0.5
						),
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
							width: MediaQuery.of(context).size.width - 170,
							child: Row(
							children: <Widget>[
									Container(
										width: 10.0,
										height: 10.0,
										decoration: BoxDecoration(
										image: DecorationImage(
											image: AssetImage('assets/images/speechbubble.png'),
											fit: BoxFit.cover),
										),
									),
									SizedBox(width: 10.0),
									Text(this.getDateText(chatNum),
										style: TextStyle(color: Colors.grey, fontSize: 12.0)),
									Spacer(),
									Container(
										width: 80.0,
										child: Text('[$favNum]',
										textAlign: TextAlign.right,
										overflow: TextOverflow.ellipsis,
										style: TextStyle(
											color: Colors.black.withOpacity(0.8), 
											fontSize: 12.0,
										))
									)
								],
							),
						)
					],
				)
			],
		);
	}
}