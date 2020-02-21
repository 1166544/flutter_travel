import 'package:flutter/material.dart';
import 'package:flutter_travel/modules/common/CommonText.dart';
import 'package:flutter_travel/modules/search/models/model-container/ModelSearchCards.dart';
import 'package:flutter_travel/modules/search/views/components/ComponentSearchHotItem.dart';
import 'package:flutter_travel/modules/utils/Utils.dart';

/// 热搜文字列表
class ComponentHotSearch extends StatefulWidget {
	final List<ModelSearchCards> list;
	ComponentHotSearch({Key key, this.list}) : super(key: key);

	_ComponentHotSearchState createState() => _ComponentHotSearchState();
}

class _ComponentHotSearchState extends State<ComponentHotSearch> {
	@override
	Widget build(BuildContext context) {

		List<Widget> renderList = [
			this.getHotTitle(),
			SizedBox(height: 20),
		];
		renderList = this.getDynamicTitle(renderList);

		return Padding(
			padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
			child: Column(children: renderList),
		);
	}

	/// 动态生成标题
	List<Widget> getDynamicTitle(List<Widget> renderList) {
		int total = widget.list.length;
		int lines = (total / 2).round();
		List<List<ModelSearchCards>> dynamicList = [];

		// 拼足行数
		for (var i = 0; i < lines; i++) {
			dynamicList.add([]);
		}

		// 拼足每行内容子列表数据
		for (var k = 0; k < total; k++) {
			ModelSearchCards insertItem = widget.list[k];

			for (var j = 0; j < dynamicList.length; j++) {
				List<ModelSearchCards> addedList = dynamicList[j];

				if (addedList.length < 2) {
					addedList.add(insertItem);
					break;
				}
			}
		}

		// 拼装显示列表
		for (var h = 0; h < dynamicList.length; h++) {
			renderList.add(this.getHotItem(dynamicList[h]));
		}
		return renderList;
	}

	/// 微博标题
	Widget getHotTitle() {
		return Row(
			crossAxisAlignment: CrossAxisAlignment.center,
			mainAxisAlignment: MainAxisAlignment.center,
			children: <Widget>[
				CommonText('Hot search', fontWeight: FontWeight.bold, fontSize: 20),
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

	/// 热搜显示列表
	Widget getHotItem(List<ModelSearchCards> list) {

		List<Widget> renderList = [];
		for (var i = 0; i < list.length; i++) {
			renderList.add(this.getHotRenderItem(list[i]));
		}

		return Container(
			margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
			width: MediaQuery.of(this.context).size.width,
			height: 55,
			child: ListView(
				padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
				scrollDirection: Axis.horizontal,
				children: renderList,
			),
		);
	}

	/// 热搜显示项
	Widget getHotRenderItem(ModelSearchCards content) {
		return Container(
			margin: EdgeInsets.fromLTRB(0, 0, 15, 15),
			padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
			decoration: BoxDecoration(
				shape: BoxShape.rectangle,
				color: Colors.grey.withOpacity(0.2),
				borderRadius: BorderRadius.circular(18)
			),
			child: Row(
				children: <Widget>[
					this.getHotIcon(content.mblog.attitudesCount),
					SizedBox(width: 5),
					CommonText(Utils.splitHtml(content.mblog.text))
				]
			),
		);
	}

	/// 热搜小图标
	Widget getHotIcon(int type) {
		if (type > 300) {
			return ComponentSearchHotItem(text: 'hot', firstColor: Color(0xffff5626), lastColor: Color(0xFFfd9d83));
		} else {
			return ComponentSearchHotItem(text: 'new', firstColor: Color(0xFFff4c62), lastColor: Color(0xFFff9fae));
		}
	}
}