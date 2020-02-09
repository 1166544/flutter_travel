import 'package:catcher/catcher_plugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_travel/core/CoreApp.dart';
import 'package:flutter_travel/core/api/ApiEnviroment.dart';
import 'package:flutter_travel/core/manager/ManagerEnviroment.dart';
import 'package:flutter_travel/core/manager/ManagerNotification.dart';

String emilTitle = 'Travels异常报告';
String emailHeader = 'Travels异常详情';
List<String> sendReportEmail = ManagerEnviroment.instance.getEnv().getSendReportEmail();
ConsoleHandler consoleHandler = ConsoleHandler(
	enableApplicationParameters: true,
	enableDeviceParameters: true,
	enableCustomParameters: true,
	enableStackTrace: true
);
EmailManualHandler emailManualHandler = EmailManualHandler(
	sendReportEmail,
	enableDeviceParameters: true,
	enableStackTrace: true,
	enableCustomParameters: true,
	enableApplicationParameters: true,
	sendHtml: true,
	emailTitle: emilTitle,
	emailHeader: emailHeader,
	printLogs: true
);

// debug模式,使用自定义UI
ReportMode debugReportMode = ManagerCustomPageReportMode();

// release模式
ReportMode releaseReportMode = SilentReportMode();

// 注册
CatcherOptions debugOptions = CatcherOptions(debugReportMode, [consoleHandler]);
CatcherOptions releaseOptions = CatcherOptions(releaseReportMode, [emailManualHandler]);

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

/// DEBUG模式下自定义异常显示页面 
class ManagerCustomPageReportMode extends ReportMode {
	@override
	void requestAction(Report report, BuildContext context) {
		_navigateToPageWidget(report, context);
	}

	_navigateToPageWidget(Report report, BuildContext context) async {
		await Future.delayed(Duration.zero);
		Navigator.push(
			context,
			MaterialPageRoute(builder: (context) => _ManagerCustomPage(this, report)),
		);
	}

	@override
	bool isContextRequired() {
		return true;
	}
}

class _ManagerCustomPage extends StatelessWidget {
	final ReportMode reportMode;
	final Report report;

	_ManagerCustomPage(this.reportMode, this.report);

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text(emilTitle),
			),
			body: Container(
				child: Row(children: [
				RaisedButton(
					child: Text('发送报告'),
					onPressed: () {
					reportMode.onActionConfirmed(report);
					},
				),
				RaisedButton(
					child: Text('取消发送'),
					onPressed: () {
					reportMode.onActionRejected(report);
					Navigator.pop(context);
					},
				)
				]),
		));
	}
}