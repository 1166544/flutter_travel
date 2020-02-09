import 'dart:async';

import 'package:flutter_travel/core/bloc/BlocBase.dart';
import 'package:flutter_travel/modules/home/models/ModelContent.dart';

/// 封面数据源
class BlocDiscoverDetail implements BlocBase {

	ModelContent _data;

	/// 数据流处理器对象
	StreamController<ModelContent> _dataController;

	/// 流入流
	Sink<ModelContent> get _inGallery => _dataController.sink;

	/// 流出流
	Stream<ModelContent> get outGallery => _dataController.stream;

  	BlocDiscoverDetail(
		this._dataController,
	) {
		// hole
	}

	void dispose() {
		// this._dataController.close();
	}

	/// 更新数据源操作
	/// * [ModelContent data] 数据源
	void update(ModelContent data) {
		this._data = data;
		this._inGallery.add(this._data);
	}

}

/// BLOC实例
final blocDiscoverDetail = BlocDiscoverDetail(StreamController<ModelContent>.broadcast());
