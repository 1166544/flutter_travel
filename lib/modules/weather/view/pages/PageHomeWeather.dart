import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_travel/core/bloc/BlocProvider.dart';
import 'package:flutter_travel/modules/weather/blocs/BlocWeatherList.dart';
import 'package:flutter_travel/modules/weather/view/components/ComponentWeather.dart';
import 'package:flutter_travel/redux/states/StateApp.dart';

/// 首页天气展示页
class PageHomeWeather extends StatefulWidget {
  PageHomeWeather({Key key}) : super(key: key);

  _PageHomeWeatherState createState() => _PageHomeWeatherState();
}

class _PageHomeWeatherState extends State<PageHomeWeather> with TickerProviderStateMixin {
	
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
		this.controller.forward();
	}

	@override
	void dispose() {
		super.dispose();
		this.controller.dispose();
	}
	
	@override
	Widget build(BuildContext context) {
		return BlocProvider(
			bloc: BlocWeatherList(),
			// 淡入淡出动画
			child: FadeTransition(
				opacity: this.animation,
				child: this.getWeatherComponent(),
			),
		);
	}

	/// Redux数据调用: 绑定全局动态数据
	Widget getWeatherComponent() {
		return StoreConnector<AppState, dynamic>(
			converter: (store) => store.state.weather.weatherData,
			builder: (BuildContext context, weatherData) {
				return ComponentWeather(weatherData: weatherData);
			}
		);
	}
}