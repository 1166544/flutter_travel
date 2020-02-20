import 'package:flutter/material.dart';
import 'package:flutter_travel/modules/common/CommonText.dart';
import 'package:flutter_travel/modules/search/models/ModelSearchPage.dart';

/// 热搜搜索条
class ComponentHotSearchBar extends StatefulWidget {
	final ModelSearchPage pageConfig;
	ComponentHotSearchBar({Key key, this.pageConfig}) : super(key: key);

	_ComponentHotSearchBarState createState() => _ComponentHotSearchBarState();
}

class _ComponentHotSearchBarState extends State<ComponentHotSearchBar> {
	String hotWord = '';


	@override
	Widget build(BuildContext context) {
		// 加工热搜标题
		if (widget.pageConfig != null && 
			widget.pageConfig.tabList != null && 
			widget.pageConfig.tabList.data != null &&
			widget.pageConfig.tabList.data.hot != null) {
			hotWord = widget.pageConfig.tabList.data.hot.hotWord;
		}

		return Container(
			width: MediaQuery.of(context).size.width,
			height: 50,	
			decoration: BoxDecoration(
				color: Colors.white,
				shape: BoxShape.rectangle
			),
			child: Container(
				margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
				decoration: BoxDecoration(
					shape: BoxShape.rectangle,
					color: Colors.grey.withOpacity(0.2),
					borderRadius: BorderRadius.all(Radius.circular(25))
				),
				child: Center(
					child: Row(
						mainAxisAlignment: MainAxisAlignment.center,
						children: [
							Icon(
								Icons.search, 
								color: Colors.grey.withOpacity(0.7), 
								size: 25
							),
							SizedBox(width: 5),
							CommonText(
								hotWord, 
								fontSize: 16, 
								color: Colors.grey.withOpacity(0.7),
								fontWeight: FontWeight.w300,
							)				
						]
					),
				),
			),
		);
	}
}