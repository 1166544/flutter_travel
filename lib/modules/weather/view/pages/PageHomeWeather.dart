import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_travel/core/bloc/BlocProvider.dart';
import 'package:flutter_travel/modules/weather/blocs/BlocWeatherList.dart';
import 'package:flutter_travel/modules/weather/view/components/ComponentWeather.dart';
import 'package:flutter_travel/redux/states/StateApp.dart';

/// 首页天气展示页
class PageHomeWeather extends StatefulWidget {
  PageHomeWeather({Key key}) : super(key: key);

  _PageHomeWeatherState createState() => _PageHomeWeatherState();
}

class _PageHomeWeatherState extends State<PageHomeWeather> {
	@override
	Widget build(BuildContext context) {
		return BlocProvider(
			bloc: BlocWeatherList(),
			child: getWeatherComponent(),
		);
	}

	/// Redux数据调用: 绑定全局动态数据
	Widget getWeatherComponent() {
		return StoreConnector<AppState, dynamic>(
			converter: (store) => store.state.weather.weatherData,
			builder: (BuildContext context, weatherData) {
				return ComponentWeather(weatherData: weatherData);
			}
		);
	}
}