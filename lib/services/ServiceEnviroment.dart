import 'package:flutter_travel/config/ConfigDefault.dart';
import 'package:flutter_travel/config/ConfigDev.dart';
import 'package:flutter_travel/config/ConfigGrey.dart';
import 'package:flutter_travel/config/ConfigProd.dart';
import 'package:flutter_travel/config/ConfigTest.dart';

/// 环境配置服务
class ServiceEnviroment {
	factory ServiceEnviroment() => _getInstance();
	static ServiceEnviroment get instance => _getInstance();
	static ServiceEnviroment _instance;
	static ServiceEnviroment _getInstance() {
		if (_instance == null) {
			_instance = new ServiceEnviroment._internal();
		}

		return _instance;
	}

	static init(ENVIROMENT env) {
		ServiceEnviroment enviroment = ServiceEnviroment.instance;
		enviroment.updateEnv(env);
	}

	/// 获取当前环境配置(static)
	static getCurrentEnviroment() {
		return ServiceEnviroment.instance.getEnv();
	}

	ServiceEnviroment._internal() {
		// 初始化 hole
	}

	/// 默认配置
	ConfigDefault _configDefault;

	/// 当前环境
	ENVIROMENT env;

	/// 更新环境配置
	void updateEnv(ENVIROMENT env) {
		this.env = env;
		print('当前环境:::  ${this.env.toString()}');
		switch (env) {
		  case ENVIROMENT.DEVELOPEMENT:
			this._configDefault = new ConfigDev();
			break;
		  case ENVIROMENT.TEST:
			this._configDefault = new ConfigTest();
			break;
		  case ENVIROMENT.GREY:
			this._configDefault = new ConfigGrey();
			break;
		  case ENVIROMENT.PROD:
			this._configDefault = new ConfigProd();
			break;
		  default:
		  	this._configDefault = new ConfigProd();
			break;
		}
	}

	/// 获取当前配置
	ConfigDefault getEnv() {
		return this._configDefault;
	}

}
