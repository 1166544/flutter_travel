import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  final Widget child;

  ProfilePage({Key key, this.child}) : super(key: key);

  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
	return Container(
	   child: widget.child,
	);
  }
}
