import 'package:flutter_travel/pages/modules/circler/models/CirclerModelContentData.dart';

class CirclerModelContent {
	CirclerModelContentData data;
	String type;

	void update(dynamic resultData) {
		this.type = resultData['type'];

		if (this.type == 'text') {
			this.data = new CirclerModelContentData();
			this.data.text = resultData['data'];
		} else {
			this.data = new CirclerModelContentData();
			dynamic data = resultData['data'];
			this.data.update(data);
		}
	}
}