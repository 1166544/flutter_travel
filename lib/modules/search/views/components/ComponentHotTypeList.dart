import 'package:flutter/material.dart';
import 'package:flutter_travel/core/manager/ManagerEnviroment.dart';
import 'package:flutter_travel/modules/common/CommonImageNetwork.dart';
import 'package:flutter_travel/modules/common/CommonText.dart';
import 'package:flutter_travel/modules/search/models/model-container/ModelSearchCards.dart';
import 'package:flutter_travel/modules/search/views/components/ComponentSearchHotItem.dart';
import 'package:flutter_travel/modules/utils/Utils.dart';

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
		List<Widget> renderList = [];

		if (widget.list != null) {
			for (var i = 0; i < widget.list.length; i++) {
				ModelSearchCards item = widget.list[i];
				renderList.add(this.getTopicListItem(item));
			}
		}

		return Column(
			children: renderList
		);
	}

	/// 热门列表项
	Widget getTopicListItem(ModelSearchCards item) {
		String coverUrl = ManagerEnviroment.instance.getEnv().loginLogoUrl();
		String coverTitle = '#Any gate# exhibition has com to Beijing chaoyang Joy city';
		String coverUser = '';
		String coverTime = '';

		if (item.mblog != null) {
			coverUrl = item.mblog.thumbnailPic;
			coverTitle = Utils.splitHtml(item.mblog.text);
			coverUser = item.mblog.user.screenName;
			coverTime = item.mblog.createdAt;
		}

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
					Expanded(
						child: Column(
							crossAxisAlignment: CrossAxisAlignment.start,
							children: <Widget>[
								CommonText(coverTitle, color: Colors.black.withOpacity(0.6), fontSize: 16, maxLines: 5),
								SizedBox(height: 10),
								Row(
									mainAxisAlignment: MainAxisAlignment.start,
									children: <Widget>[
										Icon(Icons.verified_user, size: 15, color: Colors.grey),
										CommonText(coverUser, color: Colors.black.withOpacity(0.5), fontSize: 12, maxLines: 5),
										SizedBox(width: 20),
										Icon(Icons.calendar_today, size: 15, color: Colors.grey),
										CommonText(coverTime, color: Colors.black.withOpacity(0.2), fontSize: 12, maxLines: 5),
									]
								),
							]
						)
					)
				]
			),
		);
	}

	/// 热门标题
	Widget getHotTopic() {
		String hotTopicTitle = '#Taiwanese gays...#';
		String hotComment = '55.0k';

		if (widget.list != null && widget.list.length > 0) {
			ModelSearchCards cards = widget.list[0];
			hotTopicTitle = cards.mblog.source;
			hotComment = cards.mblog.numberDisplayStrategy.displayText;
		}

		return Padding(
			padding: EdgeInsets.fromLTRB(0, 20, 5, 0),
			child: Flex(
				direction: Axis.horizontal,
				children: <Widget>[
					ComponentSearchHotItem(),
					SizedBox(width: 5),
					CommonText(
						hotTopicTitle, 
						fontSize: 18, 
						fontWeight: FontWeight.w400, 
						color: Colors.black
					),
					Spacer(),
					CommonText(
						'$hotComment', 
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