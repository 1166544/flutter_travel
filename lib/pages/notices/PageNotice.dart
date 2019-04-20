import 'package:flutter/material.dart';
import 'package:flutter_travel/common/CommonNavigator.dart';
import 'package:flutter_travel/pages/notices/PageNoticeVO.dart';
import 'package:flutter_travel/pages/notices/PageReadVO.dart';

/// 通知页
class PageNotice extends StatefulWidget {
  final Widget child;

  PageNotice({Key key, this.child}) : super(key: key);

  @override
  _PageNoticeState createState() => _PageNoticeState();
}

class _PageNoticeState extends State<PageNotice> with CommonNavigator {
  @override
  Widget build(BuildContext context) {
	return Scaffold(
		appBar: AppBar(
			backgroundColor: Colors.transparent,
			elevation: 0.0,
			leading: IconButton(
				icon: Icon(Icons.arrow_back_ios),
				color: Colors.black,
				onPressed: () {
					this.navigateBack(context);
				},
			),
			title: Text('Notifications', style: TextStyle(color: Colors.black)),
			centerTitle: true,
		),
		body: ListView(
			children: <Widget>[
				this.buildCoverImage(),
				this.buildAboutTitle(),
				this.buildNotifcationList()
			],
		),
	);
  }

  /// 封面图片
  Widget buildCoverImage() {
	  return Container(
		  width: MediaQuery.of(this.context).size.width,
		  height: 180,
		  decoration: BoxDecoration(
			  image: DecorationImage(
				  image: AssetImage('assets/road.jpg'),
				  fit: BoxFit.cover
			  )
		  ),
		  child: Padding(
			  padding: EdgeInsets.fromLTRB(30.0, 50.0, 30.0, 20.0),
			  child: Column(
				  crossAxisAlignment: CrossAxisAlignment.start,
				  mainAxisAlignment: MainAxisAlignment.end,
				  children: <Widget>[
					  Text(
						'Back to the nature',
						style: TextStyle(
							color: Colors.white,
							fontWeight: FontWeight.bold,
							fontSize: 30.0,
							shadows: [
								Shadow(
									offset: Offset(3.0, 3.0),
									blurRadius: 3.0,
									color: Colors.black.withOpacity(0.8)
								),
							]
						),
					 ),
					  Text(
						'Coming up under the start.',
						style: TextStyle(
							color: Colors.white,
							fontWeight: FontWeight.bold,
							fontSize: 15.0,
							shadows: [
								Shadow(
									offset: Offset(3.0, 3.0),
									blurRadius: 3.0,
									color: Colors.black.withOpacity(0.8)
								),
							]
						),
					 ),
				  ],
			  ),
		  ),
	  );
  }

  /// 副标题
  Widget buildAboutTitle() {
	  return Container(
		  width: MediaQuery.of(this.context).size.width,
		  height: 60.0,
		  decoration: BoxDecoration(
			  color: Colors.white,
			  shape: BoxShape.rectangle,
			  border: Border(bottom: BorderSide(width: 0.5, color: Colors.grey))
		  ),
		  padding: EdgeInsets.fromLTRB(30.0, 0.0, 0.0, 0.0),
		  child: Column(
			  crossAxisAlignment: CrossAxisAlignment.start,
			  mainAxisAlignment: MainAxisAlignment.end,
			  children: <Widget>[
				  Padding(
					  padding: EdgeInsets.only(bottom: 10.0),
					  child: Text('Latest news', style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold)),
				  ),
				  Container(
					  width: 100.0,
					  height: 2.0,
					  decoration: BoxDecoration(
						  color: Colors.black,
						  shape: BoxShape.rectangle
					  ),
				  )
			  ],
		  ),
	  );
  }

  /// 通知列表
  Widget buildNotifcationList() {
	  List<PageNoticeVO> subList = [
		  new PageNoticeVO(subTitle: 'New to Flutter', description: "Bookmark the API reference docs for the Flutter framework."),
		  new PageNoticeVO(subTitle: 'Coming from another platform', description: "Check out: Android, iOS, Web, React Native, Xamarin.Forms"),
		  new PageNoticeVO(subTitle: 'A tour of the Flutter', description: "Bookmark the API reference docs for the Flutter framework."),
		  new PageNoticeVO(subTitle: 'FAQ', description: "Learn how to create layouts in Flutter, where everything is a widget."),
	  ];

	  List<PageReadVO> readList = [
		  new PageReadVO(dateTitle: 'Mon 1, Nov', readList: subList),
		  new PageReadVO(dateTitle: 'Sep 2, Dec', readList: subList),
		  new PageReadVO(dateTitle: 'Sat 20, May', readList: subList),
	  ];

	  List<Widget> readRenderList = [];
	  for (PageReadVO item in readList) {
		  readRenderList.add(
			  this.builRenderReadItem(item)
		  );
	  }
	  return Column(
		  children: readRenderList,
	  );
  }

  /// 构建消息列表项
  /// * [PageReadVO item] 消息体
  Widget builRenderReadItem(PageReadVO item) {

	  List<Widget> readSubRenderList = [];

	  for (PageNoticeVO item in item.readList) {
		readSubRenderList.add(this.buildSubReadRenderItem(item));
	  }

	  return Row(
		  children: <Widget>[
			  Text(item.dateTitle),
			  SizedBox(width: 10.0),
			  Column(
				  children: readSubRenderList
			  )
		  ],
	  );
  }

  /// 消息列表项
  /// * [PageNoticeVO item] 消息数据源
  Widget buildSubReadRenderItem(PageNoticeVO item) {
	  return Column(
		  children: <Widget>[
			    // 带圆圈标题行
				Row(
					children: <Widget>[
						// 圆圈
						Icon(Icons.check_circle_outline, size: 12.0, color: Colors.purple),
						// 子标题
						SizedBox(width: 15.0),
						Text(item.subTitle)
					]
				),
				// 带虚线行
				Row(
					children: <Widget>[
						// 虚线
						Container(
							width: 10.0,
							height: 120.0,
							decoration: BoxDecoration(
								image: DecorationImage(
									image: AssetImage('assets/dot.png'),
									fit: BoxFit.cover
								)
							),
						),
						SizedBox(width: 10.0),
						// 描述文本区
						Column(
							children: <Widget>[
								// 描述文本
								Text(
									item.description,
									softWrap: true,
								),
								SizedBox(height: 10.0),
								// 操作按钮
								Row(
									children: <Widget>[
										Container(
											width: 80.0,
											height: 20.0,
											decoration: BoxDecoration(
												color: Colors.deepOrange,
												shape: BoxShape.rectangle
											),
											child: Center(
												child: Text('Make as readed'),
											),
										),
										SizedBox(width: 10.0),
										Container(
											width: 80.0,
											height: 20.0,
											decoration: BoxDecoration(
												color: Colors.deepOrange,
												shape: BoxShape.rectangle
											),
											child: Center(
												child: Text('DELETE'),
											),
										),
									],
								)
							],
						)
					]
				)
		  ],
	  );
  }

}
