import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_travel/core/middleware/MiddlewarePersistor.dart';
import 'package:flutter_travel/core/presentation/PresentationPlatformAdaptive.dart';
import 'package:flutter_travel/models/ModelAppState.dart';
import 'package:flutter_travel/pages/modules/home/HomeMainScreen.dart';
import 'package:flutter_travel/pages/modules/loading/LoadingScreen.dart';
import 'package:flutter_travel/pages/modules/login/LoginScreen.dart';
import 'package:flutter_travel/redux/store/StoreApp.dart';
import 'package:flutter_travel/services/ServiceEnviroment.dart';

import 'package:flutter_travel/core/api/ApiEnviroment.dart';
import 'package:redux_persist_flutter/redux_persist_flutter.dart';

/// APP启动入口
class CoreApp extends StatelessWidget {

	// store
	final store = createStore();

  	// 环境标识
	final ENVIROMENT env;

	CoreApp({this.env}) {
		ServiceEnviroment.init(this.env);
	}

	// 程序根入口
	@override
	Widget build(BuildContext context) {

		return PersistorGate(
			persistor: persistor,
			loading: LoadingScreen(),
			builder: (context) => StoreProvider<AppState>(
				store: store,
				child: MaterialApp(
					debugShowCheckedModeBanner: false,
					theme: defaultTargetPlatform == TargetPlatform.iOS
                        ? kIOSTheme
                        : kDefaultTheme,
					routes: <String, WidgetBuilder>{
						'/': (BuildContext context) => StoreConnector<AppState, dynamic>( 
							converter: (store) => store.state.auth.isAuthenticated, 
							builder: (BuildContext context, isAuthenticated) => isAuthenticated ? MainScreen() : LoginScreen()
						),
						'/login': (BuildContext context) => LoginScreen(),
						'/main': (BuildContext context) => MainScreen()
					}
				)
			),
		);
	}
}
