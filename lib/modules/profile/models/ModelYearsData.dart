
import 'package:flutter_travel/modules/profile/models/ModelRange.dart';

class ModelYearsData {

	String year;
	int total;
	ModelRange range;

	ModelYearsData({this.year, this.total, this.range});

	factory ModelYearsData.fromJson(Map<String, dynamic> json) {
		return ModelYearsData(
			year: json['year'],
			total: json['total'],
			range: ModelRange.fromJson(json['range']),
		);
	}
}