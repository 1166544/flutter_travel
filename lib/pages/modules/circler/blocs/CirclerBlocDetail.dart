import 'dart:async';

import 'package:flutter_travel/core/bloc/BlocBase.dart';
import 'package:flutter_travel/pages/modules/circler/models/CirclerModelCommentCount.dart';
import 'package:flutter_travel/pages/modules/circler/models/CirclerModelDetail.dart';
import 'package:flutter_travel/pages/modules/circler/models/CirclerModelPageData.dart';
import 'package:flutter_travel/services/ServiceNewsList.dart';
import 'package:flutter_travel/services/ServiceToken.dart';

/// 新闻详情数据
class CirclerBlocDetail implements BlocBase {

	CirclerModelPageData _detailInfo;
	ServiceNewsList _serviceNewsList;
	ServiceToken _serviceToken;
	dynamic _requestParams = '';

	/// 数据流处理器对象
	StreamController<CirclerModelPageData> _detailController;

	/// 流入流
	Sink<CirclerModelPageData> get _inStream => _detailController.sink;

	/// 流出流
	Stream<CirclerModelPageData> get outStream => _detailController.stream;

	CirclerBlocDetail() {
		this._detailController = StreamController<CirclerModelPageData>.broadcast();
		this._serviceNewsList = new ServiceNewsList();
		this._serviceToken = new ServiceToken();
	}

	/// 初始化
	Future<Null> init() async {
		// 检测TOKEN有效性
		await this._serviceToken.getToken();
		
		// 初始化时调用service列表数据 
		var nids = this._requestParams['nids'];
		dynamic resultDetail = await this._serviceNewsList.getDetail(nids);
		dynamic resultCommentCount = await this._serviceNewsList.getCommentCount(nids);

		// 留言数量数据
		var commentInfo = new CirclerModelCommentCount();
		commentInfo.update(resultCommentCount);

		// 页面详情数据
		var detailInfo = new CirclerModelDetail();
		detailInfo.update(resultDetail);

		// 构造数据结构
		this._detailInfo = new CirclerModelPageData();
		this._detailInfo.update(detailInfo, commentInfo);
		
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
		// this._detailController.close();
	}

}
