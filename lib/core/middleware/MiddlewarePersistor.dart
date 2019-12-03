import 'package:flutter_travel/models/ModelAppState.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:redux_persist/redux_persist.dart';
import 'package:redux_persist_flutter/redux_persist_flutter.dart';

final persistor = Persistor<AppState>(storage: FlutterStorage('redux-app'), decoder: AppState.rehydrationJSON);

// Set up middlewares
List<Middleware<AppState>> createMiddleware() => <Middleware<AppState>>[
    thunkMiddleware,
    persistor.createMiddleware(),
    LoggingMiddleware.printer(),
];