import 'dart:async';

import 'package:flutter_travel/core/bloc/BlocBase.dart';
import 'package:flutter_travel/modules/profile/models/ModelProfile.dart';
import 'package:flutter_travel/services/ServiceNow.dart';

/// 我的页面数据
class BlocMyInfo implements BlocBase {

	ModelProfile _gallery;
	ServiceNow _serviceNow;

	/// 数据流处理器对象
	StreamController<ModelProfile> galleryController;

	/// 流入流
	Sink<ModelProfile> get _inGallery => galleryController.sink;

	/// 流出流
	Stream<ModelProfile> get outGallery => galleryController.stream;

	BlocMyInfo(this.galleryController) {
		this._serviceNow = new ServiceNow();
		this.init();
	}

	/// 初始化
	Future<Null> init() async {
		// 初始化时调用service列表数据 
		dynamic result = await this._serviceNow.getContributions();

		// 返回数据列表更新数据源
		this._gallery = new ModelProfile.fromJson(result.data);

		// 触发数据更新
		this._inGallery.add(this._gallery);
	}

	Future<Null> update() async {
		await this.init();
	}

	@override
	void dispose() {
		// hole
	}

	/// 更新数据源操作
	/// * [GraphicsBlocModel gallery] 数据源
	void updateGallery(ModelProfile gallery) {
		this._gallery = gallery;
		this._inGallery.add(this._gallery);
	}

}

/// BLOC实例
final blocMyInfo = BlocMyInfo(StreamController<ModelProfile>.broadcast());