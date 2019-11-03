import 'package:flutter/material.dart';

/// 九宫格内容
class CirclerGrid extends StatelessWidget {

	@override
	Widget build(BuildContext context) {
	return Padding(
          padding: EdgeInsets.fromLTRB(15.0, 55.0, 0.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // 标题
              Text('TO DO:', style:TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontFamily: 'Montserrat')),

              SizedBox(height: 10.0),

              // 圆角GRID
              Container(
                width: MediaQuery.of(context).size.width,
                height: 280.0,
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 23.0,
                  mainAxisSpacing: 23.0,
                  childAspectRatio: (90 / 65), // CELL宽高
                  controller: new ScrollController(keepScrollOffset: false),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  padding: EdgeInsets.fromLTRB(0.0, 0.0, 12.0, 0.0),
                  children: <Widget>[
                    this.buildGridIconView(
                        '98',
						'Airbnbs',
						Colors.orangeAccent,
						Colors.orange
					),
                    this.buildGridIconView(
						'56',
						'Attractions',
                        Colors.lightBlue[300],
						Colors.blue
					),
                    this.buildGridIconView(
                        '34',
						'Experiences',
						Colors.purple,
						Colors.deepPurple
					),
                    this.buildGridIconView(
						'09',
						'Restaurants',
                        Colors.grey.withOpacity(0.5),
						Colors.grey
					),
                  ],
                ),
              )
            ],
          ),
        );
	}

	/// 构建圆角图标
	Widget buildGridIconView(
		String startCount, String hotelName, Color colorValue, Color shapeColor) {
		return Container(
		// RadialGridient圆形渐变效果
		decoration: BoxDecoration(
			color: colorValue,
			borderRadius: BorderRadius.circular(20.0),
			gradient: RadialGradient(
				center: Alignment(-0.8, -0.5),
				radius: 0.8,
				colors: [colorValue, shapeColor],
				stops: [0.0, 0.9])),
		child: Padding(
			padding: EdgeInsets.fromLTRB(25.0, 20.0, 0.0, 0.0),
			child: Column(
			crossAxisAlignment: CrossAxisAlignment.start,
			children: <Widget>[
				Container(
				width: 40.0,
				height: 40.0,
				decoration: BoxDecoration(
					color: Colors.white,
					borderRadius: BorderRadius.circular(50.0),
					boxShadow: [
					BoxShadow(
						color: shapeColor,
						offset: Offset(0.0, 3.0),
						blurRadius: 3.0,
						spreadRadius: 3.0)
					],
				),
				child: Center(
					child: Text(startCount,
						style: TextStyle(
							fontSize: 17.0,
							color: shapeColor,
							fontWeight: FontWeight.bold)),
				),
				),
				SizedBox(height: 20.0),
				Text(hotelName,
					style: TextStyle(fontSize: 14.0, color: Colors.white, fontFamily: 'Montserrat'))
			],
			),
		),
		);
	}
}