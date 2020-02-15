import 'package:flutter/material.dart';
import 'package:flutter_travel/modules/common/CommonText.dart';
import 'package:flutter_travel/modules/weather/models/ModelWeatherItem.dart';
import 'package:flutter_travel/modules/weather/view/components/ComponentConverters.dart';
import 'package:flutter_travel/modules/weather/view/components/ComponentTemplature.dart';
import 'package:flutter_travel/modules/weather/view/components/ComponentValueTile.dart';

/// 温度和天气显示组件
class ComponentWeatherSwiperPager extends StatefulWidget {
	final ModelWeatherItem weather;
  	ComponentWeatherSwiperPager({Key key, this.weather}) : super(key: key);

  	_ComponentWeatherSwiperPagerState createState() => _ComponentWeatherSwiperPagerState();
}

class _ComponentWeatherSwiperPagerState extends State<ComponentWeatherSwiperPager> with TickerProviderStateMixin {
	final TemperatureUnit temperatureUnit = TemperatureUnit.celsius;
	
	AnimationController controller;
  	Animation<Offset> animationRight;
  	Animation<Offset> animationLeft;

	@override
	void initState() {
		super.initState();
		this.controller = AnimationController(duration: Duration(milliseconds: 600), vsync: this);
		this.controller.addStatusListener((status) {
			// print(status);	
		});

    	Animation curve = new CurvedAnimation(parent: controller, curve: Curves.easeOut);
		this.animationRight = Tween(begin: Offset(1.0, 0.0), end: Offset.zero).animate(curve);
		this.animationLeft = Tween(begin: Offset(-1.0, 0.0), end: Offset.zero).animate(curve);
		this.controller.forward();
	}

	@override
	void dispose() {
		super.dispose();
		this.controller.dispose();
	}

	@override
	Widget build(BuildContext context) {
		return Column(
			mainAxisAlignment: MainAxisAlignment.center,
			children: <Widget>[
				SizedBox(
					height: 20,
				),
				Icon(
					widget.weather.getIconData(),
					color: Colors.black,
					size: 70,
				),
				SizedBox(
					height: 20,
				),
				Row(
					mainAxisAlignment: MainAxisAlignment.center,
					crossAxisAlignment: CrossAxisAlignment.start,
					children: <Widget>[
						ComponentTemplature(templature: widget.weather.temperature.as(this.temperatureUnit).round()),
						SlideTransition(
							position: this.animationLeft,
							child: CommonText(
								' °',
								style: TextStyle(
									fontSize: 100,
									fontWeight: FontWeight.w100,
									color: Colors.black,
								)
							)
						),
						SlideTransition(
							position: this.animationRight,
							child: CommonText(
								'C',
								style: TextStyle(
									fontSize: 100,
									fontWeight: FontWeight.w100,
									color: Colors.black,
								)
							)
						)
					],
				),
				Row(
					mainAxisAlignment: MainAxisAlignment.center, 
					children: <Widget>[
						ComponentValueTile("max", '${widget.weather.maxTemperature.as(this.temperatureUnit).round()} °C'),
						Padding(
							padding: const EdgeInsets.only(left: 15, right: 15),
							child: Center(
								child: Container(
							width: 1,
							height: 30,
							color:
								Colors.black.withOpacity(0.3),
							)),
						),
						ComponentValueTile("min", '${widget.weather.minTemperature.as(this.temperatureUnit).round()} °C'),
					]
				),
			]
		);
	}
}
