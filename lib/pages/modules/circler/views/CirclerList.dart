import 'package:flutter/material.dart';

/// 列表结构
class CirclerList extends StatelessWidget {
  	const CirclerList({Key key}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return Padding(
			padding: EdgeInsets.fromLTRB(10.0, 35.0, 0.0, 0.0),
			child: Column(
				crossAxisAlignment: CrossAxisAlignment.start,
				children: <Widget>[
				Text('Experiences',
					style:
						TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontFamily: 'Montserrat')),
				SizedBox(height: 20.0),
				Column(
					children: <Widget>[
					this.buildExperienceItem(
						context,
						'assets/chris.jpg',
						'assets/p1.jpg',
						'assets/p2.jpg',
						124,
						12,
						'Hiking in San Diego',
						'The key is the childAspectRatio. This value is use to determine the layout in GridView. In order to get the desired aspect you have to set it to the (itemWidth / itemHeight). The solution would be this:'),
					SizedBox(height: 30.0),
					this.buildExperienceItem(
						context,
						'assets/p1.jpg',
						'assets/p3.jpg',
						'assets/p2.jpg',
						80,
						22,
						'How to offset a scaffold widget in Flutter?',
						"I did the first 3 steps. I have problems with the fourth one. I set an Offset state variable and placed my scaffold widget within a Positioned widget. I set the 'left' of the Positioned class to Offset.dx."),
					SizedBox(height: 30.0),
					this.buildExperienceItem(
						context,
						'assets/p5.jpg',
						'assets/p6.jpg',
						'assets/p2.jpg',
						468,
						85,
						'The 2019 Stack Overflow Developer Survey Results Are In',
						'So after some research, I found this wonderful video on youtube. Very informative and exactly solves my problem.'),
					],
				)
				],
			),
		);
	}

	/// 构建留言区
	Widget buildExperienceItem(
		BuildContext context,
		String avataUrl,
		String chapter1Url,
		String chapter2Url,
		int chatNum,
		int favNum,
		String chatTitle,
		String chatDesc) {
		return Column(
		children: <Widget>[
			// 第1行 标题
			Row(
			crossAxisAlignment: CrossAxisAlignment.start,
			children: <Widget>[
				CircleAvatar(
				backgroundImage: AssetImage(avataUrl),
				radius: 25.0,
				),
				SizedBox(width: 15.0),
				Column(
				children: <Widget>[
					Container(
					width: MediaQuery.of(context).size.width - 100,
					child: Text(chatTitle,
						maxLines: 2,
						softWrap: true,
						style: TextStyle(
							fontSize: 16.0,
							color: Colors.black87.withOpacity(0.5),
							fontWeight: FontWeight.bold)),
					),
					SizedBox(height: 5.0),
					Container(
					width: MediaQuery.of(context).size.width - 100,
					child: Text(chatDesc,
						maxLines: 5,
						softWrap: true,
						style: TextStyle(fontSize: 12.0)),
					),
				],
				)
			],
			),

			// 第2行 分隔线
			Padding(
			padding: EdgeInsets.fromLTRB(20.0, 25.0, 20.0, 0.0),
			child: Container(
				width: MediaQuery.of(context).size.width,
				height: 1.0,
				decoration: BoxDecoration(
					color: Colors.grey.withOpacity(0.3), shape: BoxShape.rectangle),
			),
			),

			// 第3行点赞区
			Padding(
			padding: EdgeInsets.fromLTRB(18.0, 15.0, 27.0, 40.0),
			child: Row(
				children: <Widget>[
				Container(
					width: 30.0,
					height: 30.0,
					decoration: BoxDecoration(
					image: DecorationImage(
						image: AssetImage('assets/speechbubble.png'),
						fit: BoxFit.cover),
					),
				),
				SizedBox(width: 10.0),
				Text(chatNum.toString(),
					style: TextStyle(color: Colors.grey, fontSize: 18.0)),
				Spacer(),
				CircleAvatar(
					backgroundImage: AssetImage(chapter1Url),
					radius: 20.0,
				),
				SizedBox(width: 7.0),
				CircleAvatar(
					backgroundImage: AssetImage(chapter2Url),
					radius: 20.0,
				),
				SizedBox(width: 7.0),
				Container(
					width: 40.0,
					height: 40.0,
					decoration: BoxDecoration(
						color: Colors.blueAccent,
						borderRadius: BorderRadius.circular(50.0),
						gradient: RadialGradient(
							center: Alignment(0.4, 0.3),
							radius: 0.7,
							colors: [
							Colors.blueAccent.withOpacity(0.5),
							Colors.blue
							],
							stops: [
							0.0,
							0.99
							]),
						shape: BoxShape.rectangle),
					child: Center(
					child: Text(favNum.toString(),
						style: TextStyle(
							fontSize: 18.0,
							fontWeight: FontWeight.bold,
							color: Colors.white)),
					),
				)
				],
			),
			)
		],
		);
	}
}