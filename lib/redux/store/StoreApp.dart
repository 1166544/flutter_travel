import 'package:flutter_travel/core/middleware/MiddlewarePersistor.dart';
import 'package:flutter_travel/redux/reducers/ReducerApp.dart';
import 'package:flutter_travel/redux/states/StateApp.dart';
import 'package:redux/redux.dart';

Store<AppState> createStore() { 
    Store<AppState> store = Store(
        appReducer,
        initialState: AppState(),
        middleware: createMiddleware(),
    );
    persistor.load(store);

    return store;
}