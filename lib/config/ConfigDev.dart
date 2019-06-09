import 'package:flutter_travel/config/ConfigDefault.dart';

/// 开发环境配置
class ConfigDev extends ConfigDefault {

	ConfigDev(): super() {
		// 开发服服务器URL配置
		this.serverUrlList.add(ApiConfigVO(
			key: API_ENUM.API_OPEN,
			serverUrl: 'https://www.apiopen.top/'
		));
		this.serverUrlList.add(ApiConfigVO(
			key: API_ENUM.TENCENT,
			serverUrl: 'https://www.qq.com/'
		));
	}

}
