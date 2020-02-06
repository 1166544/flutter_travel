import 'package:dio/dio.dart';
import 'package:flutter_travel/core/api/ApiEnum.dart';
import 'package:flutter_travel/core/http/HttpServiceCore.dart';
import 'package:flutter_travel/core/manager/ManagerEnviroment.dart';

/// CN NODE API服务
class ServiceCnNode extends HttpServiceCore {
	factory ServiceCnNode() => _getInstance();
	static ServiceCnNode get instance => _getInstance();
	static ServiceCnNode _instance;
	static ServiceCnNode _getInstance() {
		if (_instance == null) {
			_instance = new ServiceCnNode._internal();
		}

		return _instance;
	}

	ServiceCnNode._internal(): super() {
		// 初始化
		this.apiKey = API_ENUM.API_OPEN;
		this.enviroment = ManagerEnviroment.instance;
		this.baseUrl = this.enviroment.getEnv().getServerUrl(this.apiKey);

		super.init();
	}

	/// 获取主题
	/// * [Number page] 页数
	/// * [String tab] 主题分类。目前有 ask share job good
	/// * [Number limit] 每一页的主题数量
	/// * [String mdrender] 当为 false 时，不渲染。默认为 true，渲染出现的所有 markdown 格式文本。
	/// url https://cnodejs.org/api/v1/topics
	Future<Response<dynamic>> getTopicsData() async {
		return await this.get('api/v1/topics');
	}

	/// get /topic/:id 主题详情
	/// * [String mdrender] 当为 false 时，不渲染。默认为 true，渲染出现的所有 markdown 格式文本。
	/// * [String accesstoken] 当需要知道一个主题是否被特定用户收藏以及对应评论是否被特定用户点赞时，才需要带此参数。会影响返回值中的 is_collect 以及 replies 列表中的 is_uped 值。
	/// url https://cnodejs.org/api/v1/topic/5433d5e4e737cbe96dcef312
	Future<Response<dynamic>> getTopicsDetailData(String detailId) async {
		return await this.get('api/v1/topics/$detailId');
	}
}
