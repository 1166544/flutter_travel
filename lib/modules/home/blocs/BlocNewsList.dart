import 'dart:async';

import 'package:flutter_travel/core/bloc/BlocBase.dart';
import 'package:flutter_travel/modules/home/models/ModelNewsItem.dart';
import 'package:flutter_travel/modules/home/models/ModelsNewsList.dart';
import 'package:flutter_travel/services/ServiceNewsList.dart';
import 'package:flutter_travel/core/manager/ManagerNotification.dart';
import 'package:flutter_travel/services/ServiceToken.dart';

/// 新闻列表数据
class BlocNewsList implements BlocBase {

	ModelsNewsList _gallery;
	ServiceNewsList _serviceNewsList;
	ServiceToken _serviceToken;
	ServiceNotification _serviceNotification;
	dynamic _requestParams = '';
	bool isFirstLoad = false;

	/// 数据流处理器对象
	StreamController<ModelsNewsList> galleryController;

	/// 流入流
	Sink<ModelsNewsList> get _inStream => galleryController.sink;

	/// 流出流
	Stream<ModelsNewsList> get outStream => galleryController.stream;

	BlocNewsList(this.galleryController) {
		this._serviceNewsList = new ServiceNewsList();
		this._serviceToken = new ServiceToken();
		this._serviceNotification = new ServiceNotification();
	}

	/// 初始化
	Future<Null> init() async {
		// 检测TOKEN有效性
		await this._serviceToken.getToken();

		// 初始化时调用service列表数据 
		dynamic result = await this._serviceNewsList.getNewsList(this._requestParams);

		// 返回数据列表更新数据源
		this._gallery = new ModelsNewsList();
		this._gallery.update(result);

		// 第1次弹消息通知
		if (this._gallery.news.length > 0 && this._requestParams['hot'] != null && !this.isFirstLoad) {
			ModelNewsItem item = this._gallery.news[0];
			await this._serviceNotification.showNotification(title: item.title, body: item.abs);
		}

		// 触发数据更新
		this._inStream.add(this._gallery);

		this.isFirstLoad = true;
	}

	Future<Null> invoke() async {
		// 检测TOKEN有效性
		await this._serviceToken.getToken();

		// 初始化时调用service列表数据 
		dynamic result = await this._serviceNewsList.getNewsListByRest(this._requestParams);

		// 返回数据列表更新数据源
		this._gallery = new ModelsNewsList();
		this._gallery.update(result);

		// 触发数据更新
		this._inStream.add(this._gallery);
	}

	/// 更新请求参数
	void updateParams(dynamic requestParams) {
		this._requestParams = requestParams;

		this.init();
	}

	/// 更新请求参数(重置方式)
	void updateParamsByReset(dynamic requestParams) {
		this._requestParams = requestParams;
		this.invoke();
	}

	/// 更新请求参数(过期TOKEN)
	void updateByTokenCancel(dynamic requestParams) {
		this._requestParams = requestParams;
		this._serviceToken.resetToken();
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
	/// * [ModelsNewsList gallery] 数据源
	void updateGallery(ModelsNewsList gallery) {
		this._gallery = gallery;
		this._inStream.add(this._gallery);
	}

}

/// BLOC实例
final blocNewsList = BlocNewsList(StreamController<ModelsNewsList>.broadcast());
