import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_travel/modules/home/views/pages/PageDisplay.dart';
import 'package:rxdart/subjects.dart';

/// 消通通知
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =  FlutterLocalNotificationsPlugin();
final BehaviorSubject<ManagerNotification> didReceiveLocalNotificationSubject = BehaviorSubject<ManagerNotification>();
final BehaviorSubject<String> selectNotificationSubject = BehaviorSubject<String>();

/// 消息通知消息体
class ManagerNotification {
	final int id;
	final String title;
	final String body;
	final String payload;

  	ManagerNotification(
      {
		@required this.id,
		@required this.title,
		@required this.body,
		@required this.payload
	  }
	);
}

/// 消息通知服务
class ServiceNotification {

	factory ServiceNotification() => _getInstance();
	static ServiceNotification get instance => _getInstance();
	static ServiceNotification _instance;
	static ServiceNotification _getInstance() {
		if (_instance == null) {
			_instance = new ServiceNotification._internal();
		}

		return _instance;
	}

	ServiceNotification._internal(): super() {
		// 初始化
		// hole
	}

	/// 注册消息通知
	static ensureNotification() async {
		var initializationSettingsAndroid = AndroidInitializationSettings('app_icon');
		var initializationSettingsIOS = IOSInitializationSettings(
			onDidReceiveLocalNotification:
				(int id, String title, String body, String payload) async {
					didReceiveLocalNotificationSubject.add(
						ManagerNotification(id: id, title: title, body: body, payload: payload)
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

	/// 基本弹出通知服务
	Future<void> showNotification({int id = 0, String title, String body}) async {
		var androidPlatformChannelSpecifics = AndroidNotificationDetails(
			id.toString(), 
			title, 
			body,
			importance: Importance.Max, 
			priority: Priority.High, 
			ticker: 'ticker'
		);
		var iOSPlatformChannelSpecifics = IOSNotificationDetails();
		var platformChannelSpecifics = NotificationDetails(
			androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);

		await flutterLocalNotificationsPlugin.show(
			id, 
			title, 
			body, 
			platformChannelSpecifics,
			payload: 
			'item x'
		);
  	}
}

/// 消息通知init
class ServiceNotificationWidget extends PageDisplayState {
	final MethodChannel platform = MethodChannel('crossingthestreams.io/resourceResolver');

	@override
	void initState() {
		super.initState();
		didReceiveLocalNotificationSubject.stream.listen((ManagerNotification receivedNotification) async {
			await showDialog(
				context: context,
				builder: (BuildContext context) => CupertinoAlertDialog(
				title: receivedNotification.title != null
					? Text(receivedNotification.title)
					: null,
				content: receivedNotification.body != null
					? Text(receivedNotification.body)
					: null,
				actions: [
					CupertinoDialogAction(
					isDefaultAction: true,
					child: Text('Ok'),
					onPressed: () async {
						// Navigator.of(context, rootNavigator: true).pop();
						// await Navigator.of(context).pushNamedAndRemoveUntil(Routers.profilePage, (_) => false);
					},
					)
				],
				),
			);
		});
		selectNotificationSubject.stream.listen((String payload) async {
			// await Navigator.of(context).pushNamedAndRemoveUntil(Routers.profilePage, (_) => false);
		});
	}

	@override
	void dispose() {
		didReceiveLocalNotificationSubject.close();
		selectNotificationSubject.close();
		super.dispose();
	}
}