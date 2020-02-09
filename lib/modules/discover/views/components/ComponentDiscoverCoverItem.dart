import 'package:flutter/material.dart';
import 'package:flutter_travel/core/bloc/BlocProvider.dart';
import 'package:flutter_travel/modules/common/CommonImageNetwork.dart';
import 'package:flutter_travel/modules/common/CommonNavigator.dart';
import 'package:flutter_travel/modules/discover/blocs/BlocDiscoverDetail.dart';
import 'package:flutter_travel/modules/home/models/ModelContent.dart';

/// 按钮小图标组件
class ComponentDiscoverCoverItem extends StatefulWidget {
	final ModelContent item;
	final int index;
	ComponentDiscoverCoverItem({Key key, this.item, this.index}) : super(key: key);

	_ComponentDiscoverCoverItemState createState() => _ComponentDiscoverCoverItemState();
}

class _ComponentDiscoverCoverItemState extends State<ComponentDiscoverCoverItem> with CommonNavigator {
	BlocDiscoverDetail blocData;
	bool isDefaultSelected = false;

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
					// 有数据时
					if (snapshot.data.data.small.url == widget.item.data.small.url) {
						return this.getCoverItemByClickOutline();
					} else {
						return this.getCoverItemByClick();
					}
				} else {
					// 无数据时
					if (this.getIsFirstItem()) {
						this.isDefaultSelected = true;
						return this.getCoverItemByClickOutline();
					} else {
						return this.getCoverItemByClick();
					}
				}
			}
		);
	}	

	/// 无数据时首位数据判断
	bool getIsFirstItem() {
		return widget.index == 0 && !this.isDefaultSelected;
	}

	/// 渲染封面小组件,添加点击按钮, 显示是否选中
	Widget getCoverItemByClickOutline() {
		return GestureDetector(
			onTap: this.updateCoverData,
			child: Stack(
				children: [
					this.getCoverItem(),
					this.getOutLine()
				]
			),
		);
	}

	/// 渲染封面小组件,添加点击按钮
	Widget getCoverItemByClick() {
		return GestureDetector(
			onTap: this.updateCoverData,
			child: Stack(
				children: [
					this.getCoverItem(),
				]
			),
		);
	}

	/// 更新封面数据源
	void updateCoverData() {
		this.blocData.update(widget.item);
	}

	/// 发光外观
	Widget getOutLine() {
		return Container(
			width: 60.0,
			height: 60.0,
			decoration: BoxDecoration(
				shape: BoxShape.rectangle,
				color: Colors.transparent,
				borderRadius: BorderRadius.circular(8.0),
				border: Border.all(color: Color(0xFF68bef5), width: 3, style: BorderStyle.solid)
			),
		);
	}

	/// 渲染封面小组件
	Widget getCoverItem() {
		return Container(
			width: 60.0,
			height: 60.0,
			child: ClipRRect(
				borderRadius: BorderRadius.circular(8),
				child: CommentImageNetwork.getNetworkImage(widget.item.data.small.url, headers: this.getCrossHeaders(), fit: BoxFit.cover)
			),
		);
	}
}