import 'package:dio/dio.dart';
import 'package:flutter_travel/core/api/ApiEnum.dart';
import 'package:flutter_travel/core/http/HttpServiceCore.dart';
import 'package:flutter_travel/core/manager/ManagerEnviroment.dart';
import 'package:flutter_travel/modules/search/models/ModelSearchConfig.dart';
import 'package:flutter_travel/modules/search/models/ModelSearchList.dart';
import 'package:flutter_travel/modules/search/models/ModelSearchPage.dart';
import 'package:flutter_travel/modules/search/models/ModelSearchTabList.dart';

/// search API服务
class ServiceSearchList extends HttpServiceCore {
	factory ServiceSearchList() => _getInstance();
	static ServiceSearchList get instance => _getInstance();
	static ServiceSearchList _instance;
	static ServiceSearchList _getInstance() {
		if (_instance == null) {
			_instance = new ServiceSearchList._internal();
		}

		return _instance;
	}

	ModelSearchConfig config;
	bool stRequestMode;
	String ua;

	ServiceSearchList._internal(): super() {
		// 初始化
		this.apiKey = API_ENUM.WEIBO;
		this.enviroment = ManagerEnviroment.instance;
		this.baseUrl = this.enviroment.getEnv().getServerUrl(this.apiKey);
		this.ua = 'Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A372 Safari/604.1';
		this.closeStMode();
		super.init();
	}

	void openStMode() {
		this.stRequestMode = true;
	}

	void closeStMode() {
		this.stRequestMode = false;
	}

	/// 自定义头部
	Map<String, String> generateRequestHeaders() {
		if (this.stRequestMode) {
			return {
				'Accept': 'application/json, text/plain, */*',
				'MWeibo-Pwa': '1',
				'Referer': this.baseUrl,
				'Sec-Fetch-Mode': 'cors',
				'User-Agent': this.ua,
				'X-Requested-With': 'XMLHttpRequest',
				'X-XSRF-TOKEN': this.config.st
			};
		}

		// 默认模式
		return {
			'Sec-Fetch-Mode': 'navigate',
			'Sec-Fetch-User': '?1',
			'Upgrade-Insecure-Requests': '1',
			'User-Agent': this.ua
		};
	}

	/// st获取
	Future<ModelSearchPage> getTicket() async {
		ModelSearchPage pageConfigData = this.enviroment.getEnv().getTicket();

		if (pageConfigData == null) {
			// 检测st
			Response response = await this.get('');
			this.config = new ModelSearchConfig();
			this.config.update(source: response.data);
			this.openStMode();

			// 调用列表数据
			ModelSearchTabList tabList = await this.getTabList();

			this.enviroment.getEnv().updateTicket(ModelSearchPage(config: this.config, tabList: tabList));
		} else {
			this.config = pageConfigData.config;
			this.openStMode();
		}

		return pageConfigData;
	}

	/// TAB列表
	Future<ModelSearchTabList> getTabList() async {
		Response response = await this.get('api/config/list');
		return ModelSearchTabList.fromJson(response.data);
	}

	/// 渲染数据
	Future<ModelSearchList> getRenderList() async {
		return ModelSearchList();
	}
}