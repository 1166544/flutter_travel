import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_travel/core/bloc/BlocProvider.dart';
import 'package:flutter_travel/pages/modules/profile/blocs/BlocMyInfo.dart';
import 'package:flutter_travel/pages/modules/profile/views/ViewBlocContent.dart';

/// 我的模块
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
			  title: Center(
				  child: Text('Personal Information', style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0
				)),
			  ),
			  elevation: 0.0,
			  backgroundColor: Color(0xffebeff8),
		  ),
		  body: BlocProvider(
			  bloc: BlocMyInfo(),
			  child: ViewBlocContent(),
		  )
	  );

  }


}
