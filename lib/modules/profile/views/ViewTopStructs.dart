import 'package:flutter/material.dart';
import 'package:flutter_travel/modules/profile/models/ModelProfile.dart';

/// 顶部头像结构
class ViewTopStructs extends StatefulWidget {
  ViewTopStructs({Key key, AsyncSnapshot<ModelProfile> snapshot}) : super(key: key);

  _ViewTopStructsState createState() => _ViewTopStructsState();
}

class _ViewTopStructsState extends State<ViewTopStructs> {
  @override
  Widget build(BuildContext context) {
	return Container(
		decoration: BoxDecoration(
			color: Color(0xFF45489e),
			borderRadius: BorderRadius.only(
				topLeft: Radius.circular(0.0), 
				topRight: Radius.circular(0.0), 
				bottomLeft: Radius.circular(20.0), 
				bottomRight: Radius.circular(20.0),
			)
		),
		padding: EdgeInsets.fromLTRB(35.0, 65.0, 25.0, 20.0),
		child: Column(
			mainAxisAlignment: MainAxisAlignment.start,
			crossAxisAlignment: CrossAxisAlignment.start,
			children: <Widget>[
				Hero(
					tag: 'assets/chris.jpg',
					child: Container(
						height: 85.0,
						width: 85.0,
						decoration: BoxDecoration(
							borderRadius: BorderRadius.circular(62.5),
							image: DecorationImage(
								fit:BoxFit.cover,
								image: AssetImage('assets/images/chatbubble.png')
							),
							boxShadow: [
								BoxShadow(
									color: Color(0xff302f90),
									offset: Offset(10.0, 8.0),
									blurRadius: 10.5,
									spreadRadius: 8.8)
							] 
						),
					),
				),
				SizedBox(height: 15.0),
				Text(
					'Mark Stewart',
					style: TextStyle(
						fontSize: 18.0,
						color: Colors.white,
						fontWeight: FontWeight.bold
					)
				),
				SizedBox(height: 10.0),
				Text(
					'20mg capsule',
					style: TextStyle(
						fontSize: 12.0,
						color: Color(0xFF8b8cda)
					)
				),
			],
		),
	);
  }
}