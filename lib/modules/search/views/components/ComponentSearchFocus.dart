import 'package:flutter/material.dart';
import 'package:flutter_travel/core/manager/ManagerEnviroment.dart';
import 'package:flutter_travel/modules/common/CommonImageNetwork.dart';
import 'package:flutter_travel/modules/common/CommonText.dart';
import 'package:flutter_travel/modules/search/models/model-container/ModelSearchCards.dart';
import 'package:flutter_travel/modules/utils/Utils.dart';

/// 头条
class ComponentSearchFocus extends StatefulWidget {
	final List<ModelSearchCards> list;
	ComponentSearchFocus({Key key, this.list}) : super(key: key);

	_ComponentSearchFocusState createState() => _ComponentSearchFocusState();
}

class _ComponentSearchFocusState extends State<ComponentSearchFocus> {
	@override
	Widget build(BuildContext context) {

		// 三张图边界计算
		String coverUrl = ManagerEnviroment.instance.getEnv().loginLogoUrl();
		String cover1Url = coverUrl;
		String cover1Title = '';
		String cover2Url = coverUrl;
		String cover2Title = '';
		String cover3Url = coverUrl;
		String cover3Title = '';

		if (widget.list != null && widget.list.length > 2) {
			cover1Url = widget.list[0].mblog.thumbnailPic;
			cover1Title = Utils.splitHtml(widget.list[0].mblog.text);

			cover2Url = widget.list[1].mblog.thumbnailPic;
			cover2Title = Utils.splitHtml(widget.list[1].mblog.text);

			cover3Url = widget.list[2].mblog.thumbnailPic;
			cover3Title = Utils.splitHtml(widget.list[2].mblog.text);
		}

		double screenWidth = MediaQuery.of(context).size.width;
		double leftWidth = screenWidth / 2 + 40;
		double rightGap = 6;
		double paddingNum = 10;
		double rightWidth = screenWidth - leftWidth - rightGap - paddingNum - paddingNum;
		double coverHeight = 180;
		double rightHheight = coverHeight / 2 - rightGap /2;
		
		return Padding(
			padding: EdgeInsets.only(left: paddingNum, right: paddingNum, top: 30.0, bottom: 1),
			child: Row(
				mainAxisAlignment: MainAxisAlignment.start,
				crossAxisAlignment: CrossAxisAlignment.start,
				children: <Widget>[
					// 左边
					this.getStackCover(
						width: leftWidth, 
						height: coverHeight, 
						coverUrl: cover1Url,
						coverTitle: cover1Title,
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
								coverUrl: cover2Url,
								coverTitle: cover2Title,
							),
							SizedBox(height: rightGap),
							this.getStackCover(
								width: rightWidth, 
								height: rightHheight, 
								coverUrl: cover3Url,
								coverTitle: cover3Title,
							),
						],
					)
				]
			)
		);

	}

	/// 封装封面内容
	Widget getStackCover({double width, double height, String coverUrl, String coverTitle, int coverType = 0, bool showIcon = false}) {
		
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
					shape: BoxShape.rectangle,
					borderRadius: BorderRadius.circular(8),
				),
				child: CommonText(
					coverTitle, 
					softWrap: true, 
					maxLines: 2,
					style: TextStyle(
						fontSize: 16, 
						color: Colors.white
					)
				)
			)
		]);
	}
}