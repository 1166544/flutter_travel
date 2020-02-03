
/// 年贡献数据
class ModelContributionsYear {

	String label;
	List<ModelContributionsMonthData> list = [];

	ModelContributionsYear({Map<String, dynamic> source, this.label}) {
		for (var item in source.keys) {
			this.list.add(ModelContributionsMonthData.fromJson(source[item], item));
		}
	}

	factory ModelContributionsYear.fromJson(Map<String, dynamic> json, String key) {
		return ModelContributionsYear(
			source: json,
			label: key,
		);
	}
}

/// 月贡献数据
class ModelContributionsMonthData {

	String label;
	List<ModelContributionsDayData> list = [];

	ModelContributionsMonthData({Map<String, dynamic> source, this.label}) {
		for (var item in source.keys) {
			this.list.add(ModelContributionsDayData.fromJson(source[item], item));
		}
	}

	factory ModelContributionsMonthData.fromJson(Map<String, dynamic> json, String key) {
		return ModelContributionsMonthData(
			label: key,
			source: json,
		);
	}
}

/// 日贡献数据
class ModelContributionsDayData {

	/// 一月中日期序号
	String indexDay;

	/// 日期
	String date;

	/// 提交数
	int count;

	/// 颜色标识
	String color;

	/// 强度
	int intensity;

	ModelContributionsDayData({this.date, this.color, this.count, this.intensity, this.indexDay});

	factory ModelContributionsDayData.fromJson(Map<String, dynamic> json, String key) {
		return ModelContributionsDayData(
			date: json['date'] as String,
			color: json['color'] as String,
			count: json['count'] as int,
			intensity: json['intensity'] as int,
			indexDay: key,
		);
	}
}