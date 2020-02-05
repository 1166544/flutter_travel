import 'dart:async';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_travel/core/CoreApp.dart';
import 'package:flutter_travel/core/bloc/BlocBase.dart';
import 'package:flutter_travel/modules/home/models/ModelsNewsList.dart';
import 'package:flutter_travel/services/ServiceNewsList.dart';
import 'package:flutter_travel/services/ServiceToken.dart';

/// 新闻列表数据
class BlocNewsList implements BlocBase {

	ModelsNewsList _gallery;
	ServiceNewsList _serviceNewsList;
	ServiceToken _serviceToken;
	dynamic _requestParams = '';

	/// 数据流处理器对象
	StreamController<ModelsNewsList> galleryController;

	/// 流入流
	Sink<ModelsNewsList> get _inGallery => galleryController.sink;

	/// 流出流
	Stream<ModelsNewsList> get outGallery => galleryController.stream;

	BlocNewsList(this.galleryController) {
		this._serviceNewsList = new ServiceNewsList();
		this._serviceToken = new ServiceToken();
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

		await this.showNotification();

		// 触发数据更新
		this._inGallery.add(this._gallery);
	}

	Future<Null> invoke() async {
		// 检测TOKEN有效性
		await this._serviceToken.getToken();

		// 初始化时调用service列表数据 
		dynamic result = await this._serviceNewsList.getNewsListByRest(this._requestParams);

		// 返回数据列表更新数据源
		this._gallery = new ModelsNewsList();
		this._gallery.update(result);

		await this.showNotification();

		// 触发数据更新
		this._inGallery.add(this._gallery);
	}

	/// 弹出通知
	Future<void> showNotification() async {
		var androidPlatformChannelSpecifics = AndroidNotificationDetails(
			'your channel id', 
			'your channel name', 
			'your channel description',
			importance: Importance.Max, 
			priority: Priority.High, 
			ticker: 'ticker'
		);
		var iOSPlatformChannelSpecifics = IOSNotificationDetails();
		var platformChannelSpecifics = NotificationDetails(
			androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);

		await flutterLocalNotificationsPlugin.show(
			0, 
			this._gallery.news[0].title, 
			'plain body', 
			platformChannelSpecifics,
			payload: 
			'item x'
		);
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
		this._inGallery.add(this._gallery);
	}

}

/// BLOC实例
final blocNewsList = BlocNewsList(StreamController<ModelsNewsList>.broadcast());
