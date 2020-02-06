import 'package:catcher/catcher_plugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_travel/core/CoreApp.dart';
import 'package:flutter_travel/core/api/ApiEnviroment.dart';
import 'package:flutter_travel/services/ServiceEnviroment.dart';
import 'package:flutter_travel/services/ServiceNotification.dart';

List<String> sendReportEmail = ServiceEnviroment.instance.getEnv().getSendReportEmail();
CatcherOptions debugOptions = CatcherOptions(DialogReportMode(), [ConsoleHandler()]);
CatcherOptions releaseOptions = CatcherOptions(DialogReportMode(), [EmailManualHandler(sendReportEmail)]);

/// 异常管理器, 使用CATCHER包裹启动类捕获异常
class ManagerCatcher {

	static Future<void> run({ENVIROMENT env}) async {
		
		// core initialized
		WidgetsFlutterBinding.ensureInitialized();

		// notification initialized
		await ServiceNotification.ensureNotification();

		// app start whith catcher
		Catcher(CoreApp(env: env), debugConfig: debugOptions, releaseConfig: releaseOptions);
	}
}