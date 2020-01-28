import 'package:flutter/material.dart';
import 'package:flutter_travel/core/bloc/BlocProvider.dart';
import 'package:flutter_travel/modules/weather/blocs/BlocWeatherList.dart';
import 'package:flutter_travel/modules/weather/models/ModelWeatherList.dart';

/// 天气组件实现
class ComponentWeather extends StatefulWidget {
  ComponentWeather({Key key}) : super(key: key);

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

		this.blocGalleryList = BlocProvider.of<BlocWeatherList>(context);
		this.blocGalleryList.init();

		return this.getStreamBuilder(context);
	}

	Widget getStreamBuilder(BuildContext context) {
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

	Widget buildLayout(AsyncSnapshot<ModelWeatherList> snapshot) {
		return Text('data');
	}

	Widget buildEmptyLayout(BuildContext context) {
		return Text('test');
	}
}