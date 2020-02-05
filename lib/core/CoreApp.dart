import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_travel/core/middleware/MiddlewarePersistor.dart';
import 'package:flutter_travel/core/presentation/PresentationPlatformAdaptive.dart';
import 'package:flutter_travel/modules/common/CommonLoading.dart';
import 'package:flutter_travel/redux/states/StateApp.dart';
import 'package:flutter_travel/redux/store/StoreApp.dart';
import 'package:flutter_travel/routers/Routers.dart';
import 'package:flutter_travel/services/ServiceEnviroment.dart';

import 'package:flutter_travel/core/api/ApiEnviroment.dart';
import 'package:flutter_travel/services/ServiceGlobal.dart';
import 'package:redux_persist_flutter/redux_persist_flutter.dart';
import 'package:rxdart/subjects.dart';

/// 消通通知
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =  FlutterLocalNotificationsPlugin();
final BehaviorSubject<ReceivedNotification> didReceiveLocalNotificationSubject = BehaviorSubject<ReceivedNotification>();
final BehaviorSubject<String> selectNotificationSubject = BehaviorSubject<String>();

/// 消息通知消息体
class ReceivedNotification {
  final int id;
  final String title;
  final String body;
  final String payload;

  ReceivedNotification(
      {@required this.id,
      @required this.title,
      @required this.body,
      @required this.payload});
}

/// 注程序
class CoreApp extends StatefulWidget {
	// store
	final store = createStore();

  	// 环境标识
	final ENVIROMENT env;

	CoreApp({Key key, this.env}) : super(key: key) {
		ServiceEnviroment.init(this.env);
		ServiceGlobal.init(this.store, Routers(store: this.store));
	}

	_CoreAppState createState() => _CoreAppState();

	/// 注册消息通知
	static ensureNotification() async {
		var initializationSettingsAndroid = AndroidInitializationSettings('app_icon');
		var initializationSettingsIOS = IOSInitializationSettings(
			onDidReceiveLocalNotification:
				(int id, String title, String body, String payload) async {
					didReceiveLocalNotificationSubject.add(
						ReceivedNotification(id: id, title: title, body: body, payload: payload)
					);
				});

		var initializationSettings = InitializationSettings(initializationSettingsAndroid, initializationSettingsIOS);
		
		await flutterLocalNotificationsPlugin.initialize(initializationSettings,
			onSelectNotification: (String payload) async {
			if (payload != null) {
				debugPrint('notification payload: ' + payload);
			}
			selectNotificationSubject.add(payload);
		});
	}
}

class _CoreAppState extends State<CoreApp> {

	// 程序根入口
	@override
	Widget build(BuildContext context) {

		return PersistorGate(
			persistor: persistor,
			loading: CommonLoading(),
			builder: (context) => StoreProvider<AppState>(
				store: widget.store,
				child: MaterialApp(
					debugShowCheckedModeBanner: false,
					theme: defaultTargetPlatform == TargetPlatform.iOS
                        ? kIOSTheme
                        : kDefaultTheme,
					routes: ServiceGlobal.instance.getRouters().init()
				)
			),
		);
	}
}
