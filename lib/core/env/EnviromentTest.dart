import 'package:flutter/material.dart';
import 'package:flutter_travel/core/CoreApp.dart';
import 'package:flutter_travel/core/api/ApiEnviroment.dart';
import 'package:flutter_travel/services/ServiceNotification.dart';

/// 测试环境
Future<void> main() async{
	WidgetsFlutterBinding.ensureInitialized();
	await ServiceNotification.ensureNotification();
	
	runApp(CoreApp(env: ENVIROMENT.TEST));
}