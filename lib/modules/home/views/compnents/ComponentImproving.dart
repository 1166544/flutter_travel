import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_travel/modules/common/CommonText.dart';
import 'package:flutter_travel/modules/home/models/ModelsNewsList.dart';
import 'package:flutter_travel/redux/states/StateApp.dart';

/// 持续改进提示
class ComponentImproving extends StatefulWidget {
	final AsyncSnapshot<ModelsNewsList> snapshot;

	ComponentImproving({this.snapshot, Key key}) : super(key: key);

	_ComponentImprovingState createState() => _ComponentImprovingState();
}

class _ComponentImprovingState extends State<ComponentImproving> {
	@override
	Widget build(BuildContext context) {
		return Padding(
			padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0),
			child: this.buidCircleIconBar('98%',
				'Keep improving!',
				Color(0xFF5474e8),
				Color(0xFFcac0f8),
				Color(0xFFfeabb5)
			)
		);
	}

	/// 构建圆角横条
	Widget buidCircleIconBar(
		String startCount, String hotelName, Color colorValue, Color colorCenter, Color shapeColor) {
		
		// 显示头条标题
		String displayStr = "No one will pay for your future. You either try to climb up or rot in the mud at the bottom of society. That's life.";
		if (widget.snapshot.hasData && widget.snapshot.data.news != null && widget.snapshot.data.news.length > 0) {
			displayStr = widget.snapshot.data.news[0].title.toString();
		}

		return Container(
			// RadialGridient圆形渐变效果
			decoration: BoxDecoration(
				color: colorValue,
				borderRadius: BorderRadius.circular(8.0),
				gradient: RadialGradient(
					center: Alignment(-0.9, 3),
					radius: 3.7,
					colors: [colorValue, colorCenter, shapeColor],
					stops: [0.3, 0.7, 1.5])),
			child: Padding(
				padding: EdgeInsets.fromLTRB(25.0, 13.0, 25.0, 13.0),
				child: Row(
				crossAxisAlignment: CrossAxisAlignment.center,
				mainAxisAlignment: MainAxisAlignment.start,
				children: <Widget>[
					Column(
						mainAxisAlignment: MainAxisAlignment.start,
						crossAxisAlignment: CrossAxisAlignment.start,
						children: <Widget>[
							CommonText(hotelName, style: TextStyle(fontSize: 18.0, color: Colors.white, fontFamily: 'Montserrat', fontWeight: FontWeight.bold)),
							Container(
								padding: EdgeInsets.fromLTRB(0.0, 5.0, 0, 0),
								child: CommonText(
									displayStr, 
									style: TextStyle(
										fontSize: 9.0, 
										color: Colors.white, 
										fontFamily: 'Montserrat',
									),
									maxLines: 2,
									softWrap: true,
									overflow: TextOverflow.ellipsis,
								),
								width: 220,
							),
						],
					),
					Spacer(),
					Container(
						width: 60.0,
						height: 60.0,
						decoration: BoxDecoration(
							color: Color(0xFFfeabb5),
							borderRadius: BorderRadius.circular(50.0),
							boxShadow: [
							BoxShadow(
								color: Colors.white.withOpacity(0.5),
								offset: Offset(0.0, 0.0),
								blurRadius: 0.0,
								spreadRadius: 1.8)
							],
						),
						child: this.getImproveTitle(),
					),
				],
				),
			),
		);
	}

	/// Redux数据调用: 绑定全局动态标题
	Widget getImproveTitle() {
		return StoreConnector<AppState, dynamic>(
			converter: (store) => store.state.page.title,
			builder: (BuildContext context, title) {
				// return CommonText('Materials - 60 分钟杂志 ${auth.toString()}',
				return Center(
					child: CommonText(
						title,
						style: TextStyle(
							fontSize: 16.0,
							color: Colors.white,
							fontWeight: FontWeight.bold)
					),
				);
			}
		);
	}
}