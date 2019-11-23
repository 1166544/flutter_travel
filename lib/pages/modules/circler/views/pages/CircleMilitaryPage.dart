import 'package:flutter/material.dart';
import 'package:flutter_travel/pages/modules/circler/views/pages/CirclerDisplayPage.dart';

/// 军事频道页
class CircleMilitaryPage extends CirclerDisplayPage {

	CircleMilitaryPage({Key key}) : super(key: key, requestParams: {
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