import 'package:flutter/material.dart';
import 'package:flutter_travel/core/manager/ManagerEnviroment.dart';
import 'package:flutter_travel/modules/common/CommonImageNetwork.dart';
import 'package:flutter_travel/modules/common/CommonText.dart';
import 'package:flutter_travel/modules/search/models/model-container/ModelSearchCards.dart';
import 'package:flutter_travel/modules/search/models/model-container/ModelSearchPics.dart';
import 'package:flutter_travel/modules/search/models/model-container/ModelSearchUser.dart';
import 'package:flutter_travel/modules/search/views/components/ComponentSearchVideoPlayer.dart';
import 'package:flutter_travel/modules/utils/Utils.dart';

/// 长列表
class ComponentSearchList extends StatefulWidget {
	final ModelSearchCards renderData;
	final String coverUrl = ManagerEnviroment.instance.getEnv().loginLogoUrl();
	ComponentSearchList({Key key, this.renderData}) : super(key: key);

	_ComponentSearchListState createState() => _ComponentSearchListState();
}

class _ComponentSearchListState extends State<ComponentSearchList> {

  	@override
  	Widget build(BuildContext context) {
		return Container(
			width: MediaQuery.of(context).size.width,
			padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
			child: Column(
				mainAxisAlignment: MainAxisAlignment.start,
				crossAxisAlignment: CrossAxisAlignment.start,
				children: <Widget>[
					// 标题
					this.getContentTitle(),

					// 内容
					this.getContentText(),

					// 内容图片、视频
					this.getContentMedia(),

					// 操作按钮
					this.getContentOperationButtton()
				]
			),
		);
	}

	/// 操作按钮
	Widget getContentOperationButtton() {
		return Padding(
			padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
			child: Column(
				children: <Widget>[
					Row(
						children: <Widget>[
							this.getOperateButton(Icons.collections_bookmark, color: Colors.lightBlue, num: widget.renderData.mblog.attitudesCount),
							SizedBox(width: 32),
							this.getOperateButton(Icons.chat, color: Colors.grey, num: widget.renderData.mblog.commentsCount),
							SizedBox(width: 32),
							this.getOperateButton(Icons.settings_ethernet, color: Colors.grey, num: widget.renderData.mblog.repostsCount),
							Spacer(),
							this.getOperateButton(Icons.timeline, color: Colors.grey),
							SizedBox(width: 22)
						],
					),
					SizedBox(height: 15),
					Container(
						height: 2,
						decoration: BoxDecoration(
							shape: BoxShape.rectangle,
							color: Colors.grey.withOpacity(0.1)
						),
					),
					SizedBox(height: 15),
				]
			),
		);
	}

	/// 操作小图标
	Widget getOperateButton(IconData icon, {Color color = Colors.grey, int num = 12}) {
		return Row(
			crossAxisAlignment: CrossAxisAlignment.start,
			children: <Widget>[
				Icon(icon, size: 22, color: color),
				CommonText(num.toString(), color: color, fontSize: 10)
			]
		);
	}

	/// 内容图片、视频
	Widget getContentMedia() {
		Widget renderContent;
		int type = 1;

		// pageInfo存在-视频
		// pics存在，图片宫格形式
		// 三图以下 column
		// 三图以上 grid
		if (widget.renderData.mblog.pageInfo != null) {
			// 视频
			type = 2;
		} else {
			if (widget.renderData.mblog.pics != null) {
				if (widget.renderData.mblog.pics.length >= 9) {
					// 九宫格
					type = 3;
				} else {
					if (widget.renderData.mblog.pics.length == 3) {
						// 正方形三宫格
						type = 1;
					} else {
						// 长方形三栏
						type = 0;
					}
				}
			}
		}

		switch(type) {
			case 0:
				// 长方形三宫格展示方式
				renderContent = this.getThreeColumn();
				break;
			case 1:
				// 正方形三宫格展示方式
				renderContent = this.getThreeRectColumn();
				break;
			case 2:
				// 视频展示方式
				renderContent = this.getVideoColumn();
				break;
			case 3:
				// 九宫格展示方式
				renderContent = this.getGridColumn();
				break;
			default:
				renderContent = this.getThreeColumn();
				break;
		}

		return renderContent;
	}

