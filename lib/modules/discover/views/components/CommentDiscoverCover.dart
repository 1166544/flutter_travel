import 'package:flutter/material.dart';
import 'package:flutter_travel/core/bloc/BlocProvider.dart';
import 'package:flutter_travel/modules/common/CommonImageNetwork.dart';
import 'package:flutter_travel/modules/common/CommonNavigator.dart';
import 'package:flutter_travel/modules/common/CommonTimeFormate.dart';
import 'package:flutter_travel/modules/discover/blocs/BlocDiscoverDetail.dart';
import 'package:flutter_travel/modules/home/models/ModelContent.dart';
import 'package:flutter_travel/modules/home/models/ModelNewsItem.dart';
import 'package:flutter_travel/modules/utils/Utils.dart';

/// 封面内容
class ComponentDiscoverCover extends StatefulWidget {
	final ModelNewsItem item;
	final ModelContent coverData;
	ComponentDiscoverCover({Key key, this.item, this.coverData}) : super(key: key);

	_ComponentDiscoverCoverState createState() => _ComponentDiscoverCoverState();
}

class _ComponentDiscoverCoverState extends State<ComponentDiscoverCover> with CommonNavigator, CommonTimeFormate {
	
	BlocDiscoverDetail blocData;
	
	@override
	void dispose() {
		this.blocData.dispose();
		super.dispose();
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
				Text(value, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white)),
				SizedBox(height: 5),
				Text(title, style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.white)),
			],
		);
	}

}