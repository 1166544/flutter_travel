import 'package:flutter/material.dart';
import 'package:flutter_travel/pages/modules/home/views/pages/PageDisplay.dart';

/// 社会频道页
class PageSociality extends PageDisplay {

	PageSociality({Key key}) : super(key: key, requestParams: {
			'from': 'news_webapp',
			'pd': 'webapp',
			'os': 'iphone',
			'ver': 6,
			'category_id': 101,
			'action': 0,
			'wf': 0
		}
	);
}