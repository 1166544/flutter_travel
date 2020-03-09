import 'package:flutter/material.dart';
import 'package:flutter_travel/core/bloc/BlocProvider.dart';
import 'package:flutter_travel/modules/common/CommonImageNetwork.dart';
import 'package:flutter_travel/modules/common/CommonNavigator.dart';
import 'package:flutter_travel/modules/common/CommonText.dart';
import 'package:flutter_travel/modules/common/CommonTimeFormate.dart';
import 'package:flutter_travel/modules/discover/blocs/BlocDiscoverDetail.dart';
import 'package:flutter_travel/modules/discover/models/ModelSorter.dart';
import 'package:flutter_travel/modules/home/models/ModelContent.dart';
import 'package:flutter_travel/modules/home/models/ModelNewsItem.dart';
import 'package:flutter_travel/modules/utils/Utils.dart';

/// 封面内容
class ComponentDiscoverCover extends StatefulWidget {
	final ModelNewsItem item;
	final ModelContent coverData; 
	final List<ModelContent> fullDisplayList;
	ComponentDiscoverCover({Key key, this.item, this.coverData, this.fullDisplayList}) : super(key: key);

	_ComponentDiscoverCoverState createState() => _ComponentDiscoverCoverState();
}

class _ComponentDiscoverCoverState extends State<ComponentDiscoverCover> with CommonNavigator, CommonTimeFormate, TickerProviderStateMixin {
	
	BlocDiscoverDetail blocData;
	AnimationController fadeController;
	AnimationController scaleController;
	Animation fadeAnimation;
	Animation scaleAnimation;

	@override
	void initState() {
		super.initState();
		this.fadeController = AnimationController(
			vsync: this,
			duration: Duration(milliseconds: 500),
		);
		this.scaleController = AnimationController(
			vsync: this,
			duration: Duration(milliseconds: 300),
		);
		this.fadeAnimation = Tween(begin: 0.0, end: 1.0).animate(this.fadeController);

		// 缩小动画ease
		Animation curve = CurvedAnimation(parent: this.scaleController, curve: Curves.easeInOut);
		this.scaleAnimation = Tween(begin: 1.5, end: 1.0).animate(curve);
	}
	
	@override
	void dispose() {
		this.blocData.dispose();
		this.fadeController.dispose();
		super.dispose();
	}

	/// 播放动画
	void playAnimation() {
		this.fadeController.reset();
		this.scaleController.reset();

		this.fadeController.forward();
		this.scaleController.forward();
	}

	@override
	Widget build(BuildContext context) {
		this.blocData = BlocProvider.of<BlocDiscoverDetail>(context);

		return StreamBuilder<ModelContent>(
			stream: this.blocData.outStream,
			builder: (context, snapshot) {
				// 数据源到位时渲染列表
				if (snapshot.hasData) {
					return this.getCoverContent(url: snapshot.data.data.small.url);
				} else {
					return this.getCoverContent();
				}
			}
		);
	}

	/// 显示封面内容
	Widget getCoverContent({String url}) {
		String contentUrl = url ?? widget.coverData.data.small.url;

		this.playAnimation();
		
		return GestureDetector(
			onTap: () {
				this.nextPage();	
			},
			child: ScaleTransition(
				alignment: Alignment.center,
				scale: this.scaleAnimation,
				child: FadeTransition(
					opacity: this.fadeAnimation,
					child: this.getCoverLayout(contentUrl),
				)
			),
		);
	}

	/// 更新到下一页
	void nextPage() {
		ModelContent nextItem = ModelSorter.getNextItem(
			currentItem: this.blocData.data, 
			fullDisplayList: this.widget.fullDisplayList
		);
		this.blocData.update(nextItem);
	}

	/// 封面布局
	Widget getCoverLayout(String contentUrl) {
		return Container(
			width: MediaQuery.of(context).size.width,
			height: MediaQuery.of(context).size.height * 0.60,
			decoration: BoxDecoration(
				image: DecorationImage(
					image: CommentImageNetwork.imageNetwork(contentUrl, headers: this.getCrossHeaders()), 
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

	/// 封面子组件
	Widget getCoverItem(String value, String title) {
		return Column(
			children: <Widget>[
				CommonText(value, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white)),
				SizedBox(height: 5),
				CommonText(title, style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.white)),
			],
		);
	}

}