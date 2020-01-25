import 'package:flutter/material.dart';
import 'package:flutter_travel/modules/common/CommonNavigator.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// 搜索结果详情WEBVIEW
class PageSearchDetail extends StatefulWidget {
	final String url;
	final String title = 'Search Detail';

	PageSearchDetail({Key key, this.url}) : super(key: key);

	_PageSearchDetailState createState() => _PageSearchDetailState();
}

class _PageSearchDetailState extends State<PageSearchDetail> with CommonNavigator {
	
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