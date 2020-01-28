import 'package:flutter/material.dart';
import 'package:flutter_travel/modules/weather/models/ModelWeatherItem.dart';
import 'package:flutter_travel/modules/weather/view/components/ComponentCurrentConditions.dart';

class ComponentWeatherSwipePager extends StatelessWidget {
  const ComponentWeatherSwipePager({
    Key key,
    @required this.weather,
  }) : super(key: key);

  final ModelWeatherItem weather;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 200,
      child: ComponentCurrentConditions(
            weather: weather,
        ),
    );
  }
}
