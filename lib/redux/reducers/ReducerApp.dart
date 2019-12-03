import 'package:flutter_travel/models/ModelAppState.dart';
import 'package:flutter_travel/redux/reducers/ReducerAuth.dart';
import 'package:redux_persist/redux_persist.dart';

AppState appReducer(AppState state, action){
    //print(action);
    if (action is PersistLoadedAction<AppState>) {
        return action.state ?? state;
    } else {
        return AppState(
            auth: authReducer(state.auth, action),
        );
    }
} 