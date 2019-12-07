import 'package:flutter/material.dart';

class LoginLogo extends StatelessWidget {
  const LoginLogo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
	return Container(
		width: MediaQuery.of(context).size.width,
		padding: EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 30.0),
		child: Center(
			child: Container(
				width: 132,
				height: 167,
				decoration: BoxDecoration(
					image: DecorationImage(
						image: AssetImage('assets/tran_logo.png'),
						fit: BoxFit.cover
					)
				),
			),
		),
	);
  }
}