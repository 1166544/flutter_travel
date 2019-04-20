import 'package:flutter/material.dart';

class CommonNavigator {

	/// 页面跳转
	///  * [BuildContext context] 原始页面对像
	///  * [Widget pageContent] 跳转页面对像
	navigateTo(BuildContext context, Widget pageContent) {
		Navigator.push(context,
			MaterialPageRoute(
				builder: (context) {
					return pageContent;
				}
			)
		);
	}
}
