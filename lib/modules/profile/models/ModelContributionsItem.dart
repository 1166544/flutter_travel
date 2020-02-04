
import 'package:flutter_travel/modules/profile/models/ModelContributionsData.dart';
import 'package:flutter_travel/modules/profile/models/ModelRange.dart';

/// 基础贡献值数据
class ModelContributionsItem {

	List<ModelContributionsYear> list = [];
	String year;
	int total;
	ModelRange range;
	ModelContributionsItem thisYearData;


	ModelContributionsItem({Map<String, dynamic> source}) {
		for (var item in source.keys) {
			switch(item) {
				case 'year':
					this.year = source['year'] as String;
				break;
				case 'total':
					this.total = source['total'] as int;
				break;
				case 'range':
					this.range = ModelRange.fromJson(source['range']);
				break;
				case 'contributions':
					this.thisYearData = ModelContributionsItem.fromJson(source[item]);
					this.list.add(this.thisYearData.list[0]);
				break;
				default:
					this.list.add(ModelContributionsYear.fromJson(source[item], item));
			}
		}
	}

	factory ModelContributionsItem.fromJson(Map<String, dynamic> json) {
		return ModelContributionsItem(
			source: json
		);
	}
}