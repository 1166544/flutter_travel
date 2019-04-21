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

	/// 返回上一页面
	/// * [BuildContext context] 原始页面对像
	navigateBack(BuildContext context) {
		Navigator.of(context).pop();
	}

	/// 获取公共头部
	/// * [BuildContext context] 上下文对像
	/// * [String title] APPBAR 标题
	Widget getAppBar(BuildContext context, String title) {
		return AppBar(
		backgroundColor: Colors.white,
		elevation: 0.3,
		leading: IconButton(
			icon: Icon(Icons.arrow_back_ios),
			color: Colors.black,
			onPressed: () {
			this.navigateBack(context);
			},
		),
		title: Text(title, style: TextStyle(color: Colors.black)),
		centerTitle: true,
		);
	}
}
