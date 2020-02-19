import 'dart:async';

import 'package:flutter_travel/core/bloc/BlocBase.dart';
import 'package:flutter_travel/modules/search/models/ModelSearchList.dart';
import 'package:flutter_travel/services/ServiceSearchList.dart';

/// SEARCH页数据源
class BlocSearchList implements BlocBase {
	ModelSearchList _data;
	ServiceSearchList _serviceSearchList;

	/// 数据流处理对象
	StreamController<ModelSearchList> _dataController;

	/// 流入流
	Sink<ModelSearchList> get _inStream => this._dataController.sink;

	/// 流出流
	Stream<ModelSearchList> get outStream => this._dataController.stream;

	BlocSearchList(this._dataController) {
		this._serviceSearchList = new ServiceSearchList();
	}

	ModelSearchList get data {
		return this._data;
	}

	void dispose() {
		// hole
	}

	/// 初始化调用
	/// * [String containerid] 容器ID
	/// * [String sinceId] 页面
	/// * [String openApp] openApp
	Future<Null> init({String containerid, String sinceId = '1', String openApp = '0'}) async {
		// st check
		await this._serviceSearchList.getTicket();

		// 页面数据源
		ModelSearchList renderData = await this._serviceSearchList.getRenderList(containerid: containerid, sinceId: sinceId);

		/// 触发数据更新
		this.update(renderData);
	}

	/// 更新操作
	/// * [ModelSearchList data] 数据源
	void update(ModelSearchList data) {
		this._data = data;
		this._inStream.add(this._data);
	}
}

/// 导出实例
final blocSearchList = BlocSearchList(StreamController<ModelSearchList>.broadcast());