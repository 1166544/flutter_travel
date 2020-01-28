import 'package:flutter_travel/modules/weather/models/ModelDisplayWeatherInfo.dart';
import 'package:meta/meta.dart';

@immutable
class StateWeather {
	/// data
	final ModelDisplayWeatherInfo weatherData;

	StateWeather({
		this.weatherData
	});

	// 返回副本
    StateWeather copyWith({
		ModelDisplayWeatherInfo weatherData
    }) {
        return StateWeather(
            weatherData: weatherData ?? this.weatherData,
        );
    }

	@override
	String toString() {
		return this.weatherData.toString();
	}
}