import 'dart:async';

import 'package:flutter_travel/core/bloc/BlocBase.dart';
import 'package:flutter_travel/pages/modules/circler/models/CirclerModelsNewsList.dart';
import 'package:flutter_travel/services/ServiceNewsList.dart';
import 'package:flutter_travel/services/ServiceToken.dart';

/// 新闻列表数据
class CirclerBlocNewsList implements BlocBase {

	CirclerModelsNewsList _gallery;
	ServiceNewsList _serviceNewsList;
	ServiceToken _serviceToken;

	/// 数据流处理器对象
	StreamController<CirclerModelsNewsList> _galleryController;

	/// 流入流
	Sink<CirclerModelsNewsList> get _inGallery => _galleryController.sink;

	/// 流出流
	Stream<CirclerModelsNewsList> get outGallery => _galleryController.stream;

	CirclerBlocNewsList() {
		this._galleryController = StreamController<CirclerModelsNewsList>.broadcast();
		this._serviceNewsList = new ServiceNewsList();
		this._serviceToken = new ServiceToken();
		this.init();
	}

	/// 初始化
	Future<Null> init() async {
		// 检测TOKEN有效性
		await this._serviceToken.getToken();

		// 初始化时调用service列表数据 
		dynamic result = await this._serviceNewsList.getNewsList();

		// 返回数据列表更新数据源
		this._gallery = new CirclerModelsNewsList();
		this._gallery.update(result);

		// 触发数据更新
		this._inGallery.add(this._gallery);
	}

	Future<Null> update() async {
		await this.init();
	}

	@override
	void dispose() {
		this._galleryController.close();
	}

	/// 更新数据源操作
	/// * [CirclerModelsNewsList gallery] 数据源
	void updateGallery(CirclerModelsNewsList gallery) {
		this._gallery = gallery;
		this._inGallery.add(this._gallery);
	}

}
