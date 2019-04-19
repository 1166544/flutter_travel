import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_travel/common/CommonPhotoViewer.dart';
import 'package:flutter_travel/pages/PageOrderView.dart';
import 'package:flutter_travel/pages/PageProfile.dart';

class CommonTravelItem {
  /// 构建图片网格
  Widget buildImageGrid(BuildContext context, List<CommonGalleryItem> imageList, {double paddingTop = 25.0}) {
    return Padding(
      padding: EdgeInsets.only(top: paddingTop, left: 15.0, right: 15.0),
      child: Container(
        height: 225.0,
        child: Row(
          children: <Widget>[
            Container(
              height: 225.0,
              child: this.buildComumnImage(context, imageList),
            )
          ],
        ),
      ),
    );
  }

  /// 点击后显示图片
  void showPhoto(BuildContext context, List<CommonGalleryItem> list, int index) {

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
  Widget buildComumnImage(BuildContext context, List<CommonGalleryItem> imageList) {

    return Row(
      children: <Widget>[
		  GestureDetector(
			onTap: () {
				this.showPhoto(context, imageList, 0);
			},
			// 左部大图
			child: this.buildLeftBigImage(context, imageList[0].image)
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
				child: this.buildRightTopSmallImage(context, imageList[1].image),
			),
            SizedBox(height: 2.0),
            // 右下小图
			GestureDetector(
				onTap: () {
					this.showPhoto(context, imageList, 2);
				},
				child: this.buildRightBottomSmallImage(context, imageList[2].image),
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
			borderRadius:
				BorderRadius.only(bottomRight: Radius.circular(15.0)),
			image: DecorationImage(
				image: AssetImage(assistantImage2Url),
				fit: BoxFit.cover)),
	);
  }

  /// 右上小图
  Widget buildRightTopSmallImage(BuildContext context, String assistantImage1Url) {
	  return Container(
		height: 111.5,
		width: MediaQuery.of(context).size.width / 2 - 72.0,
		decoration: BoxDecoration(
			borderRadius:
				BorderRadius.only(topRight: Radius.circular(15.0)),
			image: DecorationImage(
				image: AssetImage(assistantImage1Url),
				fit: BoxFit.cover)),
		);
  }

  /// 左部大图
  Widget buildLeftBigImage(BuildContext context, String leftImageUrl) {
	  return Container(
		height: 225.0,
		width: MediaQuery.of(context).size.width / 2 + 40.0,
		decoration: BoxDecoration(
			borderRadius: BorderRadius.only(topLeft: Radius.circular(15.0), bottomLeft: Radius.circular(15.0)),
			image: DecorationImage(image: AssetImage(leftImageUrl), fit: BoxFit.cover)
		)
	);
  }

  /// 图片详情
  Widget buildImgGalleryDetail(BuildContext context, String mainTitle,
      String subTitle, String timeTitle) {
    return Padding(
      padding: EdgeInsets.only(left: 25.0, right: 15.0, top: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 200,
                child: InkWell(
                  child: Text(mainTitle,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
                          fontSize: 15.0)),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      var ran = Random().nextInt(100);
                      return ran < 50 ? PageOrderView() : PageProfile();
                    }));
                  },
                ),
              ),
              SizedBox(height: 4.0),
              Row(
                children: <Widget>[
                  Container(
                    width: 150,
                    child: Text(subTitle,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.grey.shade700,
                            fontFamily: 'Montserrat',
                            fontSize: 11.0)),
                  ),
                  timeTitle.isNotEmpty
                      ? SizedBox(width: 4.0)
                      : SizedBox(width: 0.0),
                  timeTitle.isNotEmpty
                      ? Icon(Icons.timer, size: 12.0, color: Colors.black)
                      : SizedBox(width: 0.0),
                  SizedBox(width: 4.0),
                  Text(timeTitle,
                      style: TextStyle(
                          color: Colors.grey.shade500,
                          fontFamily: 'Montserrat',
                          fontSize: 11.0))
                ],
              )
            ],
          ),
          Spacer(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              this.inkWellButton(
                  inkWidth: 20.0,
                  inkHeight: 20.0,
                  picUrl: 'assets/navarrow.png',
                  onCallBack: () {}),
              SizedBox(width: 12.0),
              this.inkWellButton(
                  inkWidth: 20.0,
                  inkHeight: 20.0,
                  picUrl: 'assets/chatbubble.png',
                  onCallBack: () {}),
              SizedBox(width: 12.0),
              this.inkWellButton(
                  inkWidth: 20.0,
                  inkHeight: 20.0,
                  picUrl: 'assets/fav.png',
                  onCallBack: () {}),
            ],
          )
        ],
      ),
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
