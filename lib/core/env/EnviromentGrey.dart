import 'package:flutter/material.dart';
import 'package:flutter_travel/core/CoreApp.dart';
import 'package:flutter_travel/core/api/ApiEnviroment.dart';

/// 灰度环境
Future<void> main() async{
	WidgetsFlutterBinding.ensureInitialized();
	await CoreApp.ensureNotification();
	
	runApp(CoreApp(env: ENVIROMENT.GREY));
}

