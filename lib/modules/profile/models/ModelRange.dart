
class ModelRange {

	String start;
	String end;

	ModelRange({this.start, this.end});

	factory ModelRange.fromJson(Map<String, dynamic> json) {
		return ModelRange(
			start: json['start'],
			end: json['end'],
		);
	}
}