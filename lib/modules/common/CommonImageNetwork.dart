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
	}

	static Widget getNetworkImage(url, {Map<String, String> headers, BoxFit fit}) {
		Image image = Image.network(
			url, 
			headers: 
			headers, 
			fit: fit,
			loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent loadingProgress) {
				if (loadingProgress == null)
				return child;
				return Center(
				child: CircularProgressIndicator(
					strokeWidth: 1,
					backgroundColor: Colors.grey.withOpacity(0.3),
					valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
					value: loadingProgress.expectedTotalBytes != null
						? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes
						: null,
				),
				);
			},
		);
		ImageStream stream = image.image.resolve(ImageConfiguration.empty);
		stream.addListener(ImageStreamListener((ImageInfo info, bool success){
			// hole
		}, onError: (dynamic exception, StackTrace stackTrace) async* {
			print('enter onError start');
			print(exception);
			print(stackTrace);
			print('enter onError end');
			image = Image.asset('assets/images/chatbubble.png');
		}));

		return image;
	}
}