import 'package:flutter_travel/config/ConfigDefault.dart';

/// 灰度环境配置
class ConfigGrey extends ConfigDefault {

	ConfigGrey(): super() {
		// 灰度服务器URL配置
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
