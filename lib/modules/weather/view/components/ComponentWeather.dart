import 'package:flutter/material.dart';
import 'package:flutter_travel/core/bloc/BlocProvider.dart';
import 'package:flutter_travel/modules/weather/blocs/BlocWeatherList.dart';
import 'package:flutter_travel/modules/weather/models/ModelDisplayWeatherInfo.dart';
import 'package:flutter_travel/modules/weather/view/components/ComponentWeatherWidget.dart';

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
		this.blocGalleryList.init();

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
}