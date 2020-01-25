import 'package:flutter/material.dart';
import 'package:flutter_travel/modules/home/views/pages/PageDisplay.dart';

/// 军事频道页
class PageMilitary extends PageDisplay {

	PageMilitary({Key key}) : super(key: key, requestParams: {
			'form': 'news_webapp',
			'pd': 'webapp',
			'os': 'iphone',
			'ver': 6,
			'category_name': '军事',
			'category_id': '',
			'action': 0
		}
	);
}