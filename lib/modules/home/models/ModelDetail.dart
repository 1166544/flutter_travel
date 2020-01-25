import 'dart:convert';

import 'package:flutter_travel/modules/home/models/ModelNewsItem.dart';

/// 文章详情数据结构
class ModelDetail {

	String name;
	List<ModelNewsItem> news = [];
	bool hasmore;
	int total;

	ModelDetail();

	ModelDetail.empty() {
		this.name = '';
	}

	/// 更新数据源
	void update(dynamic resultData) {
		dynamic resulDataStr = resultData.data;
		dynamic result = json.decode(resulDataStr);
		var errmsg = result['errno'];

		if (result != null && errmsg == 0) {
			dynamic resultSubData = result['data'];
			dynamic news = resultSubData['news'];
			
			if (news != null) {
				for(Map item in news) {
					ModelNewsItem itemData = new ModelNewsItem();
					itemData.update(item);
					this.news.add(itemData);
				}
			}
		}
		this.name = 'updated!';
	}
}
