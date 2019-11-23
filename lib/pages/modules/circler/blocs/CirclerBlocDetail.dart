import 'dart:async';

import 'package:flutter_travel/core/bloc/BlocBase.dart';
import 'package:flutter_travel/pages/modules/circler/models/CirclerModelDetail.dart';
import 'package:flutter_travel/services/ServiceNewsList.dart';

/// 新闻详情数据
class CirclerBlocDetail implements BlocBase {

	CirclerModelDetail _detailInfo;
	ServiceNewsList _serviceNewsList;
	dynamic _requestParams = '';

	/// 数据流处理器对象
	StreamController<CirclerModelDetail> _detailController;

	/// 流入流
	Sink<CirclerModelDetail> get _inStream => _detailController.sink;

	/// 流出流
	Stream<CirclerModelDetail> get outStream => _detailController.stream;

	CirclerBlocDetail() {
		this._detailController = StreamController<CirclerModelDetail>.broadcast();
		this._serviceNewsList = new ServiceNewsList();
	}

	/// 初始化
	Future<Null> init() async {
		// 初始化时调用service列表数据 
		dynamic result = await this._serviceNewsList.getDetail(this._requestParams['nids']);

		// 返回数据列表更新数据源
		this._detailInfo = new CirclerModelDetail();
		this._detailInfo.update(result);

		// 触发数据更新
		this._inStream.add(this._detailInfo);
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
		this._detailController.close();
	}

	/// 更新数据源操作
	/// * [CirclerModelsNewsList gallery] 数据源
	void updateGallery(CirclerModelDetail gallery) {
		this._detailInfo = gallery;
		this._inStream.add(this._detailInfo);
	}

}
