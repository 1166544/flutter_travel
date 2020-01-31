import 'package:flutter/material.dart';
import 'package:flutter_travel/modules/weather/models/ModelWeatherItem.dart';
import 'package:flutter_travel/modules/weather/view/components/ComponentWeatherSwipePager.dart';

/// 简化版天气消息
class ComponentWeatherWidget extends StatefulWidget {
	final ModelWeatherItem weather;
  	ComponentWeatherWidget({Key key, this.weather}) : super(key: key);

  	_ComponentWeatherWidgetState createState() => _ComponentWeatherWidgetState();
}

class _ComponentWeatherWidgetState extends State<ComponentWeatherWidget> with TickerProviderStateMixin {

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
		this.controller.dispose();
		super.dispose();
	}

	@override
	Widget build(BuildContext context) {
		return Center(
			child: Column(
				mainAxisAlignment: MainAxisAlignment.center,
				children: <Widget>[
					SizedBox(height: 20),
					Text(
					widget.weather.cityName.toUpperCase(),
					style: TextStyle(
						fontWeight: FontWeight.w900,
						letterSpacing: 5,
						color: Colors.black,
						fontSize: 25),
					),
					SizedBox(
					height: 10,
					),
					Text(
					widget.weather.description.toUpperCase(),
					style: TextStyle(
						fontWeight: FontWeight.w200,
						letterSpacing: 5,
						fontSize: 15,
						color: Colors.black,
					)),

					FadeTransition(
						opacity: this.animation,
						child:ComponentWeatherSwiperPager(weather: widget.weather)
					)
				]
			),
		);
	}
}
