import 'dart:async';

import 'package:flutter_travel/core/bloc/BlocBase.dart';
import 'package:flutter_travel/modules/home/models/ModelSearch.dart';
import 'package:flutter_travel/services/ServiceLibInfo.dart';

/// 搜索列表数据
class BlocSearch implements BlocBase {

	ServiceLibInfo _serviceLibInfo;
	dynamic _requestParams = '';

	/// 数据流处理器对象
	StreamController<ModelSearch> _galleryController;

	/// 流入流
	Sink<ModelSearch> get _inGallery => _galleryController.sink;

	/// 流出流
	Stream<ModelSearch> get outGallery => _galleryController.stream;

	BlocSearch() {
		this._galleryController = StreamController<ModelSearch>.broadcast();
		this._serviceLibInfo = new ServiceLibInfo();
	}

	/// 初始化
	Future<Null> init() async {
		// 获取LIBID
		await this._serviceLibInfo.getLibInfo(this._requestParams); 

		// 初始化时调用service列表数据 
		dynamic result = await this._serviceLibInfo.getSearchContent(this._requestParams);

		// 返回数据列表更新数据源
		ModelSearch gallery = new ModelSearch();
		gallery.update(result);

		// 触发数据更新
		this.updateGallery(gallery);
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
		// this._galleryController.close();
	}

	/// 更新数据源操作
	/// * [ModelSearch gallery] 数据源
	void updateGallery(ModelSearch gallery) {
		this._inGallery.add(gallery);
	}

}
