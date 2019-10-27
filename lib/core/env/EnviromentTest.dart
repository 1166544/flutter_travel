import 'package:flutter/material.dart';
import 'package:flutter_travel/core/CoreApp.dart';
import 'package:flutter_travel/core/api/ApiEnviroment.dart';

/// 测试环境
void main() => runApp(
	CoreApp(env: ENVIROMENT.TEST)
);
