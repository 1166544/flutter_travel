import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_travel/modules/common/CommonImageNetwork.dart';
import 'package:flutter_travel/modules/common/CommonNavigator.dart';
import 'package:flutter_travel/modules/common/CommonTimeFormate.dart';
import 'package:flutter_travel/modules/home/models/ModelNewsItem.dart';
import 'package:flutter_travel/modules/utils/Utils.dart';
import 'package:flutter_travel/services/ServiceApiOpen.dart';

class PageDiscoverDetail extends StatefulWidget {
	final Widget child;
	final ModelNewsItem item;

	PageDiscoverDetail({Key key, this.child, this.item}) : super(key: key);

	_PageDiscoverDetailState createState() => _PageDiscoverDetailState();
}

/// 详情页
class _PageDiscoverDetailState extends State<PageDiscoverDetail> with CommonNavigator, CommonTimeFormate {

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
		return AnnotatedRegion<SystemUiOverlayStyle>(
			value: SystemUiOverlayStyle.light,
			child: Scaffold(
					appBar: PreferredSize(
						child: Offstage(
							offstage: true,
							child: AppBar(
								title: Text('test'),
								brightness: Brightness.light,
							),
						),
						preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.07),
					),
					body: this.getBody(),
			)
		);
  	}
	
	/// 页面布局
	Widget getBody() {
		return Stack(
			children: [
				ListView(
					children: <Widget>[
						Column(
						mainAxisAlignment: MainAxisAlignment.start,
						crossAxisAlignment: CrossAxisAlignment.start,
						children: <Widget>[
							this.buildCover(),
							this.buildTitle(widget.item.title, 'Architect'),
							this.buildScrollList(),
							// this.buildScrollTile(),
							this.buildBottomText(widget.item.abs, widget.item.ts)
						],
						)
					],
				),
				Stack(
					children: [
						Padding(
							padding: EdgeInsets.fromLTRB(15, 45, 0, 0),
							child: Row(
								mainAxisAlignment: MainAxisAlignment.center,
								children: [
									Text(widget.item.site, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300, color: Colors.white))
								]
							),
						),
						Padding(
							padding: EdgeInsets.fromLTRB(15, 45, 0, 0),
							child: GestureDetector(
								child: Icon(Icons.arrow_back_ios, size: 23, color: Colors.white),
								onTap: () {
									this.navigateBack(context);
								},
							),
						)
					]
				),
			]
		);
	}

	/// 底部文本
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
					Text(
						descTitle, 
						overflow: TextOverflow.ellipsis,
						maxLines: 4,
						style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.black)
					),
					SizedBox(height: 5),
					Row(
						children: [
							Icon(Icons.brightness_4, size: 10, color: Colors.grey),
							SizedBox(width: 5),
							Text(this.getFullTime(dateTitle), style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.grey))
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
					Text(
						title, 
						overflow: TextOverflow.ellipsis,
						maxLines: 2,
						style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)
					),
					SizedBox(height: 5),
					Text(desc, style: TextStyle(fontSize: 13, fontWeight: FontWeight.normal, color: Colors.grey)),
				],
			)
		);
	}

	/// 封面
	Widget buildCover() {
		return Container(
			width: MediaQuery.of(context).size.width,
			height: MediaQuery.of(context).size.height * 0.60,
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
					mainAxisAlignment: MainAxisAlignment.start,
					crossAxisAlignment: CrossAxisAlignment.start,
					children: [
						Spacer(),
						Padding(
							padding: EdgeInsets.fromLTRB(35, 0, 35, 15),
							child: Row(
								mainAxisAlignment: MainAxisAlignment.spaceBetween,
								children: <Widget>[
									this.getCoverItem(Utils.numbersToKilo(widget.item.nid), 'Posts'),
									this.getCoverItem(Utils.numbersToKilo(widget.item.ext.qid), 'Followers'),
									this.getCoverItem(Utils.numbersToKilo(widget.item.ext.ts.toString()), 'Following'),
								]
							),
						)
					]
				),
			)
		);
	}

	Widget getCoverItem(String value, String title) {
		return Column(
			children: <Widget>[
				Text(value, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white)),
				SizedBox(height: 5),
				Text(title, style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.white)),
			],
		);
	}

}
