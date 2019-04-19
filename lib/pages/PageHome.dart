import 'package:flutter/material.dart';
import 'package:flutter_travel/common/CommonGalleryItem.dart';
import 'package:flutter_travel/pages/PageAllView.dart';
import 'package:flutter_travel/pages/PageOrderView.dart';
import '../common/CommonTravelItem.dart';
import './PageProfile.dart';

class PageHome extends StatefulWidget {
  final Widget child;

  PageHome({Key key, this.child}) : super(key: key);

  _PageHomeState createState() => _PageHomeState();
}

/// 首页面内容
class _PageHomeState extends State<PageHome> with CommonTravelItem {

  @override
  bool get wantKeepAlive => null;

  @override
  Widget build(BuildContext context) {
	  List<CommonGalleryItem> list1 = [
		  CommonGalleryItem(id: 0.toString(), image: 'assets/beach1.jpg', description: 'A drink in beach'),
		  CommonGalleryItem(id: 1.toString(), image: 'assets/beach2.jpg', description: 'A shoes in under the sun'),
		  CommonGalleryItem(id: 2.toString(), image: 'assets/beach3.jpg', description: 'Cross the bridge.'),
	  ];

	  List<CommonGalleryItem> list2 = [
		  CommonGalleryItem(id: 0.toString(), image: 'assets/beach5.jpg', description: 'The Sunset'),
		  CommonGalleryItem(id: 1.toString(), image: 'assets/beach4.jpg', description: 'Sunset house view'),
		  CommonGalleryItem(id: 2.toString(), image: 'assets/beach6.jpg', description: 'Beach unberlas.'),
	  ];
	return ListView(
		children: <Widget>[
			this._buildTravelogram(),
			this._buildCircle(),
			this._buildCommunity(),
			this.buildImageGrid(context, list1),
			this.buildImgGalleryDetail(context, 'Maui Summer 2019', 'Teresa Soto added 52 Photos', '2h ago'),
			this.buildImageGrid(context, list2),
			this.buildImgGalleryDetail(context, 'Maldives- 12 Days', 'Teresa Soto . 3 Videos', '5h ago'),
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
				  Text('Travelogram', style: TextStyle(fontFamily: 'Montserrat', fontSize: 22.0, color: Colors.grey.shade700, fontWeight: FontWeight.bold)),
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
                MaterialPageRoute(builder: (context) => new PageProfile())
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
					Container(
						width: 45.0,
						height: 45.0,
						decoration: BoxDecoration(
							image: DecorationImage(
								image: AssetImage('assets/arrow.png'),
								fit: BoxFit.cover,
							),
							borderRadius: BorderRadius.circular(50.0),
						),
					),
					SizedBox(width: 5.0),
					Padding(
						padding: EdgeInsets.only(top: 27.0),
						child: Column(
							crossAxisAlignment: CrossAxisAlignment.start,
							children: <Widget>[
								Text('MALDIVES TRIP 2019', style:TextStyle(color: Colors.grey.shade500, fontSize: 13.0)),
								SizedBox(height: 1.0),
								Text(
									'Add an update',
									style: TextStyle(
										fontFamily: 'Montserrat',
										fontWeight: FontWeight.bold,
										fontSize: 16.0
									)
								),
							],
						),
					),
					Spacer(),
					InkWell(
						child: Icon(Icons.arrow_forward_ios, color: Colors.grey),
						onTap: (){
							Navigator.push(
								context,
								MaterialPageRoute(builder: (context) => PageOrderView())
							);
						},
					)
				  ],
			  ),
		  ),
	  );
  }

	/// 社区标题
	Widget _buildCommunity() {
		return Padding(
			padding: EdgeInsets.only(top: 25.0, left: 25.0, right: 15.0),
			child: Row(
				mainAxisAlignment: MainAxisAlignment.start,
				crossAxisAlignment: CrossAxisAlignment.start,
				children: <Widget>[
					Text('From the community', style:TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15.0, fontFamily: 'Montserrat')),
					Spacer(),
					InkWell(
						child: Text('View All', style:TextStyle(color: Colors.blue, fontWeight:FontWeight.bold, fontSize: 15.0, fontFamily: 'Montserrat')),
						onTap: (){
							Navigator.push(
								context,
								MaterialPageRoute(builder: (context) => PageAllView())
							);
						},
					)
				],
			),
		);
	}
}
