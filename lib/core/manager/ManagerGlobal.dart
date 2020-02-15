import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_travel/core/bloc/BlocNetwork.dart';
import 'package:flutter_travel/modules/common/CommonText.dart';
import 'package:flutter_travel/redux/states/StateApp.dart';
import 'package:flutter_travel/routers/Routers.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:redux/redux.dart';

/// 全局服务
class ManagerGlobal {
	factory ManagerGlobal() => _getInstance();
	static ManagerGlobal get instance => _getInstance();
	static ManagerGlobal _instance;
	static ManagerGlobal _getInstance() {
		if (_instance == null) {
			_instance = new ManagerGlobal._internal();
		}

		return _instance;
	}

	/// 全局STORE
	Store<AppState> _store;

	/// 地理定位服务
	Position _geoLocation;

	/// 路由
	Routers _router;

	BlocNetwork _blockNetworkInstance;

	ManagerGlobal._internal() {
		// 初始化 hole
	}

	static init(Store<AppState> store, Routers router) {
		ManagerGlobal._getInstance().saveStoreInstance(store: store);
		ManagerGlobal._getInstance().saveRouter(router: router);
	}

	/// 网络状态BLOC
	BlocNetwork getBlocNetworkInstance() {
		if (this._blockNetworkInstance == null) {
			this._blockNetworkInstance = blocNetwork;
		}

		return this._blockNetworkInstance;
	}

	/// 保存router引用
	void saveRouter({Routers router}) {
		this._router = router;
	}

	/// 获取router引用
	Routers getRouters() {
		return this._router;
	}

	/// 保存STORE引用
  	void saveStoreInstance({Store<AppState> store}) {
		this._store = store;
	}

	/// 获取STORE引用
	Store<AppState> getStoreInstance() {
		return this._store;
	}

	/// 获取地理位置
	Future<Position> getGeoLocation(BuildContext context) async {

		if (this._geoLocation != null) {
			return this._geoLocation;
		}

		var permissionHandler = PermissionHandler();
		var permissionResult = await permissionHandler
			.requestPermissions([PermissionGroup.locationWhenInUse]);

		switch (permissionResult[PermissionGroup.locationWhenInUse]) {
		case PermissionStatus.denied:
		case PermissionStatus.unknown:
			print('location permission denied');
			showLocationDeniedDialog(context, permissionHandler);
			throw Error();
		}

		this._geoLocation = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
		return this._geoLocation;
	}

	/// 不可用提示
	void showLocationDeniedDialog(BuildContext context, PermissionHandler permissionHandler) {
		showDialog(
			context: context,
			barrierDismissible: true,
			builder: (BuildContext context) {
			return AlertDialog(
				backgroundColor: Colors.white,
				title: CommonText('当前定位服务不可用 :(',
					style: TextStyle(color: Colors.black)),
				actions: <Widget>[
				FlatButton(
					child: CommonText(
					'开启!',
					style: TextStyle(color: Colors.green, fontSize: 16),
					),
					onPressed: () {
					permissionHandler.openAppSettings();
					Navigator.of(context).pop();
					},
				),
				],
			);
		});
  	}

}
