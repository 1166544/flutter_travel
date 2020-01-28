import 'package:flutter_travel/redux/actions/ActionWeather.dart';
import 'package:flutter_travel/redux/states/StateWeather.dart';
import 'package:redux/redux.dart';

/// 合并Reducer
Reducer<StateWeather> weatherReducer = combineReducers([
	TypedReducer<StateWeather, ActionWeatherUpdate>(weatherUpdateReducer),
]);

/// 页面标题更改Reducer
StateWeather weatherUpdateReducer(StateWeather weather, ActionWeatherUpdate action) {
	return weather.copyWith(
		weatherData: action.weatherData
	);
}