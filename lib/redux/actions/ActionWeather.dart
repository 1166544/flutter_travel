
import 'package:flutter/material.dart';
import 'package:flutter_travel/modules/weather/models/ModelDisplayWeatherInfo.dart';
import 'package:flutter_travel/redux/states/StateApp.dart';
import 'package:redux/redux.dart';

/// 天气数据更新
class ActionWeatherUpdate {
	final ModelDisplayWeatherInfo weatherData;

	ActionWeatherUpdate(this.weatherData);
}

/// 封装更新事件
final Function updateWeather = (BuildContext context, ModelDisplayWeatherInfo weatherData) {
	return (Store<AppState> store) {
		store.dispatch(ActionWeatherUpdate(weatherData));
	};
};