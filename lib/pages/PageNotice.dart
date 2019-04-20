import 'package:flutter/material.dart';
import 'package:flutter_travel/common/CommonNavigator.dart';

/// 通知页
class PageNotice extends StatefulWidget {
  final Widget child;

  PageNotice({Key key, this.child}) : super(key: key);

  @override
  _PageNoticeState createState() => _PageNoticeState();
}

class _PageNoticeState extends State<PageNotice> with CommonNavigator {
  @override
  Widget build(BuildContext context) {
	return Scaffold(
		appBar: AppBar(
			backgroundColor: Colors.transparent,
			elevation: 0.0,
			leading: IconButton(
				icon: Icon(Icons.arrow_back_ios),
				color: Colors.black,
				onPressed: () {
					this.navigateBack(context);
				},
			),
			title: Text('Notifications', style: TextStyle(color: Colors.black)),
			centerTitle: true,
		),
		body: ListView(
			children: <Widget>[
				this.buildCoverImage(),
				this.buildAboutTitle(),
				this.buildNotifcationList()
			],
		),
	);
  }

  /// 封面图片
  Widget buildCoverImage() {
	  return Container(
		  width: MediaQuery.of(this.context).size.width,
		  height: 180,
		  decoration: BoxDecoration(
			  image: DecorationImage(
				  image: AssetImage('assets/road.jpg'),
				  fit: BoxFit.cover
			  )
		  ),
		  child: Padding(
			  padding: EdgeInsets.fromLTRB(30.0, 50.0, 30.0, 20.0),
			  child: Column(
				  crossAxisAlignment: CrossAxisAlignment.start,
				  mainAxisAlignment: MainAxisAlignment.end,
				  children: <Widget>[
					  Text(
						'Back to the nature',
						style: TextStyle(
							color: Colors.white,
							fontWeight: FontWeight.bold,
							fontSize: 30.0,
							shadows: [
								Shadow(
									offset: Offset(3.0, 3.0),
									blurRadius: 3.0,
									color: Colors.black.withOpacity(0.8)
								),
							]
						),
					 ),
					  Text(
						'Coming up under the start.',
						style: TextStyle(
							color: Colors.white,
							fontWeight: FontWeight.bold,
							fontSize: 15.0,
							shadows: [
								Shadow(
									offset: Offset(3.0, 3.0),
									blurRadius: 3.0,
									color: Colors.black.withOpacity(0.8)
								),
							]
						),
					 ),
				  ],
			  ),
		  ),
	  );
  }

  /// 副标题
  Widget buildAboutTitle() {
	  return Container(
		  width: MediaQuery.of(this.context).size.width,
		  height: 60.0,
		  decoration: BoxDecoration(
			  color: Colors.white,
			  shape: BoxShape.rectangle,
			  border: Border(bottom: BorderSide(width: 0.5, color: Colors.grey))
		  ),
		  padding: EdgeInsets.fromLTRB(30.0, 0.0, 0.0, 0.0),
		  child: Column(
			  crossAxisAlignment: CrossAxisAlignment.start,
			  mainAxisAlignment: MainAxisAlignment.end,
			  children: <Widget>[
				  Padding(
					  padding: EdgeInsets.only(bottom: 10.0),
					  child: Text('Latest news', style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold)),
				  ),
				  Container(
					  width: 100.0,
					  height: 2.0,
					  decoration: BoxDecoration(
						  color: Colors.black,
						  shape: BoxShape.rectangle
					  ),
				  )
			  ],
		  ),
	  );
  }

  Widget buildNotifcationList() {
	  return Text('Notifcation');
  }

}
