import 'dart:async';

import 'package:flutter_travel/core/bloc/BlocBase.dart';
import 'package:flutter_travel/modules/splash/models/ModelsBing.dart';
import 'package:flutter_travel/services/ServiceBing.dart';

/// 封面数据
class BlocSplashList implements BlocBase {

	ModelsBing _gallery;
	ServiceBing _serviceNewsList;

	/// 数据流处理器对象
	StreamController<ModelsBing> galleryController;

	/// 流入流
	Sink<ModelsBing> get _inGallery => galleryController.sink;

	/// 流出流
	Stream<ModelsBing> get outGallery => galleryController.stream;

	BlocSplashList(this.galleryController) {
		this._serviceNewsList = new ServiceBing();
	}

	/// 初始化
	Future<Null> init(dynamic requestParams) async {

		// 初始化时调用service列表数据 
		dynamic result = await this._serviceNewsList.getSplashImage({});

		// 返回数据列表更新数据源序列化
		this._gallery = ModelsBing.fromJson(result.data);

		// 触发数据更新
		this._inGallery.add(this._gallery);
	}

	@override
	void dispose() {
		// this._galleryController.close();
	}

	/// 更新数据源操作
	/// * [ModelsNewsList gallery] 数据源
	void updateGallery(ModelsBing gallery) {
		this._gallery = gallery;
		this._inGallery.add(this._gallery);
	}

}

/// BLOC实例
final blocSplashList = BlocSplashList(StreamController<ModelsBing>.broadcast());