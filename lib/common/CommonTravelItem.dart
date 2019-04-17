import 'package:flutter/material.dart';

class CommonTravelItem {

	/// 构建图片网格
	Widget buildImageGrid(BuildContext context, String leftImageUrl, String assistantImage1Url, String assistantImage2Url, {double paddingTop = 25.0}) {
		return Padding(
			padding: EdgeInsets.only(top: paddingTop, left: 15.0, right: 15.0),
			child: Container(
				height: 225.0,
				child: Row(
					children: <Widget>[
						Container(
							height: 225.0,
							child: Row(
								children: <Widget>[
									Container(
										height: 225.0,
										width: MediaQuery.of(context).size.width / 2 + 40.0,
										decoration: BoxDecoration(
											borderRadius: BorderRadius.only(topLeft: Radius.circular(15.0), bottomLeft: Radius.circular(15.0)),
											image: DecorationImage(image: AssetImage(leftImageUrl), fit: BoxFit.cover)
										),
									),
									SizedBox(width: 2.0),
									Column(
										crossAxisAlignment: CrossAxisAlignment.start,
										children: <Widget>[
											Container(
												height: 111.5,
												width: MediaQuery.of(context).size.width / 2 - 72.0,
												decoration: BoxDecoration(
													borderRadius: BorderRadius.only(topRight: Radius.circular(15.0)),
													image: DecorationImage(image: AssetImage(assistantImage1Url), fit: BoxFit.cover)
												),
											),
											SizedBox(height: 2.0),
											Container(
												height: 111.5,
												width: MediaQuery.of(context).size.width / 2 - 72.0,
												decoration: BoxDecoration(
													borderRadius: BorderRadius.only(bottomRight: Radius.circular(15.0)),
													image: DecorationImage(image: AssetImage(assistantImage2Url), fit: BoxFit.cover)
												),
											)
										],
									),
								],
							),
						)
					],
				),
			),
		);
	}

	/// 图片详情
	Widget buildImgGalleryDetail(String mainTitle, String subTitle, String timeTitle) {
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
							  child: Text(
								  mainTitle,
								  overflow: TextOverflow.ellipsis,
								  style:TextStyle(fontWeight:FontWeight.bold, fontFamily: 'Montserrat', fontSize: 15.0)
							  ),
						  ),
						  SizedBox(height: 4.0),
						  Row(
							  children: <Widget>[
								  Container(
									  width: 150,
									  child: Text(
										  subTitle,
										  overflow: TextOverflow.ellipsis,
										  style: TextStyle(color: Colors.grey.shade700, fontFamily: 'Montserrat', fontSize: 11.0)
									  ),
								  ),
								  timeTitle.isNotEmpty ? SizedBox(width: 4.0) : SizedBox(width: 0.0),
								  timeTitle.isNotEmpty ? Icon(Icons.timer, size: 12.0, color: Colors.black) : SizedBox(width: 0.0),
								  SizedBox(width: 4.0),
								  Text(timeTitle, style:TextStyle(color: Colors.grey.shade500, fontFamily: 'Montserrat', fontSize: 11.0))
							  ],
						  )
					  ],
				  ),
				  Spacer(),
				  Row(
					  crossAxisAlignment: CrossAxisAlignment.start,
					  children: <Widget>[
						  this.inkWellButton(inkWidth: 20.0, inkHeight: 20.0, picUrl: 'assets/navarrow.png', onCallBack: (){}),
						  SizedBox(width: 12.0),
						  this.inkWellButton(inkWidth: 20.0, inkHeight: 20.0, picUrl: 'assets/chatbubble.png', onCallBack: (){}),
						  SizedBox(width: 12.0),
						  this.inkWellButton(inkWidth: 20.0, inkHeight: 20.0, picUrl: 'assets/fav.png', onCallBack: (){}),
					  ],
				  )
			  ],
		  ),
	  );
   }

	/// 封装小型图标函数
	Widget inkWellButton({double inkWidth, double inkHeight, String picUrl, Function onCallBack}) {
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
