import 'package:flutter/material.dart';
import 'package:flutter_travel/core/bloc/BlocProvider.dart';
import 'package:flutter_travel/pages/common/CommonLoading.dart';
import 'package:flutter_travel/pages/common/CommonNavigator.dart';
import 'package:flutter_travel/pages/common/CommonTimeFormate.dart';
import 'package:flutter_travel/pages/common/CommonTravelItem.dart';
import 'package:flutter_travel/pages/modules/circler/blocs/CirclerBlocDetail.dart';
import 'package:flutter_travel/pages/modules/circler/models/CirclerModelCommentCount.dart';
import 'package:flutter_travel/pages/modules/circler/models/CirclerModelContent.dart';
import 'package:flutter_travel/pages/modules/circler/models/CirclerModelNewsItem.dart';
import 'package:flutter_travel/pages/modules/circler/models/CirclerModelPageData.dart';
import 'package:flutter_travel/pages/modules/comments/CommentsPage.dart';

/// 资讯详情页
class CircleDetailPage extends StatefulWidget {
	
	final dynamic requestParams;
  	CircleDetailPage({ Key key, @required this.requestParams}) : super(key: key);

	_CircleDetailPageState createState() => _CircleDetailPageState();
}

class _CircleDetailPageState extends State<CircleDetailPage> with CommonNavigator {

	_CircleDetailPageState(): super();

	@override
	Widget build(BuildContext context) {

		return Scaffold(
			appBar: AppBar(
				title: Text('新闻详情',
					style: TextStyle(
					color: Colors.black,
					fontWeight: FontWeight.bold,
					fontSize: 18.0
					)
				),
				leading: IconButton(
					icon: Icon(Icons.arrow_back_ios),
					color: Colors.black.withOpacity(0.8),
					onPressed: (){
						this.navigateBack(context);
					},
				),
				brightness: Brightness.light,
				centerTitle: true,
				elevation: 0.0,
				backgroundColor: Colors.grey.withOpacity(0.2)
			),
			body: BlocProvider(
				bloc: CirclerBlocDetail(),
				child: CirclerDetailContentPage(requestParams: widget.requestParams),
			),
		);
	}
}

/// 详情页显示内容
class CirclerDetailContentPage extends StatefulWidget {
	
	final dynamic requestParams;
  	CirclerDetailContentPage({ Key key, @required this.requestParams}) : super(key: key);

	_CirclerDetailContentPageState createState() => _CirclerDetailContentPageState();
}

class _CirclerDetailContentPageState extends State<CirclerDetailContentPage> with CommonTravelItem, CommonTimeFormate, CommonNavigator {
  
	CirclerBlocDetail blocDetailInfo;
 
	_CirclerDetailContentPageState(): super();

	@override
	Widget build(BuildContext context) {
		// 连接数据源
		this.blocDetailInfo = BlocProvider.of<CirclerBlocDetail>(context);
		this.blocDetailInfo.updateParams(widget.requestParams);

		// 连接视图，下拉刷新
		return this.getStreamBuilder(context);
	}

	@override
	void dispose() {
		super.dispose();
		this.blocDetailInfo.dispose();
	}

	/// 连接stream数据源
	Widget getStreamBuilder(BuildContext context) {
		return StreamBuilder<CirclerModelPageData>(
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
	Widget buildLayout(AsyncSnapshot<CirclerModelPageData> snapshot) {
		List<CirclerModelNewsItem> snapshotList = snapshot.data.detailInfo.news;
		CirclerModelCommentCount snapshotComment = snapshot.data.commentInfo;

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
		renderList.add(
			this.getCircleCommentBar(snapshotComment)
		);

		return ListView(
			padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
			children: renderList,
		);
	}

	/// 标题
	Widget getCircleTitle(CirclerModelNewsItem contentItem) {
		return Text(
			contentItem.title, 
			style: TextStyle(
				fontSize: 21.0, 
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
				padding: EdgeInsets.fromLTRB(0, 8.0, 0, 18.0),
				child: Text(item.data.text, style: TextStyle(fontSize: 14.0)),
			);
		} else {
			// 渲染图片
			return Image.network(item.data.original.url);
		}
	}

	/// 留言数量条
	Widget getCircleCommentBar(CirclerModelCommentCount snapshotComment) {
		return Padding(
				padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 20.0),
				child: Row(
					children: <Widget>[
						Expanded(
							flex: 8,
							child: TextField(
								textAlign: TextAlign.left,
								style: TextStyle(fontSize: 12.0, color: Colors.black),
								decoration: InputDecoration(
									fillColor: Color(0xFFe4e9f5),
									filled: true,
									labelText: snapshotComment.data.comment > 0 ? '共有 ${snapshotComment.data.comment} 条留言' : '',
									labelStyle: TextStyle(color: Colors.grey, fontSize: 15.0),
									prefixIcon: Container(
										child: Icon(Icons.comment, color: Colors.black.withOpacity(0.6), size: 26.0),
									),
									suffixText: 'Enter comment words',
									border: InputBorder.none,
								),
								onChanged: (text) {
									print('change $text');
								},
								onSubmitted: (text) {
									print('submit $text');
								}
							)
						),
						this.getJumpToNextButton(snapshotComment.data.comment),
				],
			),
		);
	}

	/// 跳转到留言页
	Widget getJumpToNextButton(int commentLength) {
		return Expanded(
			child: IconButton(
				icon:Icon(Icons.airplay),
				color: Colors.black,
				iconSize: 30.0,
				onPressed: (){
					if (commentLength > 0) {
						this.navigateTo(context, new CommentsPage(requestParams: widget.requestParams));
					}
				}
			),
		);
	}
	
}