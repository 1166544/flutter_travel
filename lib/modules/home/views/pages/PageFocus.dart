import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_travel/core/CoreApp.dart';
import 'package:flutter_travel/modules/home/models/ModelsNewsList.dart';
import 'package:flutter_travel/modules/home/views/pages/PageDisplay.dart';
import 'package:flutter_travel/routers/Routers.dart';

/// 头条页
class PageFocus extends PageDisplay {

	PageFocus({Key key}) : super(key: key, requestParams: {
			'from': 'news_webapp',
			'pd': 'webapp',
			'os': 'iphone',
			'ver': 6,
			'category_id': 101,
			'action': 0,
			'wf': 0
		}
	);

	PageFocusState createState() => PageFocusState();
}

/// 头条页内容实现
class PageFocusState extends PageDisplayState {
	
	final MethodChannel platform = MethodChannel('crossingthestreams.io/resourceResolver');

	@override
	void initState() {
		super.initState();
		didReceiveLocalNotificationSubject.stream.listen((ReceivedNotification receivedNotification) async {
			await showDialog(
				context: context,
				builder: (BuildContext context) => CupertinoAlertDialog(
				title: receivedNotification.title != null
					? Text(receivedNotification.title)
					: null,
				content: receivedNotification.body != null
					? Text(receivedNotification.body)
					: null,
				actions: [
					CupertinoDialogAction(
					isDefaultAction: true,
					child: Text('Ok'),
					onPressed: () async {
						Navigator.of(context, rootNavigator: true).pop();
						await Navigator.of(context).pushNamedAndRemoveUntil(Routers.profilePage, (_) => false);
					},
					)
				],
				),
			);
		});
		selectNotificationSubject.stream.listen((String payload) async {
			await Navigator.of(context).pushNamedAndRemoveUntil(Routers.profilePage, (_) => false);
		});
	}

	@override
	void dispose() {
		didReceiveLocalNotificationSubject.close();
		selectNotificationSubject.close();
		super.dispose();
	}

	/// 连接stream数据源
	Widget getStreamBuilder(BuildContext context) {
		return StreamBuilder<ModelsNewsList>(
			stream: this.blocGalleryList.outGallery,
			builder: (context, snapshot) {
				// 数据源到位时渲染列表
				if (snapshot.hasData) {
					// 已初始化标记,在第1次收到数据之后设置
					this.isInited = true;
					return this.buildLayout(snapshot);
				} else {
					return this.buildEmptyLayout(context);
				}
			}
		);
	}

}
