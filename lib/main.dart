import 'package:flutter/material.dart';
import 'package:flutter_travel/pages/login/PageLogin.dart';

void main() => runApp(TravelApp());

class TravelApp extends StatelessWidget {
  // 程序根目录
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
	  theme: ThemeData(primaryColor: Colors.black),
      home: PageLogin()
    );
  }
}
