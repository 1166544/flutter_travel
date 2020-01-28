import 'dart:async';

import 'package:flutter_travel/core/bloc/BlocBase.dart';
import 'package:flutter_travel/modules/weather/models/ModelWeatherList.dart';
import 'package:flutter_travel/services/ServiceOpenWeather.dart';

/// 天气列表数据
class BlocWeatherList implements BlocBase {

	ModelWeatherList _gallery;
	ServiceOpenWeather _serviceWeatherList;

	/// 数据流处理器对象
	StreamController<ModelWeatherList> _galleryController;

	/// 流入流
	Sink<ModelWeatherList> get _inGallery => _galleryController.sink;

	/// 流出流
	Stream<ModelWeatherList> get outGallery => _galleryController.stream;

	BlocWeatherList() {
		this._galleryController = StreamController<ModelWeatherList>.broadcast();
		this._serviceWeatherList = new ServiceOpenWeather();
	}

	/// 初始化
	Future<Null> init() async {

		// 初始化时调用service列表数据 
		dynamic cityResult = await this._serviceWeatherList.getCityNameByPosition(lat:23.1290800000, lon:113.2643600000);

		// 返回数据列表更新数据源
		this._gallery = ModelWeatherList.fromJson(cityResult.data);

		// 触发数据更新
		this._inGallery.add(this._gallery);
	}

	@override
	void dispose() {
		// this._galleryController.close();
	}

	/// 更新数据源操作
	/// * [ModelWeatherList gallery] 数据源
	void updateGallery(ModelWeatherList gallery) {
		this._gallery = gallery;
		this._inGallery.add(this._gallery);
	}

}
