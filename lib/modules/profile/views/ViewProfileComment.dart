import 'package:flutter/material.dart';

/// 公用方法
class ViewProfileComment {

  	/// 带黄底横线标题
	Widget getUnderlineText(String content) {
		return Text(
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