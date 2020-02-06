import 'package:flutter_travel/core/api/ApiEnviroment.dart';
import 'package:flutter_travel/core/manager/ManagerCatcher.dart';

/// 测试环境
Future<void> main() async{
	await ManagerCatcher.run(env: ENVIROMENT.TEST);
}