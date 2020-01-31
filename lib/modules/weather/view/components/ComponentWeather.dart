import 'package:flutter/material.dart';
import 'package:flutter_travel/core/bloc/BlocProvider.dart';
import 'package:flutter_travel/modules/weather/blocs/BlocWeatherList.dart';
import 'package:flutter_travel/modules/weather/models/ModelDisplayWeatherInfo.dart';
import 'package:flutter_travel/modules/weather/view/components/ComponentWeatherWidget.dart';
import 'package:flutter_travel/services/ServiceGlobal.dart';
import 'package:geolocator/geolocator.dart';

/// 天气组件实现
class ComponentWeather extends StatefulWidget {
	final ModelDisplayWeatherInfo weatherData;
  	ComponentWeather({Key key, this.weatherData}) : super(key: key);

  	_ComponentWeatherState createState() => _ComponentWeatherState();
}

class _ComponentWeatherState extends State<ComponentWeather> with TickerProviderStateMixin {
	
	BlocWeatherList blocGalleryList;

	/// 淡出动画
	AnimationController controller;
	Animation animation;

	@override
	void initState() {
		super.initState();

		// 动画控制器
		this.controller = AnimationController(
			duration: Duration(seconds: 2),
			vsync: this
		);

		// 动画类型
		this.animation = Tween(
			begin: 0.0,
			end: 1.0
		).animate(this.controller);

		// 动画状态监听
		this.controller.addStatusListener((status) {
			print(status);
			// AnimationStatus.completed
			// AnimationStatus.dismissed
			// AnimationStatus.forward
			// AnimationStatus.reverse
		});

		// 启动动画
		this.controller.reset();
		this.controller.forward();
	}

	@override
	void dispose() {
		this.blocGalleryList.dispose();
		this.controller.dispose();
		super.dispose();
	}

	@override
	Widget build(BuildContext context) {
		// 从STORE获取
		if (widget.weatherData != null) {
			return FadeTransition(
				opacity: this.animation,
				child: ComponentWeatherWidget(weather: widget.weatherData.sourceData)
			);
		}
		
		this.blocGalleryList = BlocProvider.of<BlocWeatherList>(context);

		// 获取定位
		ServiceGlobal.instance.getGeoLocation(context).then((Position position) => {
			this.blocGalleryList.init(longitude: position.longitude, latitude: position.latitude)
		}).catchError((error) => {
			// hole
		});

		return this.getStreamBuilder(context);
	}

	/// 天气组件构造
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
		return FadeTransition(
				opacity: this.animation,
				child: ComponentWeatherWidget(weather: widget.weatherData.sourceData)
		);
	}

	Widget buildEmptyLayout(BuildContext context) {
		return Text('');
	}
}