	/// 九宫格形式
	Widget getGridColumn() {
		List<Widget> renderList = [];
		int targetNum = widget.renderData.mblog.pics.length;
		double imageWidth = MediaQuery.of(context).size.width / 3 - 10;
		int maxShowPicNum = 9;
		if (targetNum > maxShowPicNum) {
			targetNum = maxShowPicNum;
		}

		for (var i = 0; i < targetNum; i++) {
			ModelSearchPics item = widget.renderData.mblog.pics[i];

			// 最后一个显示还剩多少张
			if (i == targetNum - 1) {
				int renaimNum = widget.renderData.mblog.pics.length - maxShowPicNum;
				renderList.add(this.getColumnImage(width: imageWidth, columnData: item, renaimNum: renaimNum));
			} else {
				renderList.add(this.getColumnImage(width: imageWidth, columnData: item));
			}
		}

		return Container(
			width: MediaQuery.of(context).size.width,
			height: 390,
			child: GridView.count(
				crossAxisCount: 3,
				crossAxisSpacing: 4,
				mainAxisSpacing: 4,
				padding: EdgeInsets.all(4.0),
				childAspectRatio: 1,
				children: renderList,
			),
		);
	}

	/// 正方形三宫格展示方式
	/// * [double gap] 间隔
	/// * [double padding] 左右间矩
	/// * [double radius] 圆角度
	/// * [double rightWidth] 右边宽度
	/// * [double rightHeight] 右边高度
	Widget getThreeRectColumn({double gap = 10, double rightHeight = 90, double padding = 20, double rightWidth = 120, double radius = 5.0}) {
		return Container(
			padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
			child: Row(
				mainAxisAlignment: MainAxisAlignment.start,
				crossAxisAlignment: CrossAxisAlignment.start,
				children: <Widget>[
					this.getColumnImage(
						width: MediaQuery.of(context).size.width - padding - gap - rightWidth,
						height: rightHeight * 2 + gap,
						radius: radius,
						columnData: widget.renderData.mblog.pics[0]
					),
					SizedBox(width: gap),
					Column(
						crossAxisAlignment: CrossAxisAlignment.start,
						children: <Widget>[
							this.getColumnImage(width: rightWidth, height: rightHeight, radius: radius, columnData: widget.renderData.mblog.pics[1]),
							SizedBox(height: gap),
							this.getColumnImage(width: rightWidth, height: rightHeight, radius: radius, columnData: widget.renderData.mblog.pics[2]),
						],
					),
				]
			)
		);
	}

	/// 长方形三宫格展示方式
	Widget getThreeColumn() {

		List<Widget> renderList = [];
		int maxShowPicNum = 3;
		double imageWidth = MediaQuery.of(context).size.width / 3 - 10;
		int targetNum = widget.renderData.mblog.pics.length;
		if (targetNum >= maxShowPicNum) {
			targetNum = maxShowPicNum;
		}
		for (var i = 0; i < targetNum; i++) {
			ModelSearchPics item = widget.renderData.mblog.pics[i];

			// 最后一个显示还剩多少张 
			if (i == targetNum - 1) {
				int renaimNum = widget.renderData.mblog.pics.length - maxShowPicNum;
				renderList.add(this.getColumnImage(width: imageWidth, columnData: item, renaimNum: renaimNum));
			} else {
				renderList.add(this.getColumnImage(width: imageWidth, columnData: item));
			}
		}

		// 如果不足三张，补足空白
		while (renderList.length < maxShowPicNum) {
			renderList.add(this.getColumnImage(width: imageWidth, columnData: null));
		}

		return Container(
			padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
			child: Row(
				mainAxisAlignment: MainAxisAlignment.spaceBetween,
				children: renderList
			)
		);
	}
	
