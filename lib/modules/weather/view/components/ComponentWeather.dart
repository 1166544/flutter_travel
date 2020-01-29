import 'package:flutter/material.dart';
import 'package:flutter_travel/core/bloc/BlocProvider.dart';
import 'package:flutter_travel/modules/weather/blocs/BlocWeatherList.dart';
import 'package:flutter_travel/modules/weather/models/ModelDisplayWeatherInfo.dart';
import 'package:flutter_travel/modules/weather/view/components/ComponentWeatherWidget.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

/// 天气组件实现
class ComponentWeather extends StatefulWidget {
	final ModelDisplayWeatherInfo weatherData;
  	ComponentWeather({Key key, this.weatherData}) : super(key: key);

  	_ComponentWeatherState createState() => _ComponentWeatherState();
}

class _ComponentWeatherState extends State<ComponentWeather> {
	
	BlocWeatherList blocGalleryList;

	@override
	void dispose() {
		this.blocGalleryList.dispose();
		super.dispose();
	}

	@override
	Widget build(BuildContext context) {
		// 从STORE获取
		if (widget.weatherData != null) {
			return ComponentWeatherWidget(weather: widget.weatherData.sourceData);
		}
		
		this.blocGalleryList = BlocProvider.of<BlocWeatherList>(context);

		// 获取定位
		this.fetchWeatherWithLocation().catchError((error) {
			// _fetchWeatherWithCity();
		});

		return this.getStreamBuilder(context);
	}

	Widget getStreamBuilder(BuildContext context) {
		// 从BLOC获取
		return StreamBuilder(
			stream: this.blocGalleryList.outGallery,
			builder: (context, snapshot) {
				if (snapshot.hasData) {
					return this.buildLayout(snapshot);
				} else {
					return this.buildEmptyLayout(context);
				}
			},
		);
	}

	Widget buildLayout(AsyncSnapshot<ModelDisplayWeatherInfo> snapshot) {
		return ComponentWeatherWidget(weather: widget.weatherData.sourceData);
	}

	Widget buildEmptyLayout(BuildContext context) {
		return Text('');
	}

	Future<Null> fetchWeatherWithLocation() async {
		var permissionHandler = PermissionHandler();
		var permissionResult = await permissionHandler
			.requestPermissions([PermissionGroup.locationWhenInUse]);

		switch (permissionResult[PermissionGroup.locationWhenInUse]) {
		case PermissionStatus.denied:
		case PermissionStatus.unknown:
			print('location permission denied');
			showLocationDeniedDialog(permissionHandler);
			throw Error();
		}

		Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
		this.blocGalleryList.init(longitude: position.longitude, latitude: position.latitude);
  	}

	/// 不可用提示
	void showLocationDeniedDialog(PermissionHandler permissionHandler) {
		showDialog(
			context: context,
			barrierDismissible: true,
			builder: (BuildContext context) {
			return AlertDialog(
				backgroundColor: Colors.white,
				title: Text('当前定位服务不可用 :(',
					style: TextStyle(color: Colors.black)),
				actions: <Widget>[
				FlatButton(
					child: Text(
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