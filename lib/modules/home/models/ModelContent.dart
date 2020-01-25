import 'package:flutter_travel/modules/home/models/ModelContentData.dart';

class ModelContent {
	ModelContentData data;
	String type;

	void update(dynamic resultData) {
		this.type = resultData['type'];

		if (this.type == 'text') {
			this.data = new ModelContentData();
			this.data.text = resultData['data'];
		} else {
			this.data = new ModelContentData();
			dynamic data = resultData['data'];
			this.data.update(data);
		}
	}
}