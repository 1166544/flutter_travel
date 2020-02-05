import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_travel/core/env/EnviromentDev.dart';
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
}

class _CoreAppState extends State<CoreApp> {
	
	final MethodChannel platform =
      MethodChannel('crossingthestreams.io/resourceResolver');

	@override
	void initState() {
		super.initState();
		didReceiveLocalNotificationSubject.stream
			.listen((ReceivedNotification receivedNotification) async {
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
					Navigator.of(context, rootNavigator: true).pop();
					await Navigator.of(context).pushNamedAndRemoveUntil(Routers.profilePage, (_) => false);
				},
				)
			],
			),
		);
		});
		selectNotificationSubject.stream.listen((String payload) async {
		await Navigator.of(context).pushNamedAndRemoveUntil(Routers.profilePage, (_) => false);
		});
	}

	@override
	void dispose() {
		didReceiveLocalNotificationSubject.close();
		selectNotificationSubject.close();
		super.dispose();
	}

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
