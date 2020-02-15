import 'package:flutter/material.dart';
import 'package:flutter_travel/modules/common/CommonText.dart';

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
				CommonText(
					'Welcome,',
					style: TextStyle(
						color: Colors.black,
						fontWeight: FontWeight.bold,
						fontSize: 30.0
					),
					),
					SizedBox(height: 7.0),
					CommonText(
					'Pls sign in with github account to continue',
					style: TextStyle(
						color: Colors.black.withOpacity(0.7),
						fontWeight: FontWeight.w300,
						fontSize: 16.0
					),
					)
			],
		),
	);
  }
}