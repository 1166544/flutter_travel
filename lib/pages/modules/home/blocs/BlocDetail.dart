import 'dart:async';

import 'package:flutter_travel/core/bloc/BlocBase.dart';
import 'package:flutter_travel/pages/modules/home/models/ModelCommentCount.dart';
import 'package:flutter_travel/pages/modules/home/models/ModelCommentData.dart';
import 'package:flutter_travel/pages/modules/home/models/ModelDetail.dart';
import 'package:flutter_travel/pages/modules/home/models/ModelPageData.dart';
import 'package:flutter_travel/services/ServiceNewsList.dart';
import 'package:flutter_travel/services/ServiceToken.dart';

/// 新闻详情数据
class BlocDetail implements BlocBase {

	ModelPageData _detailInfo;
	ServiceNewsList _serviceNewsList;
	ServiceToken _serviceToken;
	dynamic _requestParams = '';

	/// 数据流处理器对象
	StreamController<ModelPageData> _detailController;

	/// 流入流
	Sink<ModelPageData> get _inStream => _detailController.sink;

	/// 流出流
	Stream<ModelPageData> get outStream => _detailController.stream;

	BlocDetail() {
		this._detailController = StreamController<ModelPageData>.broadcast();
		this._serviceNewsList = new ServiceNewsList();
		this._serviceToken = new ServiceToken();
	}

	/// 初始化
	Future<Null> init() async {
		// 检测TOKEN有效性
		await this._serviceToken.getToken();
		
		// 初始化时调用service列表数据 
		String nids = this._requestParams['nids'];

		// 页面详情数据
		dynamic resultDetail = await this._serviceNewsList.getDetail(nids);
		ModelDetail detailInfo = new ModelDetail();
		detailInfo.update(resultDetail);

		// 加载留言数量数据
		dynamic resultCommentCount = await this._serviceNewsList.getCommentCount(nids);
		ModelCommentCount commentInfo = new ModelCommentCount();
		commentInfo.update(resultCommentCount);

		// 加载留言列表数据
		dynamic commentList = await this._serviceNewsList.getCommentInfo(nids);
		ModelCommentData commentListData = new ModelCommentData();
		commentListData.update(commentList);

		// 构造页面展示所需要数据结构
		this._detailInfo = new ModelPageData();
		this._detailInfo.update(detailInfo, commentInfo, commentListData);
		
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
