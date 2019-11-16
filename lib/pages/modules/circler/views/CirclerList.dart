import 'package:flutter/material.dart';
import 'package:flutter_travel/pages/modules/circler/models/CirclerModelNewsItem.dart';

/// 列表结构
class CirclerList extends StatelessWidget {

	List<CirclerModelNewsItem> _list;

  	CirclerList(List<CirclerModelNewsItem> list, {Key key}) : super(key: key) {
		this._list = list;
	}

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
					Container(
						width: 120.0,
						height: 90.0,
						decoration: BoxDecoration(
						image: DecorationImage(
							image:AssetImage(avataUrl), 
							fit: BoxFit.cover),
							borderRadius: BorderRadius.all(Radius.circular(7.0))
						)
					),
					SizedBox(width: 15.0),
					Column(
						children: <Widget>[
							Container(
								width: MediaQuery.of(context).size.width - 160,
								child: Text(chatTitle,
									maxLines: 2,
									softWrap: true,
									style: TextStyle(
										fontSize: 16.0,
										color: Colors.black87,
										fontWeight: FontWeight.bold)),
							),
							SizedBox(height: 5.0),
							Container(
								width: MediaQuery.of(context).size.width - 160,
								child: Text(chatDesc,
									maxLines: 2,
									softWrap: true,
									style: TextStyle(
										fontSize: 13.0,
										color: Colors.black87.withOpacity(0.5)
									)),
							),
							SizedBox(height: 5.0),
							Container(
								width: MediaQuery.of(context).size.width - 160,
								child: Row(
								children: <Widget>[
										Container(
											width: 10.0,
											height: 10.0,
											decoration: BoxDecoration(
											image: DecorationImage(
												image: AssetImage('assets/speechbubble.png'),
												fit: BoxFit.cover),
											),
										),
										SizedBox(width: 10.0),
										Text(chatNum.toString(),
											style: TextStyle(color: Colors.grey, fontSize: 12.0)),
										Spacer(),
									],
								),
							)
						],
					)
				],
			),
		],
		);
	}
}