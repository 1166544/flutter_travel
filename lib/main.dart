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

  }

  Widget _buildCommunity() {

  }

  Widget _buildImageGrid() {

  }

  Widget _buildImgGalleryDetail() {

  }
}
