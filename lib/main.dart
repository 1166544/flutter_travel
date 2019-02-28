import 'package:flutter/material.dart';

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
