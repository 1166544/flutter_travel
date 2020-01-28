

import 'package:flutter_travel/modules/weather/models/ModelWeatherItem.dart';
import 'package:flutter_travel/modules/weather/models/model-air/ModelS6Air.dart';
import 'package:flutter_travel/modules/weather/models/model-weather/ModelS6Weather.dart';

/// 显示天气信息
class ModelDisplayWeatherInfo {

	/// 天气
	ModelS6Weather weatherInfo;

	/// 空气质量
	ModelS6Air airInfo;

	/// 城市信息
	ModelWeatherItem sourceData;

	ModelDisplayWeatherInfo({this.weatherInfo, this.airInfo, this.sourceData});
}