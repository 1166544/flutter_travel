import 'package:flutter/material.dart';

class PageCircler extends StatefulWidget {
  final Widget child;

  PageCircler({Key key, this.child}) : super(key: key);

  _CirclerState createState() => _CirclerState();
}

/// 我的内容
class _CirclerState extends State<PageCircler> {
  @override
  Widget build(BuildContext context) {
	return ListView(
			padding: EdgeInsets.fromLTRB(15.0, 30.0, 0.0, 0.0),
			children: <Widget>[
				// 第1行
				Text(
					"Discover europe's surprising secret villages",
					style: TextStyle(fontSize: 27.0, fontWeight: FontWeight.bold),
					maxLines: 2
				),

				// 第2行
				Container(
					width: MediaQuery.of(context).size.width,
					height: 220.0,
					child: ListView(
						padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
						scrollDirection: Axis.horizontal,
						children: <Widget>[
							this.buildScrollImageItem('assets/road.jpg', 'assets/chris.jpg', 'Madrid in Summer'),
							SizedBox(width: 15.0),
							this.buildScrollImageItem('assets/p5.jpg', 'assets/beach5.jpg', 'Barcelona withe Drone'),
							SizedBox(width: 15.0),
							this.buildScrollImageItem('assets/p6.jpg', 'assets/p2.jpg', 'Sanfrisco travel details'),
						],
					),
				),

				// 第3行
				Padding(
					padding: EdgeInsets.fromLTRB(0.0, 55.0, 0.0, 0.0),
					child: Column(
						crossAxisAlignment: CrossAxisAlignment.start,
						children: <Widget>[
							Text('To DO:', style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold)),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 280.0,
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 23.0,
                  mainAxisSpacing: 23.0,
                  childAspectRatio: (90 / 65),  // CELL宽高
                  controller: new ScrollController(keepScrollOffset: false),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  padding: EdgeInsets.fromLTRB(0.0, 10.0, 12.0, 0.0),
                  children: <Widget>[
                    this.buildGridIconView('98', 'Airbnbs', Colors.orangeAccent, Colors.orange),
                    this.buildGridIconView('56', 'Attractions', Colors.lightBlue[300], Colors.blue),
                    this.buildGridIconView('34', 'Experiences', Colors.purple, Colors.deepPurple),
                    this.buildGridIconView('09', 'Restaurants', Colors.grey.withOpacity(0.5), Colors.grey),
                  ],
                ),
              )
						],
					),
				)

				// 第四行
			],
		);
  }

  /// 构建圆角图标
  Widget buildGridIconView(String startCount, String hotelName, Color colorValue, Color shapeColor) {
	  return Container(
		  decoration: BoxDecoration(
			  color: colorValue,
			  borderRadius: BorderRadius.circular(20.0),
        gradient: RadialGradient(
          center: Alignment(-0.8, -0.5),
          radius: 0.8,
          colors: [
            colorValue,
            shapeColor
          ],
          stops: [
            0.0,
            0.9
          ]
        )
		  ),
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
                    spreadRadius: 3.0
                  )
                ],
              ),
              child: Center(
                child: Text( startCount, style: TextStyle(fontSize: 17.0, color: shapeColor, fontWeight: FontWeight.bold)),
              ),
            ),
            SizedBox(height: 20.0),
            Text(hotelName, style: TextStyle(fontSize: 21.0, color: Colors.white))
          ],
        ),
      ),
	  );
  }

  /// 滚动图片
  Widget buildScrollImageItem(String coverUrl, String avataUrl, String titleDesc) {
	  return Column(
		  crossAxisAlignment: CrossAxisAlignment.start,
		  children: <Widget>[
			  Container(
				  width: 180.0,
				  height: 150.0,
				  decoration: BoxDecoration(
					  image: DecorationImage(
						  image: AssetImage(coverUrl),
						  fit: BoxFit.cover
					  ),
					  borderRadius: BorderRadius.only(
						  topLeft: Radius.circular(20.0),
						  topRight: Radius.circular(20.0),
						  bottomLeft: Radius.circular(0.0),
						  bottomRight: Radius.circular(20.0),
					  )
				  ),
			  ),
			  SizedBox(height: 10.0),
			  Row(
				  mainAxisAlignment: MainAxisAlignment.start,
				  crossAxisAlignment: CrossAxisAlignment.start,
				  children: <Widget>[
					  CircleAvatar(
						  backgroundImage: AssetImage(avataUrl),
						  radius: 20.0,
					  ),
					  SizedBox(width: 15.0),
					  Container(
						  width: 95.0,
						  height: 40.0,
						  child: Text(
							titleDesc,
							maxLines: 2,
							softWrap: true,
							style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0)
						)
					  )
				  ],
			  )
		  ],
	  );
  }
}
