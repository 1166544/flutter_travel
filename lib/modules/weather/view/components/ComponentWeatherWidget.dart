import 'package:flutter/material.dart';
import 'package:flutter_travel/modules/weather/models/ModelWeatherItem.dart';
import 'package:flutter_travel/modules/weather/view/components/ComponentWeatherSwipePager.dart';

/// 简化版天气消息
class ComponentWeatherWidget extends StatelessWidget {
  final ModelWeatherItem weather;

  ComponentWeatherWidget({this.weather}) : assert(weather != null);

  @override
  Widget build(BuildContext context) {
	return Center(
		child: Column(
			mainAxisAlignment: MainAxisAlignment.center,
			children: <Widget>[
				SizedBox(height: 20),
				Text(
				this.weather.cityName.toUpperCase(),
				style: TextStyle(
					fontWeight: FontWeight.w900,
					letterSpacing: 5,
					color: Colors.black,
					fontSize: 25),
				),
				SizedBox(
				height: 10,
				),
				Text(
				this.weather.description.toUpperCase(),
				style: TextStyle(
					fontWeight: FontWeight.w200,
					letterSpacing: 5,
					fontSize: 15,
					color: Colors.black,
				)),
				ComponentWeatherSwipePager(weather: weather),
			]
		),
	);
  }
}
