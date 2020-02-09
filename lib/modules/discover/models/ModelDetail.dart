import 'package:flutter_travel/modules/home/models/ModelContent.dart';

/// 详情页数据加工
class ModelDiscoverDetail {

	/// 筛选业务需要的显示数据
	List<ModelContent> getDisplayList(List<ModelContent> contentList, {int size = -1}) {
		List<ModelContent> sortedList = [];

		if (contentList != null && contentList.length > 0) {
			for (var i = 0; i < contentList.length; i++) {
				ModelContent item = contentList[i];

				if (item.type == 'image') {
					if (size == -1) {
						// 全部添加
						sortedList.add(item);
					} else {
						// 部份添加
						if (sortedList.length < size) {
							sortedList.add(item);
						}
					}
				}
			}
		}

		return sortedList;
	}

}