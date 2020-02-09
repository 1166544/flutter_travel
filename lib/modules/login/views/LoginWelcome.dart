import 'package:flutter/material.dart';

class LoginWelcome extends StatelessWidget {
  const LoginWelcome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
	return Container(
		width: MediaQuery.of(context).size.width,
		padding: EdgeInsets.fromLTRB(40.0, 15.0, 30.0, 18.0),
		decoration: BoxDecoration(
			color: Colors.white
		),
		child: Column(
			crossAxisAlignment: CrossAxisAlignment.start,
			mainAxisAlignment: MainAxisAlignment.start,
			children: <Widget>[
				Container(
					width: 49.0,
					height: 39.0,
					decoration: BoxDecoration(
						image: DecorationImage(
							image: AssetImage('assets/images/cloud.png'),
							fit: BoxFit.cover
						)
					),
				),
				SizedBox(height: 10.0),
				Text(
					'Welcome,',
					style: TextStyle(
						color: Colors.black,
						fontWeight: FontWeight.bold,
						fontSize: 30.0
					),
					),
					SizedBox(height: 7.0),
					Text(
					'Pls sign in with github account to continue',
					style: TextStyle(
						color: Color(0xFF7a8099),
						fontWeight: FontWeight.w100,
						fontSize: 16.0
					),
					)
			],
		),
	);
  }
}