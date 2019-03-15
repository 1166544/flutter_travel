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
			IconButton(icon: Icon(Icons.more_vert), onPressed: () {})
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

  /// 用户头像
  Widget buildHero() {
	  return Hero(
		  tag: 'assets/chris.jpg',
		  child: Container(
			  height: 125.0,
			  width: 125.0,
			  decoration: BoxDecoration(
				  borderRadius: BorderRadius.circular(62.5),
				  image: DecorationImage(
					  fit:BoxFit.cover,
					  image: AssetImage('assets/chris.jpg')
				  )
			  ),
		  ),
	  );
  }

  Widget buildStewart() {
	return Text(
		'Mark Stewart',
		style: TextStyle(
			fontFamily: 'Monsterrat',
			fontSize: 20.0,
			fontWeight: FontWeight.bold
		)
	);
  }

  Widget buildSanJose() {
	  return Text('San Jose, CA', style:TextStyle(fontFamily: 'Montserrat', color: Colors.grey));
  }

  Widget buildFlowers() {
	  return Padding(
		  padding: EdgeInsets.all(30.0),
		  child: Row(
			  mainAxisAlignment: MainAxisAlignment.spaceBetween,
			  children: <Widget>[
				  this.buildFollowersItem(titleValue: '24K', detailValue:'FOLLOWERS'),
				  this.buildFollowersItem(titleValue: '31', detailValue:'TRIPS'),
				  this.buildFollowersItem(titleValue: '21', detailValue:'BUCKET LIST'),
			  ],
		  ),
	  );
  }

  Widget buildFollowersItem({String titleValue, String detailValue}) {
	  return Column(
			mainAxisAlignment: MainAxisAlignment.center,
			children: <Widget>[
				Text(titleValue, style:TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold)),
				SizedBox(height: 5.0),
				Text(detailValue, style:TextStyle(fontFamily: 'Montserrat', color: Colors.grey)),
			],
		);
  }

  Widget buildTableChart() {
	  return Padding(
		  padding: EdgeInsets.only(left: 15.0),
		  child: Row(
			  crossAxisAlignment: CrossAxisAlignment.center,
			  children: <Widget>[
				  IconButton(icon: Icon(Icons.table_chart), onPressed: (){}),
				  IconButton(icon: Icon(Icons.menu), onPressed: (){}),
			  ],
		  ),
	  );
  }

  Widget buildInfoDetail() {
	  return Padding(
		  padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 10.0, bottom: 15.0),
		  child: Row(
			  mainAxisAlignment: MainAxisAlignment.spaceBetween,
			  children: <Widget>[
				  Column(
					  crossAxisAlignment: CrossAxisAlignment.start,
					  children: <Widget>[
						  Text('Maldives - 12 Days', style:TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Montserrat', fontSize: 15.0)),
						  SizedBox(height: 7.0),
						  Row(
							  children: <Widget>[
									Text('Teresa Soto', style:TextStyle(color: Colors.grey.shade700, fontFamily: 'Montserrat', fontSize: 11.0)),
									SizedBox(width: 4.0),
									Icon(Icons.timer, size: 4.0, color: Colors.black),
									SizedBox(width: 4.0),
									Text('3 Videos', style:TextStyle(color: Colors.grey.shade500, fontFamily: 'Montserrat', fontSize: 11.0)),
							  ],
						  )
					  ],
				  ),
				  Row(
					  crossAxisAlignment: CrossAxisAlignment.center,
					  children: <Widget>[
						  SizedBox(width: 7.0),
						  InkWell(
							  onTap: () {},
							  child: Container(
								  height: 20.0,
								  width: 20.0,
								  child: Image.asset('assets/navarrow.png'),
							  ),
						  ),
						  SizedBox(width: 7.0),
						  InkWell(
							  onTap: () {},
							  child: Container(
								  height: 20.0,
								  width: 20.0,
								  child: Image.asset('assets/chatbubble.png'),
							  ),
						  ),
						  SizedBox(width: 7.0),
						  InkWell(
							  onTap: () {},
							  child: Container(
								  height: 20.0,
								  width: 20.0,
								  child: Image.asset('assets/fav.png'),
							  ),
						  ),
					  ],
				  )
			  ],
		  ),
	  );
  }

  Widget buildImages() {
	  return Padding(
		  padding: EdgeInsets.only(left: 15.0, top: 15.0, right: 15.0),
		  child: Container(
			  height: 200.0,
			  decoration: BoxDecoration(
				  borderRadius: BorderRadius.circular(15.0),
				  image: DecorationImage(image: AssetImage('assets/beach1.jpg'), fit: BoxFit.cover)
			  ),
		  ),
	  );
  }

  Widget buildSizeBox(double widthValue) {
    return SizedBox(height: widthValue);
  }
}
