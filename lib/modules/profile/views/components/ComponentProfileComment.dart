import 'package:flutter/material.dart';
import 'package:flutter_travel/modules/common/CommonText.dart';

/// 公用方法
class ComponentProfileComment {

  	/// 带黄底横线标题
	Widget getUnderlineText(String content) {
		return CommonText(
			content,
			style: TextStyle(
				fontSize: 16.0,
				color: Color(0xFF252949),
				decorationColor: Color(0xffffefdb),
				decorationThickness: 4.0,
				fontWeight: FontWeight.bold,
				decoration: TextDecoration.underline
			)
		);
	}
	
}