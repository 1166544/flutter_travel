import 'package:flutter/material.dart';
import 'package:flutter_travel/modules/weather/models/ModelWeatherItem.dart';
import 'package:flutter_travel/modules/weather/view/components/ComponentConverters.dart';
import 'package:flutter_travel/modules/weather/view/components/ComponentValueTile.dart';

class ComponentWeatherSwiperPager extends StatefulWidget {
	final ModelWeatherItem weather;
  	ComponentWeatherSwiperPager({Key key, this.weather}) : super(key: key);

  	_ComponentWeatherSwiperPagerState createState() => _ComponentWeatherSwiperPagerState();
}

class _ComponentWeatherSwiperPagerState extends State<ComponentWeatherSwiperPager> {
	final TemperatureUnit temperatureUnit = TemperatureUnit.celsius;
	
	@override
	Widget build(BuildContext context) {
		return Column(
		mainAxisAlignment: MainAxisAlignment.center,
		children: <Widget>[
			SizedBox(
				height: 20,
			),
			Icon(
				widget.weather.getIconData(),
				color: Colors.black,
				size: 70,
			),
			SizedBox(
				height: 20,
			),
			Text(
				'${widget.weather.temperature.as(this.temperatureUnit).round()} °C',
				style: TextStyle(
					fontSize: 100,
					fontWeight: FontWeight.w100,
					color: Colors.black,
			)),
			Row(
				mainAxisAlignment: MainAxisAlignment.center, 
				children: <Widget>[
					ComponentValueTile("max", '${widget.weather.maxTemperature.as(this.temperatureUnit).round()} °C'),
					Padding(
						padding: const EdgeInsets.only(left: 15, right: 15),
						child: Center(
							child: Container(
						width: 1,
						height: 30,
						color:
							Colors.black.withOpacity(0.3),
						)),
					),
					ComponentValueTile("min", '${widget.weather.minTemperature.as(this.temperatureUnit).round()} °C'),
				]
			),
		]
		);
	}
}
