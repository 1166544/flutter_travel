import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_travel/pages/common/CommonNavigator.dart';
import 'package:flutter_travel/pages/modules/circler/models/CirclerModelSearch.dart';

/// 搜索结果渲染条
class CircleSearchRender extends StatefulWidget {
	final CircleModelSearchItem snapData;

	CircleSearchRender({Key key, this.snapData}) : super(key: key);

	_CircleSearchRenderState createState() => _CircleSearchRenderState(this.snapData);
}

class _CircleSearchRenderState extends State<CircleSearchRender> with CommonNavigator {

	CircleModelSearchItem snapData;

	_CircleSearchRenderState(CircleModelSearchItem snapData) : super() {
		this.snapData = snapData;
	}

	@override
	Widget build(BuildContext context) {
		
		// 无图模式
		if (this.snapData.img.length == 0) {
			return this.buildNoneImageLayout(MediaQuery.of(context).size.width);
		}

		// 1张图模式
		if (this.snapData.img.length == 1) {
			return this.buildSingleImageLayout(this.snapData.img[0]);
		}

		// 2张以上图模式
		if (this.snapData.img.length >= 3) {
			return this.buildMultiImageLayout();
		}
		if (this.snapData.imgsrcurl != null) {
			return this.buildSingleImageLayout(this.snapData.imgsrcurl);
		}

		return Text('');
	}

	/// 无图模式
	Widget buildNoneImageLayout(double displayWidth) {
		return Container(
			width: displayWidth,
			padding: EdgeInsets.fromLTRB(10.0, 25.0, 10.0, 10.0),
			child: Column(
				children: <Widget>[
					Html(
						data: this.snapData.abstractValue,
						useRichText: true,
						defaultTextStyle: TextStyle(color: Colors.black, fontSize: 18.0),
						customTextStyle: (dynamic node, TextStyle baseStyle) {
							TextStyle newStyle;
							if (node.localName == 'em') {
          						newStyle = baseStyle.merge(TextStyle(color: Colors.red, fontWeight: FontWeight.bold));
							}

							return newStyle;
						}
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
									child: Text(this.snapData.subsitename, style: TextStyle(
												fontSize: 12.0,
												color: Colors.black
									)),
								),
							),
							SizedBox(width: 10.0),
							Icon(Icons.check_circle_outline, size: 20.0, color: Colors.blue),
							SizedBox(width: 10.0),
							Text(
								this.snapData.posttime,
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
					Html(
						data: this.snapData.abstractValue,
						useRichText: true,
						defaultTextStyle: TextStyle(color: Colors.black, fontSize: 18.0),
						customTextStyle: (dynamic node, TextStyle baseStyle) {
							TextStyle newStyle;
							if (node.localName == 'em') {
          						newStyle = baseStyle.merge(TextStyle(color: Colors.red, fontWeight: FontWeight.bold));
							}

							return newStyle;
						}
					),
					Container(
						padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
						width: MediaQuery.of(context).size.width,
						height: 100.0,
						child: ListView(
							scrollDirection: Axis.horizontal,
							children: <Widget>[
								this.buildImage(this.snapData.img[0]),
								SizedBox(width: 10.0),
								this.buildImage(this.snapData.img[1]),
								SizedBox(width: 10.0),
								this.buildImage(this.snapData.img[2]),
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
									child: Text(this.snapData.subsitename, style: TextStyle(
												fontSize: 12.0,
												color: Colors.black
									)),
								),
							),
							SizedBox(width: 10.0),
							Icon(Icons.check_circle_outline, size: 20.0, color: Colors.blue),
							SizedBox(width: 10.0),
							Text(
								this.snapData.posttime,
								style: TextStyle(color: Colors.black.withOpacity(0.7), fontSize: 13.0)
							)
						],
					)
				],
			)
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