import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_travel/core/bloc/BlocProvider.dart';
import 'package:flutter_travel/modules/discover/views/ViewDiscoverContent.dart';
import 'package:flutter_travel/modules/home/blocs/BlocNewsList.dart';
import 'package:flutter_travel/redux/states/StateApp.dart';

/// Discover页
class DiscoverPage extends StatefulWidget {
  final Widget child;

  DiscoverPage({Key key, this.child}) : super(key: key);

  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<DiscoverPage> {
	bool get wantKeepAlive => null;

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Center(
				child: this.getSearchTitle(),
				),
				elevation: 0.0,
				backgroundColor: Colors.white
			),
			body: BlocProvider(
				bloc: BlocNewsList(),
				child: ViewDiscoverContent(),
			)
		);
	}

	/// Redux数据调用: 绑定全局动态标题
	Widget getSearchTitle() {
		return StoreConnector<AppState, dynamic>(
			converter: (store) => store.state.auth,
			builder: (context, auth) {
				return Text('影像图志',
					style: TextStyle(
						color: Colors.black,
						fontWeight: FontWeight.bold,
						fontSize: 20.0
					)
				);
			}
		);
	}

}
