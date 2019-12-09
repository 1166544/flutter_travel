import 'package:flutter/material.dart';
import 'package:flutter_travel/pages/common/CommonNavigator.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// 搜索结果详情WEBVIEW
class CirclerSearchDetailPage extends StatefulWidget {
	final String url;
	final String title = 'Search Detail';

	CirclerSearchDetailPage({Key key, this.url}) : super(key: key);

	_CirclerSearchDetailPageState createState() => _CirclerSearchDetailPageState();
}

class _CirclerSearchDetailPageState extends State<CirclerSearchDetailPage> with CommonNavigator {
	
	@override
	void initState() {
		super.initState();
	}

	@override
	void dispose() {
		super.dispose();
	}
	
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text(widget.title),
			),
			body: Container(
				child: WebView(
					initialUrl: widget.url,
					onWebViewCreated: (WebViewController controller) {
						// controller.loadUrl(widget.url);
						controller.canGoBack().then((res) {
							print(res);
							this.navigateBack(context);
						});
						controller.currentUrl().then((url) {
							print(url);
						});
						controller.canGoForward().then((res) {
							print(res);
						});
					},
					onPageFinished: (String value) {
						// on webview inited
					},
				),
			),
		);
	}
}