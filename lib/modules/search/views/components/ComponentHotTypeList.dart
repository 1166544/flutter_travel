import 'package:flutter/material.dart';
import 'package:flutter_travel/core/manager/ManagerEnviroment.dart';
import 'package:flutter_travel/modules/common/CommonImageNetwork.dart';
import 'package:flutter_travel/modules/common/CommonText.dart';
import 'package:flutter_travel/modules/search/models/model-container/ModelSearchCards.dart';
import 'package:flutter_travel/modules/search/views/components/ComponentSearchHotItem.dart';

/// 热门TAB
class ComponentHotTypeList extends StatefulWidget {
	final List<ModelSearchCards> list;
	ComponentHotTypeList({Key key, this.list}) : super(key: key);

	_ComponentHotTypeListState createState() => _ComponentHotTypeListState();
}

class _ComponentHotTypeListState extends State<ComponentHotTypeList> {
	@override
	Widget build(BuildContext context) {
		return Padding(
			padding: EdgeInsets.fromLTRB(10, 30, 5, 0),
			child: Column(
				children: <Widget>[
					this.getHotTitle(),
					this.getHotTopic(),
					this.getTopicList()
				],
			)
		);
	}

	/// 热门列表
	Widget getTopicList() {
		return Column(
			children: [
				this.getTopicListItem(),
				this.getTopicListItem(),
				this.getTopicListItem(),
			]
		);
	}

	/// 热门列表项
	Widget getTopicListItem() {
		String coverUrl = ManagerEnviroment.instance.getEnv().loginLogoUrl();
		
		return Padding(
			padding: EdgeInsets.fromLTRB(0, 20, 5, 0),
			child: Flex(
				direction: Axis.horizontal,
				mainAxisAlignment: MainAxisAlignment.start,
				crossAxisAlignment: CrossAxisAlignment.start,
				children: <Widget>[
					Container(
						width: 80,
						height: 80,
						decoration: BoxDecoration(
							shape: BoxShape.rectangle,
							color: Colors.grey.withOpacity(0.2),
							borderRadius: BorderRadius.circular(8),
							border: Border.all(color: Colors.grey.withOpacity(0.1))
						),
						child: ClipRRect(
							borderRadius: BorderRadius.circular(8),
							child: CommentImageNetwork.getNetworkImage(coverUrl, fit: BoxFit.cover),
						), 
					),
					SizedBox(width: 10),
					Expanded(child: CommonText('#Any gate# exhibition has com to Beijing chaoyang Joy city', color: Colors.black.withOpacity(0.6), fontSize: 16, maxLines: 5))
				]
			),
		);
	}

	/// 热门标题
	Widget getHotTopic() {
		return Padding(
			padding: EdgeInsets.fromLTRB(0, 20, 5, 0),
			child: Flex(
				direction: Axis.horizontal,
				children: <Widget>[
					ComponentSearchHotItem(),
					SizedBox(width: 5),
					CommonText(
						'#Taiwanese gays...#', 
						fontSize: 18, 
						fontWeight: FontWeight.w400, 
						color: Colors.black
					),
					Spacer(),
					CommonText(
						'55.0k comments', 
						fontSize: 14, 
						fontWeight: FontWeight.normal, 
						color: Colors.black.withOpacity(0.3)
					)
				],
			),
		);
	}

	/// 标题
	Widget getHotTitle() {
		return Row(
			crossAxisAlignment: CrossAxisAlignment.center,
			mainAxisAlignment: MainAxisAlignment.center,
			children: <Widget>[
				CommonText('Hot topic', fontWeight: FontWeight.bold, fontSize: 20),
				Spacer(),
				Row(
					crossAxisAlignment: CrossAxisAlignment.center,
					mainAxisAlignment: MainAxisAlignment.center,
					children: <Widget>[
						CommonText('more', color: Colors.grey, fontSize: 16),
						Icon(Icons.arrow_right, size: 19, color: Colors.grey)
					]
				)
			]
		);
	}
}