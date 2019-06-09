import 'package:flutter/material.dart';
import 'package:flutter_travel/config/ConfigDefault.dart';
import 'package:flutter_travel/core/CoreApp.dart';

/// 测试环境
void main() => runApp(
	TravelApp(env: ENVIROMENT.TEST)
);
