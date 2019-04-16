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
      padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      children: <Widget>[
        // 封面
        this.buildCoverImage(),

        // 第1行
        Padding(
            padding: EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
            child: Text("Discover europe's surprising secret villages",
                style: TextStyle(fontSize: 27.0, fontWeight: FontWeight.bold),
                maxLines: 2)),

        // 第2行 横向滚动列表
        Container(
          padding: EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
          width: MediaQuery.of(context).size.width,
          height: 220.0,
          child: ListView(
            padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              this.buildScrollImageItem(
                  'assets/road.jpg',
				  'assets/chris.jpg',
				  'Madrid in Summer'),
              SizedBox(width: 15.0),
              this.buildScrollImageItem(
				  'assets/p5.jpg',
				  'assets/beach5.jpg',
                  'Barcelona withe Drone'),
              SizedBox(width: 15.0),
              this.buildScrollImageItem(
                  'assets/p6.jpg',
				  'assets/p2.jpg',
				  'Sanfrisco travel details'),
            ],
          ),
        ),

        // 第3行
        Padding(
          padding: EdgeInsets.fromLTRB(15.0, 55.0, 0.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // 标题
              Text('To DO:',
                  style:
                      TextStyle(fontSize: 27.0, fontWeight: FontWeight.bold)),

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
        ),

        // 第四行
        Padding(
          padding: EdgeInsets.fromLTRB(10.0, 45.0, 0.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Experiences',
                  style:
                      TextStyle(fontSize: 27.0, fontWeight: FontWeight.bold)),
              SizedBox(height: 20.0),
              Column(
                children: <Widget>[
                  this.buildExperienceItem(
                      'assets/chris.jpg',
                      'assets/p1.jpg',
                      'assets/p2.jpg',
                      124,
                      12,
                      'Hiking in San Diego',
                      'The key is the childAspectRatio. This value is use to determine the layout in GridView. In order to get the desired aspect you have to set it to the (itemWidth / itemHeight). The solution would be this:'),
                  SizedBox(height: 30.0),
                  this.buildExperienceItem(
                      'assets/p1.jpg',
                      'assets/p3.jpg',
                      'assets/p2.jpg',
                      80,
                      22,
                      'How to offset a scaffold widget in Flutter?',
                      "I did the first 3 steps. I have problems with the fourth one. I set an Offset state variable and placed my scaffold widget within a Positioned widget. I set the 'left' of the Positioned class to Offset.dx."),
                  SizedBox(height: 30.0),
                  this.buildExperienceItem(
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
        )
      ],
    );
  }

  /// 构建封面
  Widget buildCoverImage() {
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
                    padding: EdgeInsets.fromLTRB(10.0, 5.0, 0.0, 0.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Icon(Icons.cloud_queue,
                              color: Colors.white, size: 27.0),
                          SizedBox(height: 7.0),
                          this.buildDegree(),
                          SizedBox(height: 25.0),
                          Container(
                            width: 120,
                            child: Text('19 th October',
                                style: TextStyle(
                                    fontSize: 18.0, color: Colors.white),
                                softWrap: true,
                                maxLines: 2),
                          )
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

  /// 阴影文本
  Widget buildShadowText() {
	  return Text('San Francisco',
		style: TextStyle(
			fontSize: 35.0,
			fontWeight: FontWeight.bold,
			color: Colors.white,
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
		);
  }

  /// 构建度C单位
  Widget buildDegree() {
	  return Row(
		crossAxisAlignment: CrossAxisAlignment.start,
		children: <Widget>[
			Text('10',
				style: TextStyle(
					fontSize: 50.0, color: Colors.white)),
			Row(
			crossAxisAlignment: CrossAxisAlignment.start,
			children: <Widget>[
				Text('0',
					style: TextStyle(
						fontSize: 12.0, color: Colors.white)),
				Text('C',
					style: TextStyle(
						fontSize: 18.0, color: Colors.white)),
			],
			)
		],
	);
  }

  /// 构建留言区
  Widget buildExperienceItem(
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
                          fontSize: 20.0,
                          color: Colors.black87.withOpacity(0.5),
                          fontWeight: FontWeight.bold)),
                ),
                SizedBox(height: 10.0),
                Container(
                  width: MediaQuery.of(context).size.width - 100,
                  child: Text(chatDesc,
                      maxLines: 5,
                      softWrap: true,
                      style: TextStyle(fontSize: 14.0)),
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
                style: TextStyle(fontSize: 21.0, color: Colors.white))
          ],
        ),
      ),
    );
  }

  /// 滚动图片
  Widget buildScrollImageItem(
      String coverUrl, String avataUrl, String titleDesc) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: 180.0,
          height: 150.0,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(coverUrl), fit: BoxFit.cover),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
                bottomLeft: Radius.circular(0.0),
                bottomRight: Radius.circular(20.0),
              )),
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
                child: Text(titleDesc,
                    maxLines: 2,
                    softWrap: true,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0)))
          ],
        )
      ],
    );
  }
}
