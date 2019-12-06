import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_travel/core/bloc/BlocProvider.dart';
import 'package:flutter_travel/pages/modules/graphics/blocs/GraphicsBlocMyInfo.dart';
import 'package:flutter_travel/pages/modules/graphics/views/GraphicsBlocContentView.dart';

/// 我的模块
class GraphicsPage extends StatefulWidget {
  final Widget child;

  GraphicsPage({Key key, this.child}) : super(key: key);

  _GraphicsPageState createState() => _GraphicsPageState();
}

class _GraphicsPageState extends State<GraphicsPage> {

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
			  bloc: GraphicsBlocMyInfo(),
			  child: GraphicsBlocContentView(),
		  )
	  );

  }


}
