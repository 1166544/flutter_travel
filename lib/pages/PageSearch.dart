import 'package:flutter/material.dart';

/// 搜索页
class PageSearch extends StatefulWidget {
  final Widget child;

  PageSearch({Key key, this.child}) : super(key: key);

  _PageSearchState createState() => _PageSearchState();
}

class _PageSearchState extends State<PageSearch> {
  @override
  Widget build(BuildContext context) {
	return Scaffold(
		appBar: AppBar(
			title: Center(
				child: Text(
					'Maldives - 12 Days',
					style: TextStyle(
						color: Colors.black,
						fontWeight: FontWeight.bold,
						fontSize: 20.0
					)
				),
			),
			elevation: 0.0,
			backgroundColor: Colors.white,
			leading: IconButton(
				tooltip: 'Search Page',
				icon: Icon(Icons.arrow_back),
				color: Colors.grey,
				onPressed: () {
					// hole
				},
			),
			actions: <Widget>[
				IconButton(
					color: Colors.grey,
					icon: Icon(Icons.menu),
					tooltip: 'Settings',
					onPressed: () {
						// hole
					},
				)
			],
		),
		body: this.buildSearchLayout()
	);
  }

  /// 基础页面结构
  Widget buildSearchLayout() {
	  return Column(
		  children: <Widget>[
			  this.buildMarkTitle(),
			  this.buildStartIcon(),
			  this.buildDateTitle(),
			  this.buildTravelItem(),
			  this.buildTravelItem(),
		  ],
	  );
  }

  /// 顶部标题
  Widget buildMarkTitle() {
	  return Container(
		  width: MediaQuery.of(context).size.width,
		  child: Text(
			  'Mark, 4 Others',
			  textAlign: TextAlign.center,
			  style: TextStyle(fontSize: 17.0, color: Colors.black.withOpacity(0.7)),
		  )
	  );
  }

  /// 构建START图标
  Widget buildStartIcon() {
	  return Padding(
		  padding: EdgeInsets.all(7.0),
		  child: Image.asset('assets/start.png', width: 150.0, height: 150.0),
	  );
  }

  Widget buildDateTitle() {
	  return Text('getDateTitle');
  }

  Widget buildTravelItem() {
	  return Text('getTravelItem');
  }
}
