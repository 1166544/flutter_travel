import 'package:flutter_travel/modules/home/models/ModelContent.dart';

/// 数据筛选
class ModelSorter {
	static ModelContent getNextItem({List<ModelContent> fullDisplayList, ModelContent currentItem}) {
		ModelContent findedItem;
		int total = fullDisplayList.length;
		for (var i = 0; i < total; i++) {
			ModelContent compareItem = fullDisplayList[i];
			if (compareItem.data.small.url == currentItem.data.small.url) {
				int targetI = i + 1;
				if (targetI < total) {
					findedItem = fullDisplayList[targetI];
				} else {
					// 取第1位
					findedItem = fullDisplayList[0];
				}
			}
		}

		return findedItem;
	}
}