	/// 圆角图片
	Widget getColumnImage({double width = 120, double height = 90, double radius = 3.0, ModelSearchPics columnData, int renaimNum = 0}) {

		// 兼容显示空内容
		if (columnData == null) {
			return Container(
				width: width,
				height: height,
				decoration: BoxDecoration(
					border: Border.all(color: Colors.black.withOpacity(0.2), width: 0.5),
					borderRadius:
						BorderRadius.all(Radius.circular(radius)),
					shape: BoxShape.rectangle,
					color: Colors.black.withOpacity(0.1)
				),
			);
		}

		if (renaimNum > 0) {
			// 显示剩余多少张
			return Container(
				width: width,
				height: height,
				decoration: BoxDecoration(
					border: Border.all(color: Colors.black.withOpacity(0.3), width: 0.5),
					borderRadius:
						BorderRadius.all(Radius.circular(radius)),
					image: DecorationImage(
						image: CommentImageNetwork.imageNetwork(columnData.url ?? widget.coverUrl),
						fit: BoxFit.cover)
				),
				child: Container(
					width: width,
					height: height,
					decoration: BoxDecoration(
						shape: BoxShape.rectangle,
						color: Colors.black.withOpacity(0.3)
					),
					child: Center(
						child: CommonText('+ ${renaimNum.toString()}', color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold,)
					),	
				),
			);
		} else {
			// 显示默认
			return Container(
				width: width,
				height: height,
				decoration: BoxDecoration(
					border: Border.all(color: Colors.black.withOpacity(0.2), width: 0.5),
					borderRadius:
						BorderRadius.all(Radius.circular(radius)),
					image: DecorationImage(
						image: CommentImageNetwork.imageNetwork(columnData.url ?? widget.coverUrl),
						fit: BoxFit.cover)
				),
			);
		}
	}

	/// 视频展示方式
	Widget getVideoColumn() {
		double videoWidth = MediaQuery.of(context).size.width - 20;
		double videoHeight = 250;
		return ComponentSearchVideoPlayer(
			videoWidth: videoWidth, 
			videoHeight: videoHeight, 
			renderData: widget.renderData
		);
	}

	/// 微博内容
	Widget getContentText() {
		String secondText = '';
		if (widget.renderData != null && 
			widget.renderData.mblog != null && 
			widget.renderData.mblog.numberDisplayStrategy != null && 
			widget.renderData.mblog.numberDisplayStrategy.displayText != null) {
			secondText = widget.renderData.mblog.numberDisplayStrategy.displayText;
		}

		return Container(
			width: MediaQuery.of(context).size.width,
			padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
			child: Column(
				mainAxisAlignment: MainAxisAlignment.start,
				crossAxisAlignment: CrossAxisAlignment.start,
				children: <Widget>[
					CommonText(
						Utils.splitHtml(widget.renderData.mblog.text), 
						fontSize: 17, 
						fontWeight: FontWeight.w500, 
						color: Colors.black.withOpacity(0.7), 
						maxLines: 6
					),
					CommonText(secondText, fontSize: 14, fontWeight: FontWeight.w300, color: Colors.grey.withOpacity(0.5)),
				]
			)
		);
	}

	/// 横向标题
	Widget getContentTitle() {
		ModelSearchUser user = widget.renderData.mblog.user;
		String headUrl = user.profileImageUrl ?? widget.coverUrl;
		double rowWidth = MediaQuery.of(context).size.width;

		return Container(
			width: rowWidth,
			child: Row(
				mainAxisAlignment: MainAxisAlignment.start,
				crossAxisAlignment: CrossAxisAlignment.start,
				children: <Widget>[
					// 头象
					Hero(
						tag: headUrl,
						child: Container(
							width: 40,
							height: 40,
							decoration: BoxDecoration(
								borderRadius: BorderRadius.circular(25),
								image: DecorationImage(
									image: CommentImageNetwork.imageNetwork(headUrl),
									fit: BoxFit.cover
								),
								boxShadow: [
									BoxShadow(
										color: Colors.grey.withOpacity(0.3),
										offset: Offset(1.0, 1.0),
										blurRadius: 1,
										spreadRadius: 1
									)
								] 
							),
						),
					),
					SizedBox(width: 8),
					Container(
						width: rowWidth - 40 - 8 - 22,
						child: Column(
							mainAxisAlignment: MainAxisAlignment.start,
							crossAxisAlignment: CrossAxisAlignment.start,
							children: <Widget>[
								CommonText(user.screenName, fontWeight: FontWeight.w500, fontSize: 18),
								CommonText(
									'${user.verifiedReason ?? ""}', 
									fontWeight: FontWeight.normal, 
									fontSize: 13, 
									color: Colors.grey.withOpacity(0.7), 
									maxLines: 2
								),
							]
						)
					),
					// Spacer(),
					// Icon(Icons.keyboard_arrow_down, size: 22, color: Colors.grey.withOpacity(0.5))
				]
			)
		);
	}
}