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
          this._buildTravelogram(),
          this._buildCircle(),
          this._buildCommunity(),
          this._buildImageGrid(),
          this._buildImgGalleryDetail(),
          this._buildImageGrid(),
          this._buildImgGalleryDetail(),
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

  }

  Widget _buildImageGrid() {

  }

  Widget _buildImgGalleryDetail() {

  }
}
