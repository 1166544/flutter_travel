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

	/// 重写生成自定义头部
	Map<String, dynamic> generateRequestHeaders() {
		return {
			'Sec-Fetch-Mode': 'cors',
			'Sec-Fetch-Site': 'same-origin',
			'Host': 'news.baidu.com',
			'Accept': 'application/json, text/plain, */*',
			'Accept-Encoding': 'gzip, deflate, br',
			'Accept-Language': 'zh-CN,zh;q=0.9,en;q=0.8',
			'Connection': 'keep-alive',
			'Content-Length': 139,
			'Content-Type': 'application/x-www-form-urlencoded',
			'Origin': 'https://news.baidu.com',
			'Referer': 'https://news.baidu.com/news',
			'Sec-Fetch-Mode': 'cors',
			'Cookie': this.enviroment.getEnv().getToken().cookie,
			'User-Agent': 'Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A372 Safari/604.1'
		};
	}

	/// 返回typecode列表
	/// form 格式
	/// url https://news.baidu.com/sn/api/feed_channellist
	/// form=news_webapp&pd=webapp&os=iphone&category_name=%E5%9B%BE%E7%89%87&category_id=&action=1&display_time=0&mid=64769EF67AA38671B4907BA2602B1746%3AFG%3D1
	Future<Response<dynamic>> getNewsList(dynamic params) async {
		// 默认参数
		dynamic requestParams = {
			'form': 'news_webapp',
			'pd': 'webapp',
			'os': 'iphone',
			'category_name': '图片',
			'category_id': '',
			'action': 0,
			'display_time': new DateTime.now().millisecondsSinceEpoch,
			'mid': this.enviroment.getEnv().getToken().token
		};

		// 接收自定义传入参数
		if (params != '') {
			requestParams = params;
			requestParams['display_time'] = new DateTime.now().millisecondsSinceEpoch;
			requestParams['mid'] = this.enviroment.getEnv().getToken().token;
		}

		FormData formData = new FormData.fromMap(requestParams);

		return await this.post('sn/api/feed_channellist', data: formData);
	}

	/// 文章内容
	/// https://news.baidu.com/news?tn=bdapibaiyue&t=recommendinfo
	/// cuid: 
	/// nids: 9647858107215092637
	/// wf: 1
	/// remote_device_type: 1
	/// os_type: 2
	/// screen_size_width: 414
	/// screen_size_height: 736
	Future<Response<dynamic>> getDetail(String nids) async {
		// 默认参数
		dynamic requestParams = {
			'cuid': '',
			'nids': nids,
			'wf': 1,
			'remote_device_type': 1,
			'os_type': 1,
			'screen_size_width': 360,
			'screen_size_height': 640
		};

		FormData formData = new FormData.fromMap(requestParams);

		return await this.post('news?tn=bdapibaiyue&t=recommendinfo', data: formData);
	}

	// 评论数量
	// https://news.baidu.com/news?tn=bdapibaiyue&t=getbodyinfo&act=get
	// nid: 9647858107215092637
	// from: info
	// pd: webapp
	// ver: 5
	Future<Response<dynamic>> getCommentCount(String nids) async {
		// test Start÷,
		nids = '10708585149717629205';
		// test end 
		
		// 默认参数
		dynamic requestParams = {
			'from': 'info',
			'nid': nids,
			'pd': 'webapp',
			'ver': 5
		};

		FormData formData = new FormData.fromMap(requestParams);

		return await this.post('news?tn=bdapibaiyue&t=getbodyinfo&act=get', data: formData);
	}

	// 评论列表
	// https://news.baidu.com/news?tn=bdapibaiyue&t=getcomments&act=get
	// nid: 9647858107215092637
	// from: info
	// pd: webapp
	// comment_id: 0
	// order: time
	// ver: 3
	// pn: 10
	// ts: 0
	Future<Response<dynamic>> getCommentInfo(String nids) async {
		// test Start÷,
		nids = '10708585149717629205';
		// test end 
		
		// 默认参数
		dynamic requestParams = {
			'from': 'info',
			'nid': nids,
			'pd': 'webapp',
			'ver': 3,
			'comment_id': 0,
			'order': 'time',
			'pn': 10,
			'ts': new DateTime.now().millisecondsSinceEpoch
		};

		FormData formData = new FormData.fromMap(requestParams);

		return await this.post('news?tn=bdapibaiyue&t=getcomments&act=get', data: formData);
	}
}
