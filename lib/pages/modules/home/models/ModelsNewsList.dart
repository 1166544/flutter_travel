import 'package:flutter_travel/pages/modules/home/models/ModelNewsItem.dart';

/// Gallery 数据结构
class ModelsNewsList {

	String name;
	List<ModelNewsItem> news = [];
	bool hasmore;
	int total;

	ModelsNewsList();

	ModelsNewsList.empty() {
		this.name = '';
	}

	/// 更新数据源
	void update(dynamic resultData) {
		dynamic result = resultData.data;
		var errmsg = result['errmsg'];

		if (result != null && errmsg == 'OK') {
			dynamic resultSubData = result['data'];
			this.hasmore = resultSubData['hasmore'];
			this.total = resultSubData['total'];
			dynamic news = resultSubData['news'];
			for(Map item in news) {
				ModelNewsItem itemData = new ModelNewsItem();
				itemData.update(item);
				this.news.add(itemData);
			}
		}
		this.name = 'updated!';
	}
}
