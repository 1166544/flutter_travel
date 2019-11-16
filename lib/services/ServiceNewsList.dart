import 'package:dio/dio.dart';
import 'package:flutter_travel/core/api/ApiEnum.dart';
import 'package:flutter_travel/core/http/HttpServiceCore.dart';

import 'ServiceEnviroment.dart';

/// 百度 API服务
class ServiceNewsList extends HttpServiceCore {
	factory ServiceNewsList() => _getInstance();
	static ServiceNewsList get instance => _getInstance();
	static ServiceNewsList _instance;
	static ServiceNewsList _getInstance() {
		if (_instance == null) {
			_instance = new ServiceNewsList._internal();
		}

		return _instance;
	}

	ServiceNewsList._internal(): super() {
		// 初始化
		this.apiKey = API_ENUM.BAIDU;
		this.enviroment = ServiceEnviroment.instance;
		this.baseUrl = this.enviroment.getEnv().getServerUrl(this.apiKey);

		super.init();
	}

	/// 返回typecode列表
	/// form 格式
	/// url https://news.baidu.com/sn/api/feed_channellist
	/// form=news_webapp&pd=webapp&os=iphone&category_name=%E5%9B%BE%E7%89%87&category_id=&action=1&display_time=0&mid=64769EF67AA38671B4907BA2602B1746%3AFG%3D1
	Future<Response<dynamic>> getNewsList() async {

		FormData formData = new FormData.fromMap({
			// 'loc': 0,
			// 'form': 'news_webapp',
			// 'pd': 'webapp',
			// 'os': 'iphone',
			// 'ver': 6,
			// // 'category_name': '娱乐',
			// 'category_id': 101,
			// 'action': 0,
			// 'display_time': new DateTime.now(),
			// 'wf': 0,
			// 'mid': 'DC3DAE25021A944C55E30CD420BAAB8A:FG=1'
			'form': 'news_webapp',
			'pd': 'webapp',
			'os': 'iphone',
			'category_name': '图片',
			'category_id': '',
			'action': 0,
			'display_time': new DateTime.now().millisecondsSinceEpoch,
			'mid': 'BA06E80E361A6FA5011CEFBF76C82268:FG=1'
		});
		return await this.post('sn/api/feed_channellist', data: formData);
	}
}
