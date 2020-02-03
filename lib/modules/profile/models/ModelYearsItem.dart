
import 'package:flutter_travel/modules/profile/models/ModelYearsData.dart';

class ModelYearsItem {

	List<ModelYearsData> list = [];

	ModelYearsItem({Map<String, dynamic> source}) {
		for (var item in source.keys) {
			this.list.add(ModelYearsData.fromJson(source[item]));
		}
	}

	factory ModelYearsItem.fromJson(Map<String, dynamic> json) {
		return ModelYearsItem(
			source: json
		);
	}
}