import 'package:flutter/material.dart';
import 'package:flutter_travel/modules/common/CommonText.dart';
import 'package:flutter_travel/modules/search/models/ModelSearchPage.dart';
import 'package:flutter_travel/modules/search/models/ModelSearchTabChannel.dart';

/// 分类
class ComponentSearchType extends StatefulWidget {
	final ModelSearchPage pageConfig;
	final List<ComponentSearchIconItem> menuListData = [
		ComponentSearchIconItem(firstColor: Color(0xFF5c46e1), secondColor: Color(0xFF9661f3), iconData: Icons.movie),
		ComponentSearchIconItem(firstColor: Color(0xFFfa7401), secondColor: Color(0xFFf89e1f), iconData: Icons.location_city),
		ComponentSearchIconItem(firstColor: Color(0xFFf64027), secondColor: Color(0xFFf8935e), iconData: Icons.games),
		ComponentSearchIconItem(firstColor: Color(0xFFf64027), secondColor: Color(0xFFf8935e), iconData: Icons.live_tv),
		ComponentSearchIconItem(firstColor: Color(0xFF99979a), secondColor: Color(0xFFe2e2e2), iconData: Icons.border_vertical),
	];
	ComponentSearchType({Key key, this.pageConfig}) : super(key: key);

	_ComponentSearchTypeState createState() => _ComponentSearchTypeState();
}

class _ComponentSearchTypeState extends State<ComponentSearchType> {

	@override
	Widget build(BuildContext context) {
		List<Widget> renderList = [];
		int chanelLength = widget.pageConfig.tabList.data.channel.length;
		List<ModelSearchTabChannel> channel = widget.pageConfig.tabList.data.channel;

		for (var i = 0; i < widget.menuListData.length; i++) {
			if (i < chanelLength) {
				renderList.add(this.getTypeIcon(channelData: channel[i], iconInfo: widget.menuListData[i]));
			}
		}
		
		return Padding(
			padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
			child: Row(
				crossAxisAlignment: CrossAxisAlignment.center,
				mainAxisAlignment: MainAxisAlignment.spaceEvenly,
				children: renderList
			),
		);
	}

	/// 分类按钮
	Widget getTypeIcon({ModelSearchTabChannel channelData, ComponentSearchIconItem iconInfo}) {
		return Column(
			children: <Widget>[
					Container(
					width: 50,
					height: 50,
					decoration: BoxDecoration(
						shape: BoxShape.rectangle,
						borderRadius: BorderRadius.circular(50),
						gradient: LinearGradient(
							colors: [iconInfo.firstColor, iconInfo.secondColor],
							begin: Alignment.topLeft,
							end: Alignment.bottomRight,
							stops: [0.4, 1]
						)
					),
					child: Center(
						child: Icon(iconInfo.iconData, size: 26, color: Colors.white)
					),
				),
				SizedBox(height: 8),
				CommonText(channelData.name, color: Colors.black.withOpacity(0.9), fontSize: 16)
			],
		);
	}
}

/// 按钮数据项
class ComponentSearchIconItem {
	Color firstColor;
	Color secondColor;
	IconData iconData;
	ComponentSearchIconItem({this.firstColor, this.secondColor, this.iconData});
}