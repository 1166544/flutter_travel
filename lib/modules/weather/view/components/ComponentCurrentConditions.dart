import 'package:flutter/material.dart';
import 'package:flutter_travel/modules/weather/models/ModelWeatherItem.dart';
import 'package:flutter_travel/modules/weather/view/components/ComponentConverters.dart';
import 'package:flutter_travel/modules/weather/view/components/ComponentValueTile.dart';

/// Renders Weather Icon, current, min and max temperatures
class ComponentCurrentConditions extends StatelessWidget {
	final ModelWeatherItem weather;
	final TemperatureUnit temperatureUnit = TemperatureUnit.celsius;
	ComponentCurrentConditions({Key key, this.weather}) : super(key: key);
	
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
			mainAxisAlignment: MainAxisAlignment.center, 
			crossAxisAlignment: CrossAxisAlignment.start,
			children: <Widget>[
				Icon(
					weather.getIconData(),
					color: Colors.black,
					size: 70,
				),
				SizedBox(
					height: 20,
				),
				Text(
					'${this.weather.temperature.as(this.temperatureUnit).round()}°',
					style: TextStyle(
						fontSize: 100,
						fontWeight: FontWeight.w100,
						color: Colors.black,
				))
			],
		),
        Row(
			mainAxisAlignment: MainAxisAlignment.center, 
			children: <Widget>[
				ComponentValueTile("max", '${this.weather.maxTemperature.as(this.temperatureUnit).round()}°'),
				Padding(
					padding: const EdgeInsets.only(left: 15, right: 15),
					child: Center(
						child: Container(
					width: 1,
					height: 30,
					color:
						Colors.black,
					)),
				),
				ComponentValueTile("min", '${this.weather.minTemperature.as(this.temperatureUnit).round()}°'),
        	]
		),
      ]
    );
  }
}
