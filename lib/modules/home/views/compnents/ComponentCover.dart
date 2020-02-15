import 'package:flutter/material.dart';
import 'package:flutter_travel/modules/common/CommonText.dart';

/// 封面
class ComponentCover extends StatelessWidget {

	@override
	Widget build(BuildContext context) {
		return this.buildCoverImage(context);
	}

	/// 构建封面
	Widget buildCoverImage(BuildContext context) {
		return Container(
		width: MediaQuery.of(context).size.width,
		height: 360,
		decoration: BoxDecoration(
			image: DecorationImage(
				image: AssetImage('assets/beach3.jpg'), fit: BoxFit.cover),
			shape: BoxShape.rectangle,
		),
		child: Container(
			decoration: BoxDecoration(
				color: Colors.white,
				shape: BoxShape.rectangle,
				gradient: LinearGradient(
					begin: Alignment.topCenter,
					end: Alignment.bottomCenter,
					colors: [
					Colors.white.withOpacity(0.0),
					Colors.white.withOpacity(0.75),
					Colors.white
					],
					stops: [
					0.70,
					0.85,
					1.0
					])),
			child: Padding(
			padding: EdgeInsets.fromLTRB(30.0, 150.0, 0.0, 0.0),
			child: Row(
				mainAxisAlignment: MainAxisAlignment.start,
				crossAxisAlignment: CrossAxisAlignment.center,
				children: <Widget>[
					Container(
					width: 100,
					height: 170,
					decoration: BoxDecoration(
						color: Colors.blueAccent.withOpacity(0.5),
						shape: BoxShape.rectangle,
						borderRadius: BorderRadius.circular(10.0)),
					child: Padding(
						padding: EdgeInsets.fromLTRB(10.0, 5.0, 0.0, 5.0),
						child: Column(
							mainAxisAlignment: MainAxisAlignment.start,
							crossAxisAlignment: CrossAxisAlignment.start,
							children: <Widget>[
							Icon(Icons.cloud_queue, color: Colors.white, size: 27.0),
							SizedBox(height: 7.0),
							this.buildDegree(),
							Spacer(),
							this.buildDate()
							]),
					),
					),
					SizedBox(width: 10.0),
					this.buildShadowText()
				]),
			),
		),
		);
	}

	/// 构建日期
	Widget buildDate() {
		return Container(
				width: 120,
				child: CommonText('19 th October',
					style: TextStyle(fontSize: 18.0, color: Colors.white, fontFamily: 'Montserrat'),
					softWrap: true,
					maxLines: 2),
		);
	}

	/// 阴影文本
	Widget buildShadowText() {
		return Expanded(
			child: CommonText(
				'San Francisco',
				maxLines: 2,
				style: TextStyle(
					fontSize: 35.0,
					fontWeight: FontWeight.bold,
					letterSpacing: -1.0,
					color: Colors.white,
					wordSpacing: 0.0,
					fontFamily: 'Montserrat',
					shadows: <Shadow>[
						Shadow(
							offset: Offset(3.0, 3.0),
							blurRadius: 3.0,
							color: Colors.grey.withOpacity(0.5)),
						Shadow(
							offset: Offset(3.0, 3.0),
							blurRadius: 8.0,
							color: Colors.grey),
					])
				),
			);
	}

	/// 构建度C单位
	Widget buildDegree() {
		return Row(
			crossAxisAlignment: CrossAxisAlignment.start,
			mainAxisAlignment: MainAxisAlignment.center,
			children: <Widget>[
				CommonText('10',
					style: TextStyle(fontSize: 45.0, color: Colors.white)),
				Row(
				crossAxisAlignment: CrossAxisAlignment.start,
				children: <Widget>[
					CommonText('0', style: TextStyle(fontSize: 12.0, color: Colors.white)),
					CommonText('C', style: TextStyle(fontSize: 18.0, color: Colors.white)),
				],
				)
			],
		);
	}
}