import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_travel/core/CoreApp.dart';
import 'package:flutter_travel/core/api/ApiEnviroment.dart';
import 'package:rxdart/subjects.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
final BehaviorSubject<ReceivedNotification> didReceiveLocalNotificationSubject =
    BehaviorSubject<ReceivedNotification>();

final BehaviorSubject<String> selectNotificationSubject =
    BehaviorSubject<String>();

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

/// 开发环境
Future<void> main() async{
	WidgetsFlutterBinding.ensureInitialized();
	var initializationSettingsAndroid = AndroidInitializationSettings('app_icon');
	var initializationSettingsIOS = IOSInitializationSettings(
		onDidReceiveLocalNotification:
			(int id, String title, String body, String payload) async {
		didReceiveLocalNotificationSubject.add(ReceivedNotification(
			id: id, title: title, body: body, payload: payload));
	});
	var initializationSettings = InitializationSettings(
		initializationSettingsAndroid, initializationSettingsIOS);
	await flutterLocalNotificationsPlugin.initialize(initializationSettings,
		onSelectNotification: (String payload) async {
		if (payload != null) {
		debugPrint('notification payload: ' + payload);
		}
		selectNotificationSubject.add(payload);
	});
  
	runApp(CoreApp(env: ENVIROMENT.DEVELOPEMENT));
}
