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
				child: Text('Maldives - 12 Days', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
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
		body: Center(
			child: Text('Text'),
		)
	);
  }
}
