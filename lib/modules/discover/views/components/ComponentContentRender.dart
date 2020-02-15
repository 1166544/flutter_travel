import 'package:flutter/material.dart';
import 'package:flutter_travel/modules/common/CommonText.dart';
import 'package:flutter_travel/modules/common/CommonTimeFormate.dart';
import 'package:flutter_travel/modules/common/CommonTravelItem.dart';
import 'package:flutter_travel/modules/home/models/ModelNewsItem.dart';
import 'package:flutter_travel/modules/weather/view/pages/PageHomeWeather.dart';

class ComponentContentRender extends StatefulWidget {
	final ModelNewsItem snapData;
	final int renderIndex;

	ComponentContentRender({Key key, this.snapData, this.renderIndex}) : super(key: key);

	_ComponentContentRenderState createState() => _ComponentContentRenderState();
}

class _ComponentContentRenderState extends State<ComponentContentRender> with CommonTravelItem, CommonTimeFormate {
	@override
	Widget build(BuildContext context) {
		return this.buildListItem(widget.snapData, widget.renderIndex);
	}

	/// 创建动态泻染列表
	/// * [ModelGalleryItem item] 单项数据源
	/// * [int index] 列表顺序
	/// * [int total] 列表总长度
	Widget buildListItem(ModelNewsItem item, int index) {

		List<Widget> displayList = [];

		// 开始部份
		if (index == 0) {
			displayList.add(
				this.buildMarkTitle()
			);
			displayList.add(
				this.buildStartIcon())
			;

			// 温度组件
			displayList.add(PageHomeWeather());
			
			displayList.add(
				Image.asset(
					'assets/images/dot.png',
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
			this.buildImgGalleryDetail(context, item.title, item.abs, item.commentCount, item: item)
		);

		return Column(
			children: displayList,
		);
	}

	/// 顶部标题
	Widget buildMarkTitle() {
		return Container(
			width: MediaQuery.of(context).size.width,
			child: CommonText(
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
			child: Image.asset('assets/images/start.png', width: 150.0, height: 150.0)
		);
	}

	/// 旅行日志时间
	Widget buildTravelDate(String travelTitle) {
		return CommonText(
			travelTitle,
			textAlign: TextAlign.center,
			style: TextStyle(color: Colors.black.withOpacity(0.4))
		);
	}
}