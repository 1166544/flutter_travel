/// 默认配置
class ConfigDefault {

	/// 调用服务器API列表配置
	Map<API_ENUM, dynamic> serverUrlList = Map<API_ENUM, dynamic>();

	ConfigDefault() {
		/// 服务器URL配置
		this.serverUrlList[API_ENUM.API_OPEN] = ApiConfigVO(
			key: API_ENUM.API_OPEN,
			serverUrl: 'https://www.apiopen.top/'
		);
		this.serverUrlList[API_ENUM.TENCENT] = ApiConfigVO(
			key: API_ENUM.TENCENT,
			serverUrl: 'https://www.qq.com/'
		);
	}

	/// 获取服务器URL
	String getServerUrl(API_ENUM enumName) {
		if (this.serverUrlList[enumName]) {
			return this.serverUrlList[enumName].serverUrl;
		} else {
			throw new ArgumentError('$enumName值为空');
		}
	}

}

/// URL数据源
class ApiConfigVO {
	/// URL KEY
	API_ENUM key;

	/// URL地址
	String serverUrl;

	ApiConfigVO({this.key, this.serverUrl});
}

/// API KEY
enum API_ENUM {
	API_OPEN,
	BAIDU,
	SINA,
	TENCENT
}

/// 环境变量
enum ENVIROMENT {
	/// 开发环境
	DEVELOPEMENT,
	/// 测试环境
	TEST,
	/// 灰度环境
	GREY,
	/// 生产环境
	PROD
}
