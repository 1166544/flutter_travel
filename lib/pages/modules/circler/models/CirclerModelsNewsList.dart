import 'package:flutter_travel/pages/modules/circler/models/CirclerModelNewsItem.dart';

/// Gallery 数据结构
class CirclerModelsNewsList {

	String name;
	List<CirclerModelNewsItem> news = [];
	bool hasmore;
	int total;

	CirclerModelsNewsList();

	CirclerModelsNewsList.empty() {
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
				CirclerModelNewsItem itemData = new CirclerModelNewsItem();
				itemData.update(item);
				this.news.add(itemData);
			}
		}
		this.name = 'updated!';
	}
}
