import 'dart:async';
import 'dart:io';

// import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/adapter.dart';
import 'package:flutter_travel/core/api/ApiEnum.dart';
import 'package:flutter_travel/core/api/ApiEnviroment.dart';
import 'package:flutter_travel/core/http/HttpTransformerCore.dart';
// import 'package:flutter_travel/core/http/HttpTransformerCore.dart';
import 'package:flutter_travel/core/manager/ManagerEnviroment.dart';
import 'package:dio/dio.dart';
import 'package:flutter_travel/core/manager/ManagerGlobal.dart';

/// 封装过的HTTP请求核心类
class HttpServiceCore {

	/// 频道KEY
	API_ENUM apiKey;

	/// 配置文件
	ManagerEnviroment enviroment;

	/// 基本URL
	String baseUrl;

	/// 网络请求
	Dio dio;

	HttpServiceCore() {
		// hole
	}

	void init() {
		this.dio = new Dio();
		this.dio.options.baseUrl = this.baseUrl;
		this.dio.options.connectTimeout = 15000;
		this.dio.options.receiveTimeout = 15000;

		// 请求和响应处理
		this.dio.interceptors.add(InterceptorsWrapper(
			onRequest:(RequestOptions options){
				// 在请求被发送之前做一些事情
				this.dio.interceptors.requestLock.lock();
				options.headers = this.generateRequestHeaders();
				this.dio.interceptors.requestLock.unlock();
				return options; //continue
				// 如果你想完成请求并返回一些自定义数据，可以返回一个`Response`对象或返回`dio.resolve(data)`。
				// 这样请求将会被终止，上层then会被调用，then中返回的数据将是你的自定义数据data.
				//
				// 如果你想终止请求并触发一个错误,你可以返回一个`DioError`对象，或返回`dio.reject(errMsg)`，
				// 这样请求将被中止并触发异常，上层catchError会被调用。
			},
			onResponse:(Response response) {
				// 在返回响应数据之前做一些预处理 
				this.formatStatus(response);
				return response; // continue
			},
			onError: (DioError e) async {
				// 请求失败时预处理, 通知TOAST，加载中提示
				this.formatError(e);
				return e;
			}
		));

		// 开启请求日志
		this.dio.interceptors.add(LogInterceptor(responseBody: false));

		// cookie
		// this.dio.interceptors.add(CookieManager(CookieJar()));

		// 自定义拦截器
		// this.dio.transformer = new HttpTransformerCore();

		// 开发环境抓包请求
		var proxyUrl = ManagerEnviroment.instance.getEnv().getProxyUrl();
		if (ManagerEnviroment.instance.env == ENVIROMENT.DEVELOPEMENT && proxyUrl != null) {
			(dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
				(HttpClient client) {
				client.findProxy = (uri) {
					// proxy all request to localhost:8888
					return 'PROXY $proxyUrl';
				};
				client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
			};
		}
	}

	/// 返回状态码处理
	String formatStatus(Response response) {
		String statusDesc;
		switch(response.statusCode) {
			case 400:
				statusDesc = '请求语法错误';
				break;
			case 403:
				statusDesc = '服务器拒绝执行';
				break;
			case 404:
				statusDesc = '无法连接服务器';
				break;
			case 405:
				statusDesc = '请求方法被禁止';
				break;
			case 500:
				statusDesc = '服务器内部错误';
				break;
			case 502:
				statusDesc = '无效的请求';
				break;
			case 503:
				statusDesc = '服务器服务停止响应';
				break;
			case 505:
				statusDesc = '不支持HTTP协议请求';
				break;
		}
		if (statusDesc != null) {
			print(statusDesc);
		}

		return statusDesc;
	}

	/// error错误信息处理
	String formatError(DioError e) {
		String errorDesc;
		switch(e.type) {
			case DioErrorType.CONNECT_TIMEOUT:
		    	errorDesc = '连接超时';
				break;
			case DioErrorType.SEND_TIMEOUT:
				errorDesc = '请求超时';
				break;
			case DioErrorType.RECEIVE_TIMEOUT:
				errorDesc = '响应超时';
				break;
			case DioErrorType.RESPONSE:
				errorDesc = '出现异常';
				break;
			case DioErrorType.CANCEL:
				errorDesc = '请求取消';
				break;
			case DioErrorType.DEFAULT:
				errorDesc = '未知错误';
				break;
		}

		return errorDesc;
	}

	/// 处理返回错误描述
	Response<dynamic> handleErrorInfo(DioError e) {
		HttpTransformResponse responseErrorData = HttpTransformResponse(
			errmsg: this.formatError(e),
			errorUrl:e.request.path,
			errorServer: e.request.uri.toString(),
			errorStatus: e.error.osError.errorCode.toString(),
			errorDesc: e.error.osError.message,
		);

		Response response = Response(data: responseErrorData);

		// 通知数据源更新，UI界面显示网络状态提示
		ManagerGlobal.instance.getBlocNetworkInstance().update(responseErrorData);

		return response;
	}
				
	/// 处理GET请求
	///  * [String path] 请求地址
	///  * [Map<String, dynamic> queryParameters] 请求参数
	///  * [Options options] 配置
	Future<Response<dynamic>> get(String path, {Map<String, dynamic> queryParameters, Options options}) async {
		var response;
		try {
			if (queryParameters != null) {
				response = await this.dio.get(path, queryParameters: queryParameters, options: options);
			} else {
				response = await this.dio.get(path);
			}
		} catch (e) {
			response = this.handleErrorInfo(e);
		}

		return response;
	}

	/// 处理POST请求
	/// * [String path] 请求地址
	/// * [dynamic data] 请求数据
	/// * [Map<String, dynamic> queryParameters] 请求参数
	/// * [Options options] 配置
	Future<Response<dynamic>> post(String path, {dynamic data, Map<String, dynamic> queryParameters, Options options}) async {
		var response;
		try {
			if (queryParameters != null) {
				response = await this.dio.post(path, data: data, queryParameters: queryParameters, options: options);
			} else {
				response = await this.dio.post(path, data: data);
			}
		} catch (e) {
			response = this.handleErrorInfo(e);
		}

		return response;
	}

	/// 处理put
	Future<Response<dynamic>> put(String path, {data, Options options, CancelToken cancelToken}) async {
		var response;
		try {
			response = await this.dio.put(path, data: data, options: options, cancelToken: cancelToken);
		} catch (e) {
			response = this.handleErrorInfo(e);
		}

		return response;
	}

	/// 处理delete
	Future<Response<dynamic>> delete(String path, {data, Options options, CancelToken cancelToken}) async {
		var response;
		try {
			response = await this.dio.delete(path, data: data, options: options, cancelToken: cancelToken);
		} catch (e) {
			response = this.handleErrorInfo(e);
		}

		return response;
	}

	/// 处理head
	Future<Response<dynamic>> head(String path, {data, Options options, CancelToken cancelToken}) async {
		var response;
		try {
			response = this.dio.head(path, data: data, options: options, cancelToken: cancelToken);
		} catch (e) {
			response = this.handleErrorInfo(e);
		}

		return response;
	}

	/// 处理patch
	Future<Response<dynamic>> patch(String path, {data, Options options, CancelToken cancelToken}) async {
		var response;
		try {
			response = this.dio.patch(path, data: data, options: options, cancelToken: cancelToken);
		} catch (e) {
			response = this.handleErrorInfo(e);
		}

		return response;
	}

	/// 生成自定义头部
	Map<String, String> generateRequestHeaders() {
		return {
			'Accept': 'application/json, text/plain, */*',
			'Connection': 'keep-alive',
			'User-Agent': 'Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A372 Safari/604.1'
		};
	}

	/// 处理download
	// Future<Response<dynamic>> download(String urlPath, String savePath, {OnDownloadProgress onProgress, data, bool flush: false, Options options,CancelToken cancelToken}) async {
	// 	var response;
	// 	return await this.dio.download(urlPath, savePath, onProgress: onProgress, data: data, flush: flush, options: options, cancelToken: cancelToken);
	// }
}
