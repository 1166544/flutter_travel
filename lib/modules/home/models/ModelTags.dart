import 'package:flutter_travel/modules/home/models/ModelTagsOwn.dart';

class ModelTags {
	//  = {own = [{type = 3, name = "重复、旧闻"}, {type = 4, name = "低俗内容"}], tag = []}
	List<ModelTagsOwn> own = [];
	
	List<dynamic> tag;

	void update(dynamic resultData) {
		if (resultData != null) {
			for(Map item in resultData['own']) {
				ModelTagsOwn itemData = new ModelTagsOwn();
				itemData.update(item);
				this.own.add(itemData);
			}

			this.tag = resultData['tag'];
		}
	}
}
