import 'package:flutter/material.dart';
import 'package:flutter_travel/core/manager/ManagerEnviroment.dart';
import 'package:flutter_travel/modules/common/CommonImageNetwork.dart';
import 'package:flutter_travel/modules/common/CommonText.dart';
import 'package:flutter_travel/modules/search/views/components/ComponentSearchHotItem.dart';

/// 头条
class ComponentSearchFocus extends StatefulWidget {
  ComponentSearchFocus({Key key}) : super(key: key);

  _ComponentSearchFocusState createState() => _ComponentSearchFocusState();
}

class _ComponentSearchFocusState extends State<ComponentSearchFocus> {
	@override
	Widget build(BuildContext context) {

		// 三张图边界计算
		String coverUrl = ManagerEnviroment.instance.getEnv().loginLogoUrl();
		double screenWidth = MediaQuery.of(context).size.width;
		double leftWidth = screenWidth / 2 + 40;
		double rightGap = 6;
		double paddingNum = 10;
		double rightWidth = screenWidth - leftWidth - rightGap - paddingNum - paddingNum;
		double coverHeight = 180;
		double rightHheight = coverHeight / 2 - rightGap /2;
		
		return Padding(
			padding: EdgeInsets.only(left: paddingNum, right: paddingNum, top: 30.0),
			child: Row(
				mainAxisAlignment: MainAxisAlignment.start,
				crossAxisAlignment: CrossAxisAlignment.start,
				children: <Widget>[
					// 左边
					this.getStackCover(
						width: leftWidth, 
						height: coverHeight, 
						coverUrl: coverUrl,
						coverTitle: 'May 17 is no longer... ',
						showIcon: true
					),
					SizedBox(width: rightGap),
					// 右边
					Column(
						mainAxisAlignment: MainAxisAlignment.start,
						crossAxisAlignment: CrossAxisAlignment.start,
						children: <Widget>[
							this.getStackCover(
								width: rightWidth, 
								height: rightHheight, 
								coverUrl: coverUrl,
								coverTitle: '130 million to read... ',
							),
							SizedBox(height: rightGap),
							this.getStackCover(
								width: rightWidth, 
								height: rightHheight, 
								coverUrl: coverUrl,
								coverTitle: 'List of topics... '
							),
						],
					)
				]
			)
		);

	}

	/// 封装封面内容
	Widget getStackCover({double width, double height, String coverUrl, String coverTitle, int coverType = 0, bool showIcon = false}) {
		
		List<Widget> renderTextList = <Widget>[
			Expanded(
				child: CommonText(
					coverTitle, 
					softWrap: true, 
					maxLines: 2,
					style: TextStyle(
						fontSize: 18, 
						color: Colors.white
					)
				)
			)
		];

		if (showIcon) {
			renderTextList.insert(0, Container(
				margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
				child: ComponentSearchHotItem()
			));
		}

		return Stack(children: <Widget>[
			Container(
				width: width,
				height: height,
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
			Container(
				width: width,
				height: height,
				padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
				decoration: BoxDecoration(
					gradient: LinearGradient(
						begin: Alignment.topCenter,
						end: Alignment.bottomCenter,
						stops: [0.7, 1],
						colors: [
							Colors.black.withOpacity(0.0),
							Colors.black.withOpacity(0.7),
						],
					),
					borderRadius: BorderRadius.circular(8),
				),
				child: Flex(
					mainAxisAlignment: MainAxisAlignment.center,
					crossAxisAlignment: CrossAxisAlignment.end,
					direction: Axis.horizontal,
					children: renderTextList
				)
			)
		]);
	}
}