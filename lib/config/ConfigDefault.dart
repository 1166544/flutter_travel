/// 默认配置
class ConfigDefault {

	/// 调用服务器API列表配置
	List<ApiConfigVO> serverUrlList = [];

	ConfigDefault() {
		/// 服务器默认URL配置(各环境在构造函数中重写)
		this.serverUrlList.add(ApiConfigVO(
			key: API_ENUM.API_OPEN,
			serverUrl: 'https://www.apiopen.top/'
		));
		this.serverUrlList.add(ApiConfigVO(
			key: API_ENUM.TENCENT,
			serverUrl: 'https://www.qq.com/'
		));
		this.serverUrlList.add(ApiConfigVO(
			key: API_ENUM.JSON_PLACE_HOLDER,
			serverUrl: 'https://jsonplaceholder.typicode.com/'
		));
	}

	/// 获取服务器URL
	String getServerUrl(API_ENUM enumName) {
		String serverUrl = '';
		this.serverUrlList.forEach((ApiConfigVO value) {
			if (value.key == enumName) {
				serverUrl = value.serverUrl;
			}
		});

		return serverUrl;
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
	TENCENT,
	JSON_PLACE_HOLDER
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
