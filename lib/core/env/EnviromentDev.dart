import 'package:flutter_travel/core/api/ApiEnviroment.dart';
import 'package:flutter_travel/core/manager/ManagerCatcher.dart';

/// 开发环境
Future<void> main() async{
	await ManagerCatcher.run(env: ENVIROMENT.DEVELOPEMENT);
}
