import 'package:flutter/material.dart';
import 'package:flutter_travel/core/CoreApp.dart';
import 'package:flutter_travel/core/api/ApiEnviroment.dart';

/// 开发环境
void main() {
	WidgetsFlutterBinding.ensureInitialized();
	runApp(CoreApp(env: ENVIROMENT.DEVELOPEMENT));
}
