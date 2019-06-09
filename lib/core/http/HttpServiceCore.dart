import 'dart:async';

import 'package:flutter_travel/config/ConfigDefault.dart';
import 'package:flutter_travel/services/ServiceEnviroment.dart';
import 'package:dio/dio.dart';

/// 封装过的HTTP请求核心类
class HttpServiceCore {

	/// 频道KEY
	API_ENUM apiKey;

	/// 配置文件
	ServiceEnviroment enviroment;

	/// 基本URL
	String baseUrl;

	/// 网络请求
	Dio dio;

	HttpServiceCore() {
		this.dio = new Dio();
	}

	/// 处理GET请求
	Future<Response<dynamic>> get(String path, {Map<String, dynamic> queryParameters, Options options}) async {
		var response;
		if (queryParameters != null) {
			response = await this.dio.get(path, queryParameters: queryParameters, options: options);
		} else {
			response = await this.dio.get(path);
		}

		return response;
	}

	/// 处理POST请求
	Future<Response<dynamic>> post(String path, {dynamic data, Map<String, dynamic> queryParameters, Options options}) async {
		var response;
		if (queryParameters != null) {
			response = await this.dio.post(path, data: data, queryParameters: queryParameters, options: options);
		} else {
			response = await this.dio.post(path, data: data);
		}

		return response;
	}

	// TODOPUT DELETE UPDATE...interrop
}
