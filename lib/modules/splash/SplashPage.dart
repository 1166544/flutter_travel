import 'package:flutter/material.dart';
import 'package:flutter_travel/core/bloc/BlocProvider.dart';
import 'package:flutter_travel/modules/splash/blocs/BlocSplashList.dart';
import 'package:flutter_travel/modules/splash/views/ViewSplashContent.dart';

/// 闪屏页
class SplashPage extends StatefulWidget {
  SplashPage({Key key}) : super(key: key);

  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
	return Scaffold(
		body: BlocProvider(
			bloc: blocSplashList,
			child: ViewSplashContent(),
		),
	);
  }
}