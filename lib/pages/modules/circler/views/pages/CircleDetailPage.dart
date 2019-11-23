import 'package:flutter/material.dart';
import 'package:flutter_travel/core/bloc/BlocProvider.dart';
import 'package:flutter_travel/pages/common/CommonLoading.dart';
import 'package:flutter_travel/pages/common/CommonTimeFormate.dart';
import 'package:flutter_travel/pages/common/CommonTravelItem.dart';
import 'package:flutter_travel/pages/modules/circler/blocs/CirclerBlocDetail.dart';
import 'package:flutter_travel/pages/modules/circler/models/CirclerModelContent.dart';
import 'package:flutter_travel/pages/modules/circler/models/CirclerModelDetail.dart';
import 'package:flutter_travel/pages/modules/circler/models/CirclerModelNewsItem.dart';

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
				title: Text('新闻详情',
					style: TextStyle(
					color: Colors.black,
					fontWeight: FontWeight.bold,
					fontSize: 15.0
					)
				),
				elevation: 0.0,
				backgroundColor: Colors.white,
			),
			body: BlocProvider(
				bloc: CirclerBlocDetail(),
				child: CirclerDetailContentPage(requestParams: this._requestParms),
			),
		);
	}
}

/// 详情页显示内容
class CirclerDetailContentPage extends StatefulWidget {
	
	final dynamic requestParams;
  	CirclerDetailContentPage({ Key key, @required this.requestParams}) : super(key: key);

	_CirclerDetailContentPageState createState() => _CirclerDetailContentPageState(this.requestParams);
}

class _CirclerDetailContentPageState extends State<CirclerDetailContentPage> with CommonTravelItem, CommonTimeFormate {
  
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

		if (snapshotList.length == 0) {
			return this.buildEmptyLayout(null);
		}

		CirclerModelNewsItem contentItem = snapshotList[0];
		List<CirclerModelContent> contentList = contentItem.content;
		int count = contentList.length;

		List<Widget> renderList = [
			// 标题
			this.getCircleTitle(contentItem),
			
			SizedBox(height: 7.0),

			// 副标题
			this.getCircleSubTitle(contentItem),
			
			SizedBox(height: 23.0),
		];

		// 内容
		for (var i = 0; i < count; i++) {
			CirclerModelContent item = contentList[i];
			renderList.add(this.getCircleContent(item));
		}

		// 留言
		// Text('test');

		return ListView(
			padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
			children: renderList,
		);
	}

	/// 标题
	Widget getCircleTitle(CirclerModelNewsItem contentItem) {
		return Text(
			contentItem.title, 
			style: TextStyle(
				fontSize: 20.0, 
				color: Colors.black, 
				fontWeight: FontWeight.bold
			)
		);
	}

	/// 副标题
	Widget getCircleSubTitle(CirclerModelNewsItem contentItem) {
		return Row(
			children: <Widget>[
				Text(
					contentItem.site, 
					style: TextStyle(
						fontSize: 11.0,
						color: Colors.grey,
					)
				),
				SizedBox(width: 7.0),
				Text(
					this.getFullTime(contentItem.ts), 
					style: TextStyle(
						fontSize: 10.0,
						color: Colors.grey,
					)
				)
			],
		);
	}

	/// 内容块
	Widget getCircleContent(CirclerModelContent item) {
		if (item.type == 'text') {
			// 渲染文本
			return Padding(
				padding: EdgeInsets.fromLTRB(0, 5.0, 0, 15.0),
				child: Text(item.data.text, style: TextStyle(fontSize: 14.0)),
			);
		} else {
			// 渲染图片
			return Image.network(item.data.original.url);
		}
	}
}