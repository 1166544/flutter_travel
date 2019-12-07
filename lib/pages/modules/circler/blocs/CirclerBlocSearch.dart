import 'dart:async';

import 'package:flutter_travel/core/bloc/BlocBase.dart';
import 'package:flutter_travel/pages/modules/graphics/models/GraphicsBlocModel.dart';
import 'package:flutter_travel/services/ServiceJsonPlaceHolder.dart';

/// 搜索列表数据
class CirclerBlocSearch implements BlocBase {

	GraphicsBlocModel _gallery;
	ServiceJsonPlaceHolder _serviceJsonPlaceHolder;

	/// 数据流处理器对象
	StreamController<GraphicsBlocModel> _galleryController;

	/// 流入流
	Sink<GraphicsBlocModel> get _inGallery => _galleryController.sink;

	/// 流出流
	Stream<GraphicsBlocModel> get outGallery => _galleryController.stream;

	CirclerBlocSearch() {
		this._galleryController = StreamController<GraphicsBlocModel>.broadcast();
		this._serviceJsonPlaceHolder = new ServiceJsonPlaceHolder();
		this.init();
	}

	/// 初始化
	Future<Null> init() async {
		// 初始化时调用service列表数据 
		dynamic result = await this._serviceJsonPlaceHolder.getPostsData();

		// 返回数据列表更新数据源
		this._gallery = new GraphicsBlocModel();
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
	/// * [GraphicsBlocModel gallery] 数据源
	void updateGallery(GraphicsBlocModel gallery) {
		this._gallery = gallery;
		this._inGallery.add(this._gallery);
	}

}
