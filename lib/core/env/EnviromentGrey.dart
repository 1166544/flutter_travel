import 'package:flutter/material.dart';
import 'package:flutter_travel/core/api/ApiEnviroment.dart';
import 'package:flutter_travel/core/manager/ManagerCatcher.dart';
import 'package:flutter_travel/services/ServiceNotification.dart';

/// 灰度环境
Future<void> main() async{
	WidgetsFlutterBinding.ensureInitialized();
	await ServiceNotification.ensureNotification();
	
	ManagerCatcher.run(env: ENVIROMENT.GREY);
}

