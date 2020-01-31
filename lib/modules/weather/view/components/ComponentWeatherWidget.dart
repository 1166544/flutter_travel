import 'package:flutter/material.dart';
import 'package:flutter_travel/modules/weather/models/ModelWeatherItem.dart';
import 'package:flutter_travel/modules/weather/view/components/ComponentWeatherSwipePager.dart';

/// 简化版天气消息
class ComponentWeatherWidget extends StatefulWidget {
	final ModelWeatherItem weather;
  	ComponentWeatherWidget({Key key, this.weather}) : super(key: key);

  	_ComponentWeatherWidgetState createState() => _ComponentWeatherWidgetState();
}

class _ComponentWeatherWidgetState extends State<ComponentWeatherWidget> {
	@override
	Widget build(BuildContext context) {
		return Center(
			child: Column(
				mainAxisAlignment: MainAxisAlignment.center,
				children: <Widget>[
					SizedBox(height: 20),
					Text(
					widget.weather.cityName.toUpperCase(),
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
					widget.weather.description.toUpperCase(),
					style: TextStyle(
						fontWeight: FontWeight.w200,
						letterSpacing: 5,
						fontSize: 15,
						color: Colors.black,
					)),
					ComponentWeatherSwiperPager(weather: widget.weather),
				]
			),
		);
	}
}
