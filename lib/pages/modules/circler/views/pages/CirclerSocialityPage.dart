import 'package:flutter/material.dart';
import 'package:flutter_travel/pages/modules/circler/views/pages/CirclerDisplayPage.dart';

/// 社会频道页
class CirclerSocialityPage extends CirclerDisplayPage {

	CirclerSocialityPage({Key key}) : super(key: key, requestParams: {
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