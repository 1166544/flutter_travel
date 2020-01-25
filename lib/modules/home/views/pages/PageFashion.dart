import 'package:flutter/material.dart';
import 'package:flutter_travel/modules/home/views/pages/PageDisplay.dart';

/// 本地频道页
class PageFashion extends PageDisplay {

	PageFashion({Key key}) : super(key: key, requestParams: {
			'form': 'news_webapp',
			'pd': 'webapp',
			'os': 'iphone',
			'ver': 6,
			'category_name': '时尚',
			'category_id': '',
			'action': 0
		}
	);
}