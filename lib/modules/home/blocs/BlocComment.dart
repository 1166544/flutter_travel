import 'dart:async';

import 'package:flutter_travel/core/bloc/BlocBase.dart';
import 'package:flutter_travel/modules/home/models/ModelCommentData.dart';
import 'package:flutter_travel/services/ServiceNewsList.dart';
import 'package:flutter_travel/services/ServiceToken.dart';

/// 留言区BLOC
class BlocComment implements BlocBase {
	ModelCommentData _commentInfo;
	ServiceNewsList _serviceNewsList;
	ServiceToken _serviceToken;
	dynamic _requestParams = '';

	/// 数据流处理器对象
	StreamController<ModelCommentData> _commentController;

	/// 流入流
	Sink<ModelCommentData> get _inStream => _commentController.sink;

	/// 流出流
	Stream<ModelCommentData> get outStream => _commentController.stream;

	BlocComment() {
		this._commentController = StreamController<ModelCommentData>.broadcast();
		this._serviceNewsList = new ServiceNewsList();
		this._serviceToken = new ServiceToken();
	}

	/// 初始化
	Future<Null> init() async {
		// 检测TOKEN有效性
		await this._serviceToken.getToken();
		
		// 初始化时调用service列表数据 
		var nids = this._requestParams['nids'];
		dynamic resultDetail = await this._serviceNewsList.getCommentInfo(nids);

		// 构造数据结构
		this._commentInfo = new ModelCommentData();
		this._commentInfo.update(resultDetail);
		
		// 触发数据更新
		this._inStream.add(this._commentInfo);
	}

	/// 更新请求参数
	void updateParams(dynamic requestParams) {
		this._requestParams = requestParams;
		this.init();
	}

	Future<Null> update() async {
		await this.init();
	}

	void dispose() {
		// this._commentController.close();
	}
}