import 'package:flutter/widgets.dart';

/// 天气模块
class WeatherPage extends StatefulWidget {
  WeatherPage({Key key}) : super(key: key);

  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  @override
  Widget build(BuildContext context) {
	return Container(
	   child: Text('data'),
	);
  }
}