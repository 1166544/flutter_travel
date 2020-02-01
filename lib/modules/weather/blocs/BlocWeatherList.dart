import 'dart:async';

import 'package:flutter_travel/core/bloc/BlocBase.dart';
import 'package:flutter_travel/modules/weather/models/ModelDisplayWeatherInfo.dart';
import 'package:flutter_travel/modules/weather/models/ModelWeatherItem.dart';
import 'package:flutter_travel/modules/weather/models/model-air/ModelS6Air.dart';
import 'package:flutter_travel/modules/weather/models/model-weather/ModelS6Weather.dart';
import 'package:flutter_travel/redux/actions/ActionWeather.dart';
import 'package:flutter_travel/redux/states/StateApp.dart';
import 'package:flutter_travel/services/ServiceFreeAirAndWeather.dart';
import 'package:flutter_travel/services/ServiceGlobal.dart';
import 'package:flutter_travel/services/ServiceOpenWeather.dart';
import 'package:redux/redux.dart';

/// 天气列表数据
class BlocWeatherList implements BlocBase {

	ModelDisplayWeatherInfo _gallery;
	ServiceOpenWeather _serviceWeatherList;
	ServiceFreeAirAndWeather _serviceWeatherAndAirList;
	Store<AppState> store;
	
	/// 数据流处理器对象
	StreamController<ModelDisplayWeatherInfo> galleryController;

	/// 流入流
	Sink<ModelDisplayWeatherInfo> get _inGallery => galleryController.sink;

	/// 流出流
	Stream<ModelDisplayWeatherInfo> get outGallery => galleryController.stream;

	BlocWeatherList(this.galleryController) {
		this._serviceWeatherList = new ServiceOpenWeather();
		this._serviceWeatherAndAirList = new ServiceFreeAirAndWeather();
		this.store = ServiceGlobal.instance.getStoreInstance();
	}

	/// 初始化
	Future<Null> init({double longitude, double latitude}) async {

		// 检测STORE中是否已存在
		if (this.store.state.weather.weatherData == null) {
			// 初始化时调用service列表数据 
			dynamic cityResult = await this._serviceWeatherList.getCityNameByPosition(lat:latitude, lon:longitude);
			ModelWeatherItem weatherSourceData = ModelWeatherItem.fromJson(cityResult.data);

			// 获取天气
			dynamic cityWeather = await this._serviceWeatherAndAirList.getWeatherInfoByName(location: weatherSourceData.cityName);
			ModelS6Weather weatherData = ModelS6Weather.fromJson(cityWeather.data);

			// 获取空气质量
			dynamic cityAir = await this._serviceWeatherAndAirList.getAirInfoByName(location: weatherSourceData.cityName);
			ModelS6Air airData = ModelS6Air.fromJson(cityAir.data);

			// 组装所需数据结构
			this._gallery = new ModelDisplayWeatherInfo(airInfo: airData, weatherInfo: weatherData, sourceData: weatherSourceData);

			// 触发数据更新
			this._inGallery.add(this._gallery);

			// 将数据存入STORE
			this.store.dispatch(ActionWeatherUpdate(this._gallery));
		}

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

/// BLOC实例
final blocWeatherList = BlocWeatherList(StreamController<ModelDisplayWeatherInfo>.broadcast());
