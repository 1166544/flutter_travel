import 'package:flutter/material.dart';
import 'package:flutter_travel/config/ConfigDefault.dart';
import 'core/CoreApp.dart';

/// 生产环境
void main() => runApp(
	TravelApp(env: ENVIROMENT.PROD)
);

