import 'package:flutter_travel/redux/reducers/ReducerAuth.dart';
import 'package:flutter_travel/redux/reducers/ReducerPage.dart';
import 'package:flutter_travel/redux/states/StateApp.dart';
import 'package:redux_persist/redux_persist.dart';

AppState appReducer(AppState state, action){
    // print(action);
    if (action is PersistLoadedAction<AppState>) {
        return action.state ?? state;
    } else {
        return AppState(
            auth: authReducer(state.auth, action),
			page: pageReducer(state.page, action),
        );
    }
} 