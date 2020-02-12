import 'dart:async';

import 'package:flutter_travel/core/bloc/BlocBase.dart';
import 'package:flutter_travel/core/http/HttpTransformerCore.dart';

/// 网络状态数据
class BlocNetwork implements BlocBase {

	HttpTransformResponse _data;

	/// 数据流处理器对象
	StreamController<HttpTransformResponse> _dataController;

	/// 流入流
	Sink<HttpTransformResponse> get _inStream => _dataController.sink;

	/// 流出流
	Stream<HttpTransformResponse> get outStream => _dataController.stream;

  	BlocNetwork(
		this._dataController,
	) {
		// hole
	}

	void dispose() {
		// this._dataController.close();
	}

	/// 更新数据源操作
	/// * [ModelContent data] 数据源
	void update(HttpTransformResponse data) {
		this._data = data;
		this._inStream.add(this._data);
	}

}

/// BLOC实例
final blocNetwork = BlocNetwork(StreamController<HttpTransformResponse>.broadcast());
