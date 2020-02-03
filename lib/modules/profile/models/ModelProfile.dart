import 'package:flutter_travel/modules/profile/models/ModelContributionsItem.dart';
import 'package:flutter_travel/modules/profile/models/ModelYearsItem.dart';

/// GITHUB贡献值 数据结构
class ModelProfile {

	ModelYearsItem years;
	ModelContributionsItem contributions;

	ModelProfile({this.years, this.contributions});

	factory ModelProfile.fromJson(Map<String, dynamic> json) {
		return ModelProfile(
			years: ModelYearsItem.fromJson(json['years']),
			contributions: ModelContributionsItem.fromJson(json['contributions'])
		);
	}
}