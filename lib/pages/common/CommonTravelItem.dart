import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_travel/pages/common/CommonNavigator.dart';
import 'package:flutter_travel/pages/common/CommonPhotoViewer.dart';
import 'package:flutter_travel/pages/modules/circler/models/CirclerModelImage.dart';
import 'package:flutter_travel/pages/modules/circler/models/CirclerModelNewsItem.dart';
import 'package:flutter_travel/pages/modules/order/OrderPageView.dart';
import 'package:flutter_travel/pages/modules/profile/ProfilePage.dart';

class CommonTravelItem {

	CommonNavigator navigatorData = new CommonNavigator();

	/// 返回加载中圆圈
	Widget getLoadingItem() {
		return new Container(
			padding: EdgeInsets.all(16.0),
			alignment: Alignment.center,
			child: SizedBox(
				width: 24.0,
				height: 24.0,
				child: CircularProgressIndicator(strokeWidth: 2.0,),
			),
		);
	}

	/// 返回没有更多提示
	Widget getNoMoreItem() {
		return Container(
			padding: EdgeInsets.fromLTRB(0, 5.0, 0, 5.0),
			decoration: BoxDecoration(
				color: Colors.grey.withOpacity(0.3)
			),
			child: Center(
				child: Text(
					'没有更多了~',
					style: TextStyle(color: Colors.black)
				),
			),
		);
	}

  /// 构建图片网格
  Widget buildImageGrid(BuildContext context, CirclerModelNewsItem item, {double paddingTop = 25.0}) {
    return Padding(
      padding: EdgeInsets.only(top: paddingTop, left: 15.0, right: 15.0),
      child: Container(
        height: 225.0,
        child: Row(
          children: <Widget>[
            Container(
              height: 225.0,
              child: this.buildComumnImage(context, item.imageurls),
            )
          ],
        ),
      ),
    );
  }

  /// 点击后显示图片
  void showPhoto(BuildContext context, List<CirclerModelImage> list, int index) {

	  Navigator.push(
		  context,
		  MaterialPageRoute<void>(
			 builder: (BuildContext context) {
				 return CommonPhotoViewer(
						galleryItems: list,
						initialIndex: index,
						backgroundDecoration: BoxDecoration(color: Colors.black)
					);
			 }
		  )
	  );
  }

