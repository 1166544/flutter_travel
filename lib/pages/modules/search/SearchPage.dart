import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_travel/core/bloc/BlocProvider.dart';
import 'package:flutter_travel/pages/modules/search/blocs/SearchBlocGalleryList.dart';
import 'package:flutter_travel/pages/modules/search/views/SearchContentView.dart';
import 'package:flutter_travel/redux/states/StateGlobal.dart';

/// 搜索页
class SearchPage extends StatefulWidget {
  final Widget child;

  SearchPage({Key key, this.child}) : super(key: key);

  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
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
			bloc: BlocGalleryList(),
			child: ViewSearchContent(),
		)
	);
  }

  /// Redux数据调用: 绑定全局动态标题
  Widget getSearchTitle() {
    return StoreConnector<StateGlobal, int>(
        converter: (store) => store.state.count,
        builder: (context, count) {
          	return Text('Maldives - 12 Days ${count.toString()}',
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
