import 'package:flutter/material.dart';
import './profile.dart';

class HomePage extends StatefulWidget {
  final Widget child;

  HomePage({Key key, this.child}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

/// 首页面内容
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
	return ListView(
		children: <Widget>[
			this._buildTravelogram(),
			this._buildCircle(),
			this._buildCommunity(),
			this._buildImageGrid('assets/beach1.jpg', 'assets/beach2.jpg', 'assets/beach3.jpg'),
			this._buildImgGalleryDetail('Maui Summer 2019', 'Teresa Soto added 52 Photos', '2h ago'),
			this._buildImageGrid('assets/beach5.jpg', 'assets/beach4.jpg', 'assets/beach6.jpg'),
			this._buildImgGalleryDetail('Maldives- 12 Days', 'Teresa Soto . 3 Videos', '5h ago'),
		]
	);
  }


  	/// 旅行标题
  	Widget _buildTravelogram() {
      return Padding(
		  padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
		  // 横向布局
		  child: Row(
			  crossAxisAlignment: CrossAxisAlignment.center,
			  children: <Widget>[
				  Text('travelogram', style: TextStyle(fontFamily: 'Montserrat', fontSize: 22.0, color: Colors.grey.shade700, fontWeight: FontWeight.bold)),
				  Spacer(),
          IconButton(icon:Icon(Icons.notifications), color: Colors.grey.shade500, iconSize: 30.0, onPressed: (){}),
          SizedBox(width: 5.0),
					// 自定义按钮
          InkWell(
            child: Hero(
              tag: 'assets/chris.jpg',
              child: Container(
                height: 50.0,
                width: 50.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  image: DecorationImage(image: AssetImage('assets/chris.jpg'))
                ),
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => new ProfilePage())
              );
            },
          )
			  ],
		  ),
      );
  }

	/// 圆圈标题
  	Widget _buildCircle() {
	  return Padding(
		  padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 15.0),
		  child: Container(
			  padding: EdgeInsets.only(left: 10.0),
			  height: 100.0,
			  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), color: Colors.grey.shade100),
			  child: Row(
				  children: <Widget>[
					IconButton(icon: Icon(Icons.navigation, color: Colors.blue), iconSize: 50.0, onPressed: (){}),
					SizedBox(width: 5.0),
					Padding(
						padding: EdgeInsets.only(top: 27.0),
						child: Column(
							crossAxisAlignment: CrossAxisAlignment.start,
							children: <Widget>[
								Text('MALDIVES TRIP 2019', style:TextStyle(color: Colors.grey.shade500, fontSize: 13.0)),
								SizedBox(height: 4.0),
								Text('Add an update', style: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold, fontSize: 16.0)),
							],
						),
					),
					Spacer(),
					IconButton(icon: Icon(Icons.arrow_forward_ios, color: Colors.grey), iconSize: 20.0, onPressed: (){})
				  ],
			  ),
		  ),
	  );
  }

	/// 社区标题
	Widget _buildCommunity() {
		return Padding(
			padding: EdgeInsets.only(top: 10.0, left: 25.0, right: 25.0),
			child: Row(
				mainAxisAlignment: MainAxisAlignment.spaceBetween,
				children: <Widget>[
					Text('FROM THE COMMUNITY', style:TextStyle(color: Colors.grey, fontSize: 15.0, fontFamily: 'Monsterrat')),
					Text('View All', style:TextStyle(color: Colors.blue, fontWeight:FontWeight.bold, fontSize: 15.0, fontFamily: 'Monsterrat')),
				],
			),
		);
	}

	/// 构建图片网格
	Widget _buildImageGrid(String leftImageUrl, String assistantImage1Url, String assistantImage2Url) {
		return Padding(
			padding: EdgeInsets.only(top: 25.0, left: 15.0, right: 15.0),
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
											SizedBox(width: 2.0),
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
	Widget _buildImgGalleryDetail(String mainTitle, String subTitle, String timeTitle) {
	  return Padding(
		  padding: EdgeInsets.only(left: 25.0, right: 15.0, top: 15.0),
		  child: Row(
			  mainAxisAlignment: MainAxisAlignment.spaceBetween,
			  children: <Widget>[
				  Column(
					  crossAxisAlignment: CrossAxisAlignment.start,
					  children: <Widget>[
						  Text(mainTitle, style:TextStyle(fontWeight:FontWeight.bold, fontFamily: 'Montserrat', fontSize: 15.0)),
						  SizedBox(height: 7.0),
						  Row(
							  children: <Widget>[
								  Text(subTitle, style: TextStyle(color: Colors.grey.shade700, fontFamily: 'Montserrat', fontSize: 11.0)),
								  SizedBox(width: 4.0),
								  Icon(Icons.timer, size: 4.0, color: Colors.black),
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
						  this._inkWellButton(inkWidth: 13.0, inkHeight: 13.0, picUrl: 'assets/navarrow.png', onCallBack: (){}),
						  SizedBox(width: 5.0),
						  this._inkWellButton(inkWidth: 13.0, inkHeight: 13.0, picUrl: 'assets/chatbubble.png', onCallBack: (){}),
						  SizedBox(width: 5.0),
						  this._inkWellButton(inkWidth: 13.0, inkHeight: 13.0, picUrl: 'assets/fav.png', onCallBack: (){}),
					  ],
				  )
			  ],
		  ),
	  );
  }

	/// 封装小型图标函数
	Widget _inkWellButton({double inkWidth, double inkHeight, String picUrl, Function onCallBack}) {
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
