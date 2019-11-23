import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_travel/core/bloc/BlocProvider.dart';
import 'package:flutter_travel/pages/common/CommonLoading.dart';
import 'package:flutter_travel/pages/common/CommonTravelItem.dart';
import 'package:flutter_travel/pages/modules/circler/blocs/CirclerBlocDetail.dart';
import 'package:flutter_travel/pages/modules/circler/models/CirclerModelDetail.dart';
import 'package:flutter_travel/pages/modules/circler/models/CirclerModelNewsItem.dart';
import 'package:flutter_travel/redux/states/StateGlobal.dart';

/// 资讯详情页
class CircleDetailPage extends StatefulWidget {
	
	final dynamic requestParams;
  	CircleDetailPage({ Key key, @required this.requestParams}) : super(key: key);

	_CircleDetailPageState createState() => _CircleDetailPageState(this.requestParams);
}

class _CircleDetailPageState extends State<CircleDetailPage> {
  
	dynamic _requestParms;

	_CircleDetailPageState(dynamic requestParams): super() {
		this._requestParms = requestParams;
	}

	@override
	Widget build(BuildContext context) {

		return Scaffold(
			appBar: AppBar(
				title: Center(child: this.getSearchTitle()),
				elevation: 0.0,
				backgroundColor: Colors.white,
			),
			body: BlocProvider(
				bloc: CirclerBlocDetail(),
				child: CirclerDetailContentPage(requestParams: this._requestParms),
			),
		);
	}

	/// Redux数据调用: 绑定全局动态标题
	Widget getSearchTitle() {
		return StoreConnector<StateGlobal, int>(
			converter: (store) => store.state.count,
			builder: (context, count) {
				return Text('Materials - 60 Minutes ${count.toString()}',
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

/// 详情页显示内容
class CirclerDetailContentPage extends StatefulWidget {
	
	final dynamic requestParams;
  	CirclerDetailContentPage({ Key key, @required this.requestParams}) : super(key: key);

	_CirclerDetailContentPageState createState() => _CirclerDetailContentPageState(this.requestParams);
}

class _CirclerDetailContentPageState extends State<CirclerDetailContentPage> with CommonTravelItem {
  
	CirclerBlocDetail blocDetailInfo;
	GlobalKey<RefreshIndicatorState> refreshKey = GlobalKey<RefreshIndicatorState>();
	dynamic _requestParms;

	_CirclerDetailContentPageState(dynamic requestParams): super() {
		this._requestParms = requestParams;
	}

	@override
	Widget build(BuildContext context) {
		// 连接数据源
		this.blocDetailInfo = BlocProvider.of<CirclerBlocDetail>(context);
		this.blocDetailInfo.updateParams(this._requestParms);

		// 连接视图，下拉刷新
		return RefreshIndicator(
			key: this.refreshKey,
			color: Colors.grey.withOpacity(0.5),
			child: this.getStreamBuilder(context),
			onRefresh: this.refreshData,
		);
	}

	Future<Null> refreshData() async {
		await this.blocDetailInfo.update();
	}

	/// 连接stream数据源
	Widget getStreamBuilder(BuildContext context) {
		return StreamBuilder<CirclerModelDetail>(
			stream: this.blocDetailInfo.outStream,
			builder: (context, snapshot) {
				// 数据源到位时渲染列表
				if (snapshot.hasData) {
					return this.buildLayout(snapshot);
				} else {
					return this.buildEmptyLayout(context);
				}
			}
		);
	}

	/// 空数据结构提示
	Widget buildEmptyLayout(BuildContext context) {
		return new CommonLoading();
	}

	/// 构建外观
	Widget buildLayout(AsyncSnapshot<CirclerModelDetail> snapshot) {
		List<CirclerModelNewsItem> snapshotList = snapshot.data.news;
		int count = snapshotList.length;
		List<CirclerModelNewsItem> coverList = [];
		List<CirclerModelNewsItem> experienceList = [];
		List<CirclerModelNewsItem> newsLetter = [];

		List<Widget> renderList = [
			// 封面
			// CirclerCover(),

			// 搜索条
			Text('test'),
		];

		return ListView(
			padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
			children: renderList,
		);
	}
}