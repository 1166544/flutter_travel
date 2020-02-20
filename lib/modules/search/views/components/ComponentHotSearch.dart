import 'package:flutter/material.dart';
import 'package:flutter_travel/modules/common/CommonText.dart';
import 'package:flutter_travel/modules/search/views/components/ComponentSearchHotItem.dart';

/// 热搜文字列表
class ComponentHotSearch extends StatefulWidget {
	ComponentHotSearch({Key key}) : super(key: key);

	_ComponentHotSearchState createState() => _ComponentHotSearchState();
}

class _ComponentHotSearchState extends State<ComponentHotSearch> {
	@override
	Widget build(BuildContext context) {
		return Padding(
			padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
			child: Column(
				children: <Widget>[
					this.getHotTitle(),
					SizedBox(height: 20),
					this.getHotItem([
						'Taiwanese gays can get marrried',
						'Movie citiy games live more'
					]),
					this.getHotItem([
						'Love dearly Faker',
						'The most memorable village'
					]),
				]
			),
		);
	}

	/// 微博标题
	Widget getHotTitle() {
		return Row(
			crossAxisAlignment: CrossAxisAlignment.center,
			mainAxisAlignment: MainAxisAlignment.center,
			children: <Widget>[
				CommonText('Weibo hot search', fontWeight: FontWeight.bold, fontSize: 20),
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
	Widget getHotItem(List<String> list) {

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
	Widget getHotRenderItem(String content, {int type = 0}) {
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
					this.getHotIcon(type),
					SizedBox(width: 5),
					CommonText(
						content,
						fontSize: 16
					)
				]
			),
		);
	}

	/// 热搜小图标
	Widget getHotIcon(int type) {
		return ComponentSearchHotItem();
	}
}