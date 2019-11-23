import 'package:flutter/material.dart';
import 'package:flutter_travel/pages/modules/circler/views/pages/CirclerDisplayPage.dart';

/// 国际频道页
class CirclerGlobalPage extends CirclerDisplayPage {

	CirclerGlobalPage({Key key}) : super(key: key, requestParams: {
			'form': 'news_webapp',
			'pd': 'webapp',
			'os': 'iphone',
			'ver': 6,
			'category_name': '国际',
			'category_id': '',
			'action': 1
		}
	);
}