import 'package:flutter/material.dart';
import 'package:flutter_travel/pages/modules/circler/views/pages/CirclerDisplayPage.dart';

/// 本地频道页
class CircleFashionPage extends CirclerDisplayPage {

	CircleFashionPage({Key key}) : super(key: key, requestParams: {
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