  /// 构建封面图片(左边大图，右边上下小图结构)
  Widget buildComumnImage(BuildContext context, List<CirclerModelImage> imageList) {

    return Row(
      children: <Widget>[
		  GestureDetector(
			onTap: () {
				this.showPhoto(context, imageList, 0);
			},
			// 左部大图
			child: this.buildLeftBigImage(context, imageList[0].url)
		),
        SizedBox(width: 2.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
			// 右上小图
            GestureDetector(
				onTap: () {
					this.showPhoto(context, imageList, 1);
				},
				child: this.buildRightTopSmallImage(context, imageList[1].url),
			),
            SizedBox(height: 2.0),
            // 右下小图
			GestureDetector(
				onTap: () {
					this.showPhoto(context, imageList, 2);
				},
				child: this.buildRightBottomSmallImage(context, imageList[2].url),
			)
          ],
        ),
      ],
    );
  }

  /// 右下小图
  Widget buildRightBottomSmallImage(BuildContext context, String assistantImage2Url) {
	  return Container(
		height: 111.5,
		width: MediaQuery.of(context).size.width / 2 - 72.0,
		decoration: BoxDecoration(
			border: Border.all(color: Colors.black.withOpacity(0.3), width: 0.5),
			borderRadius:
				BorderRadius.only(bottomRight: Radius.circular(15.0)),
			image: DecorationImage(
				image: this.getDisplayImage(assistantImage2Url),
				fit: BoxFit.cover)),
	);
  }

  /// 右上小图
  Widget buildRightTopSmallImage(BuildContext context, String assistantImage1Url) {
	  return Container(
		height: 111.5,
		width: MediaQuery.of(context).size.width / 2 - 72.0,
		decoration: BoxDecoration(
			border: Border.all(color: Colors.black.withOpacity(0.3), width: 0.5),
			borderRadius:
				BorderRadius.only(topRight: Radius.circular(15.0)),
			image: DecorationImage(
				image: this.getDisplayImage(assistantImage1Url),
				fit: BoxFit.cover)),
		);
  }

	/// 图片显示
  dynamic getDisplayImage(String url) {
	//   assets/
	if (url.indexOf('assets/') != -1) {
		return AssetImage(url);
	} else {
		return NetworkImage(url, headers: this.navigatorData.getCrossHeaders());
	}
  }

  /// 左部大图
  Widget buildLeftBigImage(BuildContext context, String leftImageUrl) {
	  return Container(
		height: 225.0,
		width: MediaQuery.of(context).size.width / 2 + 40.0,
		decoration: BoxDecoration(
			border: Border.all(color: Colors.black.withOpacity(0.3), width: 0.5),
			borderRadius: BorderRadius.only(topLeft: Radius.circular(15.0), bottomLeft: Radius.circular(15.0)),
			image: DecorationImage(image: this.getDisplayImage(leftImageUrl), fit: BoxFit.cover)
		)
	);
  }

  /// 图片详情
  Widget buildImgGalleryDetail(BuildContext context, String mainTitle,
      String subTitle, String commentTitle) {
    return Padding(
      padding: EdgeInsets.only(left: 25.0, right: 15.0, top: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
			InkWell(
				child: Column(
					crossAxisAlignment: CrossAxisAlignment.start,
					mainAxisAlignment: MainAxisAlignment.start,
					children: <Widget>[
					Container(
						width: MediaQuery.of(context).size.width - 86,
						child: Text(
							mainTitle,
							overflow: TextOverflow.ellipsis,
							softWrap: false,
							style: TextStyle(
								fontWeight: FontWeight.bold,
								fontFamily: 'Montserrat',
								fontSize: 15.0)),
					),
					SizedBox(height: 4.0),
					this.buildSubTravelItem(subTitle, commentTitle, context),
					],
				),
				onTap: () {
                    this.navigateToSubPage(context);
                }
		  ),
          Spacer(),
			Column(
				children: <Widget>[
					this.inkWellButton(
				inkWidth: 20.0,
				inkHeight: 20.0,
				picUrl: 'assets/chatbubble.png',
				onCallBack: () {
					//   Navigator.push(
					// 	context,
					// 	MaterialPageRoute(builder: (context) => CommentsPage())
					//   );
				}),
				Text(commentTitle, style: TextStyle(
				fontSize: 13.0,
				color: Colors.black,
			),)
			],
		)
	]
      ),
    );
  }

  /// 导航至子页面
  void navigateToSubPage(BuildContext context) {
	  Navigator.push(context,
		MaterialPageRoute(builder: (context) {
		var ran = Random().nextInt(100);
		return ran < 50 ? OrderPageView() : ProfilePage();
	}));
  }

  Widget buildSubTravelItem(String subTitle, String timeTitle, BuildContext context) {
	  return Row(
		children: <Widget>[
			Container(
			width: MediaQuery.of(context).size.width - 100,
			child: Text(subTitle,
				softWrap: false,
				overflow: TextOverflow.ellipsis,
				style: TextStyle(
					color: Colors.grey.shade700,
					fontFamily: 'Montserrat',
					fontSize: 11.0)),
			),
			// timeTitle.isNotEmpty
			// 	? SizedBox(width: 4.0)
			// 	: SizedBox(width: 0.0),
			// timeTitle.isNotEmpty
			// 	? Icon(Icons.timer, size: 12.0, color: Colors.black)
			// 	: SizedBox(width: 0.0),
			// SizedBox(width: 4.0),
			// Text(timeTitle,
			// 	style: TextStyle(
			// 		color: Colors.grey.shade500,
			// 		fontFamily: 'Montserrat',
			// 		fontSize: 11.0))
		],
	);
  }

  /// 封装小型图标函数
  Widget inkWellButton(
      {double inkWidth, double inkHeight, String picUrl, Function onCallBack}) {
    return InkWell(
      onTap: onCallBack,
      child: Container(
        height: inkHeight,
        width: inkWidth,
        child: Image.asset(picUrl),
      ),
    );
  }
}
