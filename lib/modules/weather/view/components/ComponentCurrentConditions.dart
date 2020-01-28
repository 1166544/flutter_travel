import 'package:flutter/material.dart';
import 'package:flutter_travel/modules/weather/models/ModelWeatherItem.dart';
import 'package:flutter_travel/modules/weather/view/components/ComponentValueTile.dart';

/// Renders Weather Icon, current, min and max temperatures
class ComponentCurrentConditions extends StatelessWidget {
  final ModelWeatherItem weather;
  const ComponentCurrentConditions({Key key, this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
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
          'C°',
          style: TextStyle(
              fontSize: 100,
              fontWeight: FontWeight.w100,
              color: Colors.black,
        )),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          ComponentValueTile("max",
              'c°'),
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
          ComponentValueTile("min",
              'c°'),
        ]),
      ]
    );
  }
}
