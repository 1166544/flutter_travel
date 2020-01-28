import 'package:flutter/material.dart';
import 'package:flutter_travel/modules/weather/models/ModelWeatherItem.dart';
import 'package:flutter_travel/modules/weather/view/components/ComponentValueTile.dart';
import 'package:flutter_travel/modules/weather/view/components/ComponentWeatherSwipePager.dart';
import 'package:intl/intl.dart';

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
            height: 20,
          ),
          Text(
            this.weather.description.toUpperCase(),
            style: TextStyle(
                fontWeight: FontWeight.w100,
                letterSpacing: 5,
                fontSize: 15,
                color: Colors.black,
          )),
          ComponentWeatherSwipePager(weather: weather),
          Padding(
            child: Divider(
              color:Colors.black,
            ),
            padding: EdgeInsets.all(1),
          ),
          Row(
			  mainAxisAlignment: MainAxisAlignment.center, 
			  children: <Widget>[
				ComponentValueTile("Wind speed", '${this.weather.windSpeed} m/s'),
				Padding(
				padding: const EdgeInsets.only(left: 15, right: 15),
				child: Center(
					child: Container(
					width: 1,
					height: 30,
					color: Colors.white,
				)),
				),
				ComponentValueTile(
					"Sunrise",
					DateFormat('h:m a').format(DateTime.fromMillisecondsSinceEpoch(
						this.weather.sunrise * 1000))),
				Padding(
				padding: const EdgeInsets.only(left: 15, right: 15),
				child: Center(
					child: Container(
					width: 1,
					height: 30,
					color: Colors.white,
				)),
				),
				ComponentValueTile(
					"Sunset",
					DateFormat('h:m a').format(DateTime.fromMillisecondsSinceEpoch(
						this.weather.sunset * 1000))),
				Padding(
				padding: const EdgeInsets.only(left: 15, right: 15),
				child: Center(
					child: Container(
					width: 1,
					height: 30,
					color: Colors.white,
				)),
				),
				ComponentValueTile("Humidity", '${this.weather.humidity}%'),
          	]),
			SizedBox(height: 20.0,)
        ]
      ),
    );
  }
}
