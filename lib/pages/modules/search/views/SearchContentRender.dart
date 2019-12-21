import 'package:flutter/material.dart';
import 'package:flutter_travel/pages/common/CommonTravelItem.dart';
import 'package:flutter_travel/pages/modules/circler/models/CirclerModelNewsItem.dart';
import 'package:flutter_travel/pages/utils/Utils.dart';

class SearchContentRender extends StatefulWidget {
	final CirclerModelNewsItem snapData;
	final int renderIndex;

	SearchContentRender({Key key, this.snapData, this.renderIndex}) : super(key: key);

	_SearchContentRenderState createState() => _SearchContentRenderState();
}

class _SearchContentRenderState extends State<SearchContentRender> with CommonTravelItem {
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
		}

		// 中间部份
		displayList.add(
			this.buildTravelDate(Utils.toUppercase(item.title))
		);
		displayList.add(
			this.buildImageGrid(context, item, paddingTop: 0.0)
		);
		displayList.add(
			this.buildImgGalleryDetail(context, '$item.title - $item.title', Utils.toUppercase(item.title), '')
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
			'Mark, 4 Others',
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
			padding: EdgeInsets.all(7.0),
			child: Image.asset('assets/start.png', width: 150.0, height: 150.0)
		);
	}

	/// 旅行日志时间
	Widget buildTravelDate(String travelTitle) {
		return Text(
			travelTitle,
			textAlign: TextAlign.center,
			style: TextStyle(color: Colors.black.withOpacity(0.8))
		);
	}
}