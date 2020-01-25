import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_travel/modules/common/CommonNavigator.dart';
import 'package:flutter_travel/modules/common/CommonTravelItem.dart';
import 'package:flutter_travel/modules/home/models/ModelSearch.dart';
import 'package:flutter_travel/modules/home/views/pages/PageSearchDetail.dart';

/// 搜索结果渲染条
class ComponentSearchRender extends StatefulWidget {
	final ModelSearchItem snapData;

	ComponentSearchRender({Key key, this.snapData}) : super(key: key);

	_ComponentSearchRenderState createState() => _ComponentSearchRenderState(this.snapData);
}

class _ComponentSearchRenderState extends State<ComponentSearchRender> with CommonNavigator, CommonTravelItem {

	_ComponentSearchRenderState(ModelSearchItem snapData) : super();

	@override
	Widget build(BuildContext context) {

		if (widget.snapData == null) {
			return this.getNoMoreItem();
		}
		
		var renderView;
		// 无图模式
		if (widget.snapData.img.length == 0) {
			renderView = this.buildNoneImageLayout(MediaQuery.of(context).size.width);
		}

		// 1张图模式
		if (widget.snapData.img.length == 1) {
			renderView = this.buildSingleImageLayout(widget.snapData.img[0]);
		}

		// 2张以上图模式
		if (widget.snapData.img.length >= 3) {
			renderView = this.buildMultiImageLayout();
		}
		if (widget.snapData.imgsrcurl != null) {
			renderView = this.buildSingleImageLayout(widget.snapData.imgsrcurl);
		}
		
		return GestureDetector(
			// 透明区域响应点击
			behavior: HitTestBehavior.opaque,
			onTap: () {
				this.navigateTo(context, PageSearchDetail(url: widget.snapData.url));
			},
			child: renderView,
		);
	}

	/// 无图模式
	Widget buildNoneImageLayout(double displayWidth) {
		return Container(
			width: displayWidth,
			padding: EdgeInsets.fromLTRB(10.0, 25.0, 10.0, 10.0),
			child: Column(
				children: <Widget>[
					this.getHtmlTitle(widget.snapData.abstractValue),
					SizedBox(height: 5),
					Row(
						children: <Widget>[
							Container(
								height: 30.0,
								padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0.0),
								// 圆角背景按钮
								decoration: BoxDecoration(
									color: Colors.yellow,
									shape: BoxShape.rectangle,
									borderRadius: BorderRadius.circular(2.0)
								),
								child: Center(
									child: Text(widget.snapData.subsitename, style: TextStyle(
												fontSize: 12.0,
												color: Colors.black
									)),
								),
							),
							SizedBox(width: 10.0),
							Icon(Icons.check_circle_outline, size: 20.0, color: Colors.blue),
							SizedBox(width: 10.0),
							Text(
								widget.snapData.posttime,
								style: TextStyle(color: Colors.black.withOpacity(0.7), fontSize: 13.0)
							)
						],
					)
				],
			),
		);
	}

	/// 1张图模式
	Widget buildSingleImageLayout(String url) {
		return Container(
			width: MediaQuery.of(context).size.width,
			padding: EdgeInsets.fromLTRB(0.0, 10.0, 10.0, 10.0),
			child: Row(
				children: <Widget>[
					this.buildNoneImageLayout(MediaQuery.of(context).size.width * 0.70),
					Container(
						width: 90.0,
						height: 120.0,
						decoration: BoxDecoration(
							image: DecorationImage(
								image: NetworkImage(url, headers: this.getCrossHeaders()),
								fit: BoxFit.cover
							),
							border: Border.all(
								color: Colors.grey.withOpacity(0.5),
								width: 0.5
							),
							borderRadius: BorderRadius.all(Radius.circular(7.0))
						),
					)
				],
			),
		);
	}

	/// 2张以上图模式
	Widget buildMultiImageLayout() {
		return Container(
			padding: EdgeInsets.fromLTRB(10.0, 25.0, 10.0, 10.0),
			child: Column(
				children: <Widget>[
					this.getHtmlTitle(widget.snapData.abstractValue),
					Container(
						padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
						width: MediaQuery.of(context).size.width,
						height: 100.0,
						child: ListView(
							scrollDirection: Axis.horizontal,
							children: <Widget>[
								this.buildImage(widget.snapData.img[0]),
								SizedBox(width: 10.0),
								this.buildImage(widget.snapData.img[1]),
								SizedBox(width: 10.0),
								this.buildImage(widget.snapData.img[2]),
							],
						),
					),
					SizedBox(height: 5),
					Row(
						children: <Widget>[
							Container(
								height: 30.0,
								padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0.0),
								// 圆角背景按钮
								decoration: BoxDecoration(
									color: Colors.yellow,
									shape: BoxShape.rectangle,
									borderRadius: BorderRadius.circular(2.0)
								),
								child: Center(
									child: Text(widget.snapData.subsitename, style: TextStyle(
												fontSize: 12.0,
												color: Colors.black
									)),
								),
							),
							SizedBox(width: 10.0),
							Icon(Icons.check_circle_outline, size: 20.0, color: Colors.blue),
							SizedBox(width: 10.0),
							Text(
								widget.snapData.posttime,
								style: TextStyle(color: Colors.black.withOpacity(0.7), fontSize: 13.0)
							)
						],
					)
				],
			)
		);
	}

	/// 渲染HTML类标题
	Widget getHtmlTitle(String title) {
		return Html(
			data: title,
			useRichText: true,
			defaultTextStyle: TextStyle(color: Colors.black, fontSize: 18.0),
			customTextStyle: (dynamic node, TextStyle baseStyle) {
				TextStyle newStyle;
				if (node.localName == 'em') {
					newStyle = baseStyle.merge(TextStyle(color: Colors.red, fontWeight: FontWeight.bold));
				}

				return newStyle;
			}
		);
	}

	/// 图片布局
	Widget buildImage(String url) {
		return Container(
			width: 120.0,
			height: 90.0,
			decoration: BoxDecoration(
				image: DecorationImage(
					image: NetworkImage(url, headers: this.getCrossHeaders()),
					fit: BoxFit.cover
				),
				border: Border.all(
					color: Colors.grey.withOpacity(0.5),
					width: 0.5
				),
				borderRadius: BorderRadius.all(Radius.circular(7.0))
			),
		);
	}

}