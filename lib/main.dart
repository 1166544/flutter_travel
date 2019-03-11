import 'package:flutter/material.dart';
import './pages/profile.dart';

void main() => runApp(TravelApp());

class TravelApp extends StatelessWidget {
  // 程序根目录
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TravelHomePage()
    );
  }
}

/// 入口类
class TravelHomePage extends StatefulWidget {
  @override
  _TravelHomePageState createState() => _TravelHomePageState();
}

class _TravelHomePageState extends State<TravelHomePage> with SingleTickerProviderStateMixin {

  TabController tabController;
  var tripDetails;

  @override
  void initState() {
    super.initState();
    this.tabController = new TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Material(
          color: Colors.white,
          child: TabBar(
            controller: this.tabController,
            indicatorColor: Colors.white,
            tabs: <Widget>[
              Tab(icon: Icon(Icons.home, color: Colors.black)),
              Tab(icon: Icon(Icons.search, color: Colors.grey)),
              Tab(icon: Icon(Icons.graphic_eq, color: Colors.grey)),
              Tab(icon: Icon(Icons.add_circle_outline, color: Colors.grey))
            ],
          ),
        ),
        backgroundColor: Colors.white,
        body: ListView(
          children: <Widget>[
			this._buildTravelogram(),
			this._buildCircle(),
			this._buildCommunity(),
			this._buildImageGrid(),
			this._buildImgGalleryDetail(),
			this._buildImageGrid(),
			this._buildImgGalleryDetail(),
		  ],
        ),
    );
  }

  Widget _buildTravelogram() {
      return Padding(
		  padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
		  child: Row(
			  crossAxisAlignment: CrossAxisAlignment.center,
			  children: <Widget>[
				  Text('travelogram', style: TextStyle(fontFamily: 'Montserrat', fontSize: 20.0, color: Colors.grey.shade900)),
				  SizedBox(width: 90.0),
          IconButton(icon:Icon(Icons.notifications), color: Colors.grey.shade500, iconSize: 30.0, onPressed: (){}),
          SizedBox(width: 5.0),
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
								  Text('MALDIVES TRIP 2019', style:TextStyle(color: Colors.grey.shade500, fontSize: 14.0)),
								  SizedBox(height: 4.0),
								  Text('Add an update', style: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold, fontSize: 16.0)),
								  SizedBox(width: 50.0),
								  IconButton(icon: Icon(Icons.arrow_forward_ios, color: Colors.grey), iconSize: 30.0, onPressed: (){})
							  ],
						  ),
					  )
				  ],
			  ),
		  ),
	  );
  }

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

  Widget _buildImageGrid() {
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
										  image: DecorationImage(image: AssetImage('assets/beach1.jpg'), fit: BoxFit.cover)
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
												  image: DecorationImage(image: AssetImage('assets/beach2.jpg'), fit: BoxFit.cover)
											  ),
										  )
									  ],
								  ),
								  SizedBox(width: 2.0),
								  Container(
									  height: 111.5,
									  width: MediaQuery.of(context).size.width / 2 - 72.0,
									  decoration: BoxDecoration(
										  borderRadius: BorderRadius.only(bottomRight: Radius.circular(15.0)),
										  image: DecorationImage(image: AssetImage('assets/beach3.jpg'), fit: BoxFit.cover)
									  ),
								  )
							  ],
						  ),
					  )
				  ],
			  ),
		  ),
	  );
  }

  Widget _buildImgGalleryDetail() {
	  return Padding(
		  padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 15.0),
		  child: Row(
			  mainAxisAlignment: MainAxisAlignment.spaceBetween,
			  children: <Widget>[
				  Column(
					  crossAxisAlignment: CrossAxisAlignment.start,
					  children: <Widget>[
						  Text('Maui Summer 2019', style:TextStyle(fontWeight:FontWeight.bold, fontFamily: 'Montserrat', fontSize: 15.0)),
						  SizedBox(height: 7.0),
						  Row(
							  children: <Widget>[
								  Text('Teresa Soto added 52 Photos', style: TextStyle(color: Colors.grey.shade700, fontFamily: 'Montserrat', fontSize: 11.0)),
								  SizedBox(width: 4.0),
								  Icon(Icons.timer, size: 4.0, color: Colors.black),
								  SizedBox(width: 4.0),
								  Text('2h ago', style:TextStyle(color: Colors.grey.shade500, fontFamily: 'Montserrat', fontSize: 11.0))
							  ],
						  )
					  ],
				  ),
				  Row(
					  crossAxisAlignment: CrossAxisAlignment.center,
					  children: <Widget>[
						  SizedBox(width: 7.0),
						  this._inkWellButton(inkWidth: 20.0, inkHeight: 20.0, picUrl: 'assets/navarrow.png', onCallBack: (){}),
						  SizedBox(width: 7.0),
						  this._inkWellButton(inkWidth: 20.0, inkHeight: 20.0, picUrl: 'assets/chatbubble.png', onCallBack: (){}),
						  SizedBox(width: 7.0),
						  this._inkWellButton(inkWidth: 22.0, inkHeight: 22.0, picUrl: 'assets/fav.png', onCallBack: (){}),
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
