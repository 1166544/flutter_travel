import 'package:flutter/material.dart';
import 'package:flutter_travel/pages/modules/circler/views/CirclerDisplayPage.dart';

/// 本地频道页
class CircleLocalPage extends CirclerDisplayPage {

	CircleLocalPage({Key key}) : super(key: key, requestParams: {
			'loc': 0,
			'from': 'news_webapp',
			'pd': 'webapp',
			'os': 'iphone',
			'ver': 6,
			'category_id': 102,
			'action': 1,
			'wf': 0,
		}
	);
}