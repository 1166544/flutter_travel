import 'package:flutter/widgets.dart';
import 'package:flutter_travel/modules/common/CommonText.dart';

/// 天气模块
class WeatherPage extends StatefulWidget {
  WeatherPage({Key key}) : super(key: key);

  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  @override
  Widget build(BuildContext context) {
	return Container(
	   child: CommonText('data'),
	);
  }
}