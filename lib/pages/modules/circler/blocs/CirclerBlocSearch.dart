import 'dart:async';

import 'package:flutter_travel/core/bloc/BlocBase.dart';
import 'package:flutter_travel/pages/modules/circler/models/CirclerModelsNewsList.dart';
import 'package:flutter_travel/services/ServiceLibInfo.dart';

/// 搜索列表数据
class CirclerBlocSearch implements BlocBase {

	CirclerModelsNewsList _gallery;
	ServiceLibInfo _serviceLibInfo;
	dynamic _requestParams = '';

	/// 数据流处理器对象
	StreamController<CirclerModelsNewsList> _galleryController;

	/// 流入流
	Sink<CirclerModelsNewsList> get _inGallery => _galleryController.sink;

	/// 流出流
	Stream<CirclerModelsNewsList> get outGallery => _galleryController.stream;

	CirclerBlocSearch() {
		this._galleryController = StreamController<CirclerModelsNewsList>.broadcast();
		this._serviceLibInfo = new ServiceLibInfo();
	}

	/// 初始化
	Future<Null> init() async {
		// 检测TOKEN有效性
		// await this._serviceToken.getToken();
		await this._serviceLibInfo.getLibInfo(this._requestParams);

		// 初始化时调用service列表数据 
		dynamic result = await this._serviceLibInfo.getSearchContent(this._requestParams);

		// // 返回数据列表更新数据源
		this._gallery = new CirclerModelsNewsList();
		// this._gallery.update(result);

		// // 触发数据更新
		// this._inGallery.add(this._gallery);
	}

	/// 更新请求参数
	void updateParams(dynamic requestParams) {
		this._requestParams = requestParams;
		this.init();
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
