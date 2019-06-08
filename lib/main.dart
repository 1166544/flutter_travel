import 'package:flutter/material.dart';
import 'package:flutter_travel/pages/login/PageLogin.dart';
import 'package:flutter_travel/redux/states/StateGlobal.dart';
import 'package:redux/redux.dart';

void main() => runApp(TravelApp());

class TravelApp extends StatelessWidget {
	// 程序根目录
	@override
	Widget build(BuildContext context) {
		final store = Store<StateGlobal>(reducer, initialState: StateGlobal.initState());
		return MaterialApp(
			debugShowCheckedModeBanner: false,
			theme: ThemeData(primaryColor: Colors.black),
			home: PageLogin(store: store)
		);
	}
}
