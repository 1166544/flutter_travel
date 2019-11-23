import 'package:flutter_travel/pages/modules/circler/models/CirclerModelTagsOwn.dart';

class CirclerModelTags {
	//  = {own = [{type = 3, name = "重复、旧闻"}, {type = 4, name = "低俗内容"}], tag = []}
	List<CirclerModelTagsOwn> own = [];
	
	List<dynamic> tag;

	void update(dynamic resultData) {
		if (resultData != null) {
			for(Map item in resultData['own']) {
				CirclerModelTagsOwn itemData = new CirclerModelTagsOwn();
				itemData.update(item);
				this.own.add(itemData);
			}

			this.tag = resultData['tag'];
		}
	}
}
