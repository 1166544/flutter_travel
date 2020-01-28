import 'package:meta/meta.dart';

@immutable
class StateWeather {
	/// data
	final dynamic weatherData;

	StateWeather({
		this.weatherData
	});

	// 返回副本
    StateWeather copyWith({
		dynamic weatherData
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