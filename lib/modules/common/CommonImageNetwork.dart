import 'package:flutter/material.dart';

/// 异常图片处理
class CommentImageNetwork {
	factory CommentImageNetwork() => _getInstance();
	static CommentImageNetwork get instance => _getInstance();
	static CommentImageNetwork _instance;
	static CommentImageNetwork _getInstance() {
		if (_instance == null) {
			_instance = new CommentImageNetwork._internal();
		}

		return _instance;
	}

	CommentImageNetwork._internal(): super() {
		// 初始化
		// hole
	}

	/// 加载缓存图片
	static ImageProvider<dynamic> imageNetwork(String url, {Map<String, String> headers}) {
		return NetworkImage(url, headers: headers);
		
		// Image image = Image.network(url, headers: headers);
		// ImageStream stream = image.image.resolve(ImageConfiguration.empty);
		// stream.addListener(ImageStreamListener((ImageInfo info, bool success){
		// 	// hole
		// }, onError: (dynamic exception, StackTrace stackTrace) async* {
		// 	print('enter onError start');
		// 	print(exception);
		// 	print(stackTrace);
		// 	print('enter onError end');
		// 	image = Image.asset('assets/images/chatbubble.png');
		// }));

		// return image.image;
	}
}