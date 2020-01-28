
import 'package:flutter_travel/modules/weather/models/air/ModelS6Air.dart';
import 'package:flutter_travel/modules/weather/models/weather/ModelS6Weather.dart';

/// 显示天气信息
class ModelDisplayWeatherInfo {

	/// 天气
	ModelS6Weather weatherInfo;

	/// 空气质量
	ModelS6Air airInfo;

	dynamic sourceData;

	ModelDisplayWeatherInfo({this.weatherInfo, this.airInfo, this.sourceData});
}