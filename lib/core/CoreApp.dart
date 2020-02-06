import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_travel/core/middleware/MiddlewarePersistor.dart';
import 'package:flutter_travel/core/presentation/PresentationPlatformAdaptive.dart';
import 'package:flutter_travel/modules/common/CommonLoading.dart';
import 'package:flutter_travel/redux/states/StateApp.dart';
import 'package:flutter_travel/redux/store/StoreApp.dart';
import 'package:flutter_travel/routers/Routers.dart';
import 'package:flutter_travel/core/manager/ManagerEnviroment.dart';

import 'package:flutter_travel/core/api/ApiEnviroment.dart';
import 'package:flutter_travel/core/manager/ManagerGlobal.dart';
import 'package:redux_persist_flutter/redux_persist_flutter.dart';

/// 主程序
class CoreApp extends StatefulWidget {
	// store
	final store = createStore();

  	// 环境标识
	final ENVIROMENT env;

	CoreApp({Key key, this.env}) : super(key: key) {
		// 初始化相关服务
		ManagerEnviroment.init(this.env);
		ManagerGlobal.init(this.store, Routers(store: this.store));
	}

	_CoreAppState createState() => _CoreAppState();
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
					routes: ManagerGlobal.instance.getRouters().init()
				)
			),
		);
	}
}
