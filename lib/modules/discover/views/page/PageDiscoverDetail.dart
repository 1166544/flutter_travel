import 'package:flutter/material.dart';
import 'package:flutter_travel/modules/common/CommonImageNetwork.dart';
import 'package:flutter_travel/modules/common/CommonNavigator.dart';
import 'package:flutter_travel/modules/home/models/ModelNewsItem.dart';
import 'package:flutter_travel/services/ServiceApiOpen.dart';

class PageDiscoverDetail extends StatefulWidget {
	final Widget child;
	final ModelNewsItem item;

	PageDiscoverDetail({Key key, this.child, this.item}) : super(key: key);

	_PageDiscoverDetailState createState() => _PageDiscoverDetailState();
}

/// 详情页
class _PageDiscoverDetailState extends State<PageDiscoverDetail> with CommonNavigator {

	ServiceApiOpen serviceApiOpen;
	String coverUrl = 'https://t10.baidu.com/it/u=952691838,387326037&fm=173&app=25&f=JPEG?w=480&h=360&s=BE915581FEDB3ED046BDE99403009093';

	_PageDiscoverDetailState() {
		// this.serviceApiOpen = new ServiceApiOpen();
	}

	@override
	void initState() {
		super.initState();
		// 调用数据
		// this.serviceApiOpen.getJournalismData().then((onValue) {
		// 	print(onValue);
		// });
		// print(await this.serviceApiOpen.getJournalismData());
	}

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
					Navigator.of(context).pop();
					},
				),
				actions: <Widget>[
					IconButton(icon: Icon(Icons.more_vert), onPressed: () {})
				],
			),
			body: ListView(
			children: <Widget>[
				Column(
				mainAxisAlignment: MainAxisAlignment.start,
				crossAxisAlignment: CrossAxisAlignment.start,
				children: <Widget>[
					this.buildCover(),
					this.buildTitle('Zofia Kowalski', 'Architect'),
					this.buildScrollList(),
					// this.buildScrollTile(),
					this.buildBottomText('Monsister de Monterrat, Span', '23:11 - 30 11.2322')
				],
				)
			],
			),
		);
  	}

	Widget buildBottomText(String descTitle, String dateTitle) {
		return Padding(
			padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
			child: Column(
				mainAxisAlignment: MainAxisAlignment.start,
				crossAxisAlignment: CrossAxisAlignment.start,
				children: [
					Container(
						height: 1,
						decoration: BoxDecoration(
							color: Colors.black.withOpacity(0.3),
							shape: BoxShape.rectangle
						),
					),
					SizedBox(height: 15),
					Text(descTitle, style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal, color: Colors.black)),
					SizedBox(height: 5),
					Row(
						children: [
							Icon(Icons.brightness_4, size: 10, color: Colors.grey),
							Text(dateTitle, style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.grey))
						]
					),
				]
			),
		);
	}

	/// 横向选择列表
	Widget buildScrollList() {
		return Padding(
			padding: EdgeInsets.fromLTRB(5, 0, 5, 20),
			child: Row(
				mainAxisAlignment: MainAxisAlignment.spaceAround,
				children: [
					this.buildCoverSlectItem(),
					this.buildCoverSlectItem(),
					this.buildCoverSlectItem(),
					this.buildCoverSlectItem(),
					this.buildCoverSlectItem(),
				]
			)
		);
	}

	/// 横向排列图片
	Widget buildCoverSlectItem() {
		return Container(
			width: 60.0,
			height: 60.0,
			child: ClipRRect(
				borderRadius: BorderRadius.circular(8),
				child: CommentImageNetwork.getNetworkImage(this.coverUrl, headers: this.getCrossHeaders(), fit: BoxFit.cover)
			),
		);
	}

	Widget buildScrollTile() {
		return Text('');
	}

	/// 标题
	Widget buildTitle(String title, String desc) {
		return Padding(
			padding: EdgeInsets.fromLTRB(15, 25, 10, 20),
			child: Column(
				crossAxisAlignment: CrossAxisAlignment.start,
				children: <Widget>[
					Text(title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black)),
					SizedBox(height: 10),
					Text(desc, style: TextStyle(fontSize: 13, fontWeight: FontWeight.normal, color: Colors.grey)),
				],
			)
		);
	}

	/// 封面
	Widget buildCover() {
		return Container(
			width: MediaQuery.of(context).size.width,
			height: MediaQuery.of(context).size.height * 0.57,
			decoration: BoxDecoration(
				image: DecorationImage(
					image: CommentImageNetwork.imageNetwork(this.coverUrl, headers: this.getCrossHeaders()), 
					fit: BoxFit.cover,
				)
			),
			child: Container(
				decoration: BoxDecoration(
					gradient: LinearGradient(
						begin: Alignment.topCenter,
						end: Alignment.bottomCenter,
						stops: [0.7, 1],
						colors: [
							Colors.black.withOpacity(0.0),
							Colors.black.withOpacity(1),
						],
					),
				),
				child: Column(
					children: [
						Spacer(),
						Padding(
							padding: EdgeInsets.fromLTRB(35, 0, 35, 15),
							child: Row(
								mainAxisAlignment: MainAxisAlignment.spaceBetween,
								children: <Widget>[
									this.getCoverItem(71, 'Posts'),
									this.getCoverItem(429, 'Followers'),
									this.getCoverItem(1234, 'Following'),
								]
							),
						)
					]
				),
			)
		);
	}

	Widget getCoverItem(int value, String title) {
		return Column(
			children: <Widget>[
				Text(value.toString(), style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white)),
				SizedBox(height: 5),
				Text(title, style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.white)),
			],
		);
	}

}
