import 'package:flutter/material.dart';
import 'package:flutter_travel/config/ConfigDefault.dart';
import 'package:flutter_travel/pages/modules/login/LoginPage.dart';
import 'package:flutter_travel/redux/states/StateGlobal.dart';
import 'package:flutter_travel/redux/reducers/ReducerGlobal.dart';
import 'package:flutter_travel/services/ServiceEnviroment.dart';
import 'package:redux/redux.dart';

/// APP启动入口
class CoreApp extends StatelessWidget {

	final ENVIROMENT env;

	CoreApp({this.env}) {
		ServiceEnviroment.init(this.env);
	}

	// 程序根目录
	@override
	Widget build(BuildContext context) {
		final Store<StateGlobal> store = Store<StateGlobal>(reducer, initialState: StateGlobal.initState());
		return MaterialApp(
			debugShowCheckedModeBanner: false,
			theme: ThemeData(primaryColor: Colors.black),
			home: LoginPage(store: store)
		);
	}
}