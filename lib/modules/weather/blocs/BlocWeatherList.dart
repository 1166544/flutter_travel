import 'dart:async';

import 'package:flutter_travel/core/bloc/BlocBase.dart';
import 'package:flutter_travel/modules/weather/models/ModelDisplayWeatherInfo.dart';
import 'package:flutter_travel/modules/weather/models/ModelS6Air.dart';
import 'package:flutter_travel/modules/weather/models/ModelS6Weather.dart';
import 'package:flutter_travel/modules/weather/models/ModelWeatherList.dart';
import 'package:flutter_travel/services/ServiceFreeAirAndWeather.dart';
import 'package:flutter_travel/services/ServiceOpenWeather.dart';

/// 天气列表数据
class BlocWeatherList implements BlocBase {

	ModelDisplayWeatherInfo _gallery;
	ServiceOpenWeather _serviceWeatherList;
	ServiceFreeAirAndWeather _serviceWeatherAndAirList;

	/// 数据流处理器对象
	StreamController<ModelDisplayWeatherInfo> _galleryController;

	/// 流入流
	Sink<ModelDisplayWeatherInfo> get _inGallery => _galleryController.sink;

	/// 流出流
	Stream<ModelDisplayWeatherInfo> get outGallery => _galleryController.stream;

	BlocWeatherList() {
		this._galleryController = StreamController<ModelDisplayWeatherInfo>.broadcast();
		this._serviceWeatherList = new ServiceOpenWeather();
		this._serviceWeatherAndAirList = new ServiceFreeAirAndWeather();
	}

	/// 初始化
	Future<Null> init() async {

		// 初始化时调用service列表数据 
		dynamic cityResult = await this._serviceWeatherList.getCityNameByPosition(lat:23.1290800000, lon:113.2643600000);
		ModelWeatherList weatherSourceData = ModelWeatherList.fromJson(cityResult.data);

		// 获取天气
		dynamic cityWeather = await this._serviceWeatherAndAirList.getWeatherInfoByName(location: weatherSourceData.name);
		ModelS6Weather weatherData = ModelS6Weather.fromJson(cityWeather.data);

		// 获取空气质量
		dynamic cityAir = await this._serviceWeatherAndAirList.getAirInfoByName(location: weatherSourceData.name);
		ModelS6Air airData = ModelS6Air.fromJson(cityAir.data);

		// 组装所需数据结构
		this._gallery = new ModelDisplayWeatherInfo(airInfo: airData, weatherInfo: weatherData);

		// 触发数据更新
		this._inGallery.add(this._gallery);
	}

	@override
	void dispose() {
		// this._galleryController.close();
	}

	/// 更新数据源操作
	/// * [ModelWeatherList gallery] 数据源
	void updateGallery(ModelDisplayWeatherInfo gallery) {
		this._gallery = gallery;
		this._inGallery.add(this._gallery);
	}

}
