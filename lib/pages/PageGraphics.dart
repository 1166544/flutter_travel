import 'package:flutter/material.dart';

/// 摄影
class PageGraphics extends StatefulWidget {
  final Widget child;

  PageGraphics({Key key, this.child}) : super(key: key);

  _PageGraphicsState createState() => _PageGraphicsState();
}

/// 摄影状态
class _PageGraphicsState extends State<PageGraphics> {
  @override
  Widget build(BuildContext context) {
	return Scaffold(
		body: Container(
			// 背景装饰图片
			decoration: BoxDecoration(
				image: DecorationImage(
					image: AssetImage('assets/road.jpg'),
					fit: BoxFit.cover,
				),
			),
			child: Container(
				// 背景图片上的渐变效果
				decoration: BoxDecoration(
					gradient: LinearGradient(
					begin: Alignment.topCenter,
					end: Alignment.bottomCenter,
					stops: [0.0, 0.5, 0.75, 0.9],
					colors: [
						Colors.white.withOpacity(0.0),
						Colors.white.withOpacity(0.25),
						Colors.white.withOpacity(0.75),
						Colors.white,
					],
					)
				),
				child: ListView(
					children: <Widget>[
						// 页面列表内容
						this.buildTopChildren(),
						this.buildBottomChildren()
					],
				),
			),
		),
	);
  }

  /// 顶部内容
  Widget buildTopChildren() {
	  return Padding(
		  padding: EdgeInsets.fromLTRB(15.0, 150.0, 15.0, 0.0),
		  child: Container(
			  decoration: BoxDecoration(
				  border: Border.all(
					  color: Color(0xFFFFFFFF), width: 0.5
				  ),
				  color: Color(0xFFFFFFFF),
				  shape: BoxShape.rectangle,
				  borderRadius: BorderRadius.circular(20.0)
			  ),
			  child: Column(
				children: <Widget>[

					// 第1行
					Padding(
						padding: EdgeInsets.fromLTRB(30.0, 35.0, 25.0, 15.0),
						child: Row(
							mainAxisAlignment: MainAxisAlignment.spaceBetween,
							children: <Widget>[
								Container(
									decoration: BoxDecoration(
										border: Border.all(color: Colors.white, width: 0.0),
										color: Colors.deepPurple.withOpacity(0.3),
										shape: BoxShape.rectangle,
										borderRadius: BorderRadius.circular(15.0)
									),
									child: Padding(
										padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
										child: Column(
											children: <Widget>[
												Text('03', style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.deepPurple)),
												Text('Mar', style: TextStyle(fontSize: 13.0, color: Colors.deepPurple)),
											],
										),
									),
								),
								SizedBox(width: 10.0),
								Column(
									crossAxisAlignment: CrossAxisAlignment.start,
									children: <Widget>[
										Text('Chichen Itza', style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.black)),
										Text('Mexico', style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.normal, color: Colors.green)),
									],
								),
								Spacer(),
								Container(
									width: 45.0,
									height: 45.0,
									decoration: BoxDecoration(
										image: DecorationImage(
											image: AssetImage('assets/arrow.png'),
											fit: BoxFit.cover
										),
									),
								)
							],
						),
					),

					// 第二行
					Padding(
						padding: EdgeInsets.fromLTRB(30.0, 35.0, 25.0, 15.0),
						child: Row(
							children: <Widget>[
								Text('image1'),
								Text('image2'),
								Text('image3'),
							],
						),
					),

					// 第三行
					Text('UNESCO World heritage site inscription 1988'),

					// 第四行
					Padding(
						padding: EdgeInsets.fromLTRB(35.0, 35.0, 35.0, 15.0),
						child: Row(
							children: <Widget>[
								Text('start1'),
								Text('start1'),
								Text('start1'),
							],
						),
					),

					// 第五行
					Padding(
						padding: EdgeInsets.fromLTRB(35.0, 35.0, 35.0, 15.0),
						child: Row(
							children: <Widget>[
								Text('Avata1'),
								Text('Avata1'),
								Text('Avata1'),
							],
						),
					),
				],
			 ),
		  ),
	  );
  }

  /// 底部内容
  Widget buildBottomChildren() {
	  return Text('Bottom');
  }
}
