import 'package:flutter/material.dart';
import 'package:flutter_travel/config/ConfigDefault.dart';
import 'package:flutter_travel/core/CoreApp.dart';

/// 灰度环境
void main() => runApp(
	CoreApp(env: ENVIROMENT.GREY)
);
