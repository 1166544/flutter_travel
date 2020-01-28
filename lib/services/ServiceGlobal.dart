import 'package:flutter_travel/redux/states/StateApp.dart';
import 'package:redux/redux.dart';

/// 全局服务
class ServiceGlobal {
	factory ServiceGlobal() => _getInstance();
	static ServiceGlobal get instance => _getInstance();
	static ServiceGlobal _instance;
	static ServiceGlobal _getInstance() {
		if (_instance == null) {
			_instance = new ServiceGlobal._internal();
		}

		return _instance;
	}

	Store<AppState> _store;

	ServiceGlobal._internal() {
		// 初始化 hole
	}

	static init(Store<AppState> store) {
		ServiceGlobal._getInstance().saveStoreInstance(store: store);
	}

	/// 保存STORE引用
  	void saveStoreInstance({Store<AppState> store}) {
		this._store = store;
	}

	/// 获取STORE引用
	Store<AppState> getStoreInstance() {
		return this._store;
	}

}
