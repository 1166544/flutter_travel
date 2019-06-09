import 'package:flutter_travel/config/ConfigDefault.dart';

/// 测试环境配置
class ConfigTest extends ConfigDefault {

	ConfigTest(): super() {
		// 测试服务器URL配置
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
