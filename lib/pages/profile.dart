import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  final Widget child;

  ProfilePage({Key key, this.child}) : super(key: key);

  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
	return Scaffold(
		appBar: AppBar(
			backgroundColor: Colors.transparent,
			elevation: 0.0,
			leading: IconButton(
				icon: Icon(Icons.arrow_back),
				color: Colors.black,
				onPressed: () {
					Navigator.of(context).pop();
				},
			),
			actions: <Widget>[
				IconButton(icon: Icon(Icons.more_vert), onPressed: (){})
			],
		),
		body: ListView(
			children: <Widget>[
				Column(
					mainAxisAlignment: MainAxisAlignment.center,
					children: <Widget>[
						this.buildHero(),
						this.buildSizeBox(25.0),
						this.buildStewart(),
						this.buildSizeBox(4.0),
						this.buildSanJose(),
						this.buildFlowers(),
						this.buildTableChart(),
						this.buildImages(),
						this.buildInfoDetail(),
						this.buildImages(),
						this.buildInfoDetail()
					],
				)
			],
		),
	);
  }

  Widget buildHero() {

  }

  Widget buildStewart() {

  }

  Widget buildSanJose() {

  }

  Widget buildFlowers() {

  }

  Widget buildTableChart() {

  }

  Widget buildInfoDetail() {

  }

  Widget buildImages() {

  }

  Widget buildSizeBox(double widthValue) {
	  return SizedBox(height: widthValue);
  }
}
