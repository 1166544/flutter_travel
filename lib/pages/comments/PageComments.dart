import 'package:flutter/material.dart';
import 'package:flutter_travel/common/CommonNavigator.dart';

/// 留言区
class PageComments extends StatefulWidget {
  @override
  _PageCommentsState createState() => _PageCommentsState();
}

class _PageCommentsState extends State<PageComments> with CommonNavigator {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: this.getAppBar(context, 'Messages'),
        body: ListView(
          children: <Widget>[
            // 蓝色图片区
            this.buildBlueImageArea(),
            // 留言列表
            this.buildCommentListArear()
          ],
        ));
  }

  /// 蓝色图片区
  Widget buildBlueImageArea() {
    return Container(
      width: MediaQuery.of(this.context).size.width,
      height: 180.0,
      decoration:
          BoxDecoration(color: Color(0xFF108aee), shape: BoxShape.rectangle),
      child: Padding(
        padding: EdgeInsets.fromLTRB(25.0, 25.0, 25.0, 0.0),
        child: Column(
		  crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
			  Text('CUSTOMER', style: TextStyle(color: Color(0xFFa2d1f8), fontSize: 10.0)),
			  SizedBox(height: 5.0),
			  Text('Eric Hoffman', style: TextStyle(color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.bold)),
			  SizedBox(height: 10.0),
			  Row(
				  children: <Widget>[
					  CircleAvatar(
						  backgroundImage: AssetImage('assets/chris.jpg'),
						  radius: 18.0,
					  ),
					  SizedBox(width: 10.0),
			  		  Text('Sure thing!', style: TextStyle(color: Color(0xFFc5e2fa), fontSize: 13.0)),
					  Icon(Icons.favorite_border, color: Color(0xFFa2d1f8), size: 15.0,)
				  ],
			  ),
			  SizedBox(height: 27.0),
			  Row(
				  children: <Widget>[
					  Text('Henry, Bryce, Eric, Berin, +3', style: TextStyle(color: Color(0xFF90c8f7), fontSize: 12.0)),
				  	  Spacer(),
					  Text('7:32 am', style: TextStyle(color: Color(0xFF90c8f7), fontSize: 12.0)),
				  ],
			  ),
			],
        ),
      ),
    );
  }

  /// 留言列表`
  Widget buildCommentListArear() {
    return Column(
		children: <Widget>[
			Text('Test'),
		],
	);
  }
}
