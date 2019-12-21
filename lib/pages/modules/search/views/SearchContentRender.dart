import 'package:flutter/material.dart';
import 'package:flutter_travel/pages/common/CommonTimeFormate.dart';
import 'package:flutter_travel/pages/common/CommonTravelItem.dart';
import 'package:flutter_travel/pages/modules/circler/models/CirclerModelNewsItem.dart';

class SearchContentRender extends StatefulWidget {
	final CirclerModelNewsItem snapData;
	final int renderIndex;

	SearchContentRender({Key key, this.snapData, this.renderIndex}) : super(key: key);

	_SearchContentRenderState createState() => _SearchContentRenderState();
}

class _SearchContentRenderState extends State<SearchContentRender> with CommonTravelItem, CommonTimeFormate {
	@override
	Widget build(BuildContext context) {
		return this.buildListItem(widget.snapData, widget.renderIndex);
	}

	/// 创建动态泻染列表
	/// * [ModelGalleryItem item] 单项数据源
	/// * [int index] 列表顺序
	/// * [int total] 列表总长度
	Widget buildListItem(CirclerModelNewsItem item, int index) {

		List<Widget> displayList = [];

		// 开始部份
		if (index == 0) {
			displayList.add(
				this.buildMarkTitle()
			);
			displayList.add(
				this.buildStartIcon())
			;
			displayList.add(
				Image.asset(
					'assets/dot.png',
					width: 10.0,
					height: 60.0
				)
			);
		}

		// 中间部份
		displayList.add(
			this.buildTravelDate(item.site)
		);
		displayList.add(
			SizedBox(height: 10)
		);
		displayList.add(
			this.buildImageGrid(context, item, paddingTop: 0.0)
		);
		displayList.add(
			this.buildImgGalleryDetail(context, item.title, item.abs, item.commentCount)
		);

		return Column(
			children: displayList,
		);
	}

	/// 顶部标题
	Widget buildMarkTitle() {
		return Container(
			width: MediaQuery.of(context).size.width,
			child: Text(
			'James, touris ' + this.getNormalTime(),
			textAlign: TextAlign.center,
			style: TextStyle(
					fontSize: 17.0,
					color: Colors.black.withOpacity(0.7)
				),
			)
		);
	}

	/// 构建START图标
	Widget buildStartIcon() {
		return Padding(
			padding: EdgeInsets.fromLTRB(7.0, 7.0, 7.0, 0.0),
			child: Image.asset('assets/start.png', width: 150.0, height: 150.0)
		);
	}

	/// 旅行日志时间
	Widget buildTravelDate(String travelTitle) {
		return Text(
			travelTitle,
			textAlign: TextAlign.center,
			style: TextStyle(color: Colors.black.withOpacity(0.4))
		);
	}
}