import 'package:flutter/material.dart';
import 'package:flutter_travel/modules/common/CommonText.dart';

/// 页面预览
class AllPageView extends StatefulWidget {
  @override
  _AllPageViewState createState() => _AllPageViewState();
}

class _AllPageViewState extends State<AllPageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.more_vert), onPressed: () {})
        ],
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CommonText('Guide of the month All view',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        fontSize: 26.0)),
                SizedBox(height: 20.0),
                this.buildCoverImage(),
                SizedBox(height: 30.0),
                this.buildParticipant(),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 30.0),
            child: CommonText(
                "Plugin that allows Flutter to communicate with a native WebView.Warning: The webview is not integrated in the widget tree, it is a native view on top of the flutter view. you won't be able to use snackbars, dialogs ...",
                style:
                    TextStyle(fontWeight: FontWeight.normal, fontSize: 14.0)),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 60.0,
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.3),
                  shape: BoxShape.rectangle),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 15.0),
                    child: CommonText('IDR 300.00',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18.0)),
                  ),
                  SizedBox(width: 10.0),
                  CommonText('(Total Price)',
                      style: TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 12.0)),
                  Spacer(),
                  Container(
                    width: 130.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                        color: Color(0xFFffcd00), shape: BoxShape.rectangle),
                    child: Center(
                      child: CommonText('CONTAINUE',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0)),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  /// 构建Participant信息条
  Widget buildParticipant() {
    return Container(
      padding: EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 0.0),
      width: MediaQuery.of(context).size.width - 15.0,
      height: 280,
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.3),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(15.0)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CommonText('Participant',
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 23.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
          SizedBox(height: 30.0),
          this.buildCircleTitle(Color(0xFFd09dd3), Color(0xFFae96e7), 'Samantha William', 'SW'),
          SizedBox(height: 10.0),
          Row(
            children: <Widget>[
              SizedBox(width: 70.0),
              Expanded(
                  child: Container(
                width: 50.0,
                height: 0.5,
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.5),
                    shape: BoxShape.rectangle),
              ))
            ],
          ),
          SizedBox(height: 15.0),
          this.buildCircleTitle(
              Color(0xFF1dd8ba), Color(0x14c5cf), 'Johanthan Hope', 'JH'),
        ],
      ),
    );
  }

  /// 封面图片
  Widget buildCoverImage() {
    return Container(
      padding: EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 0.0),
      height: 280,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/p6.jpg'), fit: BoxFit.cover),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(15.0)),
      child: Column(
        children: <Widget>[
			// Back to Nature Camping Under the Star
          CommonText('Back to Nature Camping Under the Star',
              maxLines: 3,
              softWrap: true,
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: Colors.white)),
          SizedBox(height: 15.0),
          Row(
            children: <Widget>[
              Icon(Icons.location_on, color: Colors.white.withOpacity(0.8)),
              SizedBox(width: 10.0),
              CommonText('Labuan Bajo, NTT. Indonesia',
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 12.0,
                      color: Colors.white.withOpacity(0.8)))
            ],
          ),
          SizedBox(height: 7.0),
          Row(
            children: <Widget>[
              Icon(Icons.calendar_today, color: Colors.white.withOpacity(0.8)),
              SizedBox(width: 10.0),
              Container(
                width: 220.0,
                child: CommonText('Mon, 28 Dec 2018 - Wed 28 Dec 2019',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 12.0,
                        color: Colors.white.withOpacity(0.8))),
              )
            ],
          )
        ],
      ),
    );
  }

  /// 圆角title
  Widget buildCircleTitle(
      Color startColor, Color endColor, String title, String subTitle) {
    return Row(
      children: <Widget>[
        Container(
          width: 50.0,
          height: 50.0,
          decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(50.0),
              gradient: RadialGradient(
                  center: Alignment(0.9, 0.3),
                  radius: 0.7,
                  colors: [endColor, startColor],
                  stops: [0.0, 0.99]),
              shape: BoxShape.rectangle),
          child: Center(
            child: CommonText(subTitle.toString(),
                style: TextStyle(fontSize: 14.0, color: Colors.white)),
          ),
        ),
        SizedBox(width: 15.0),
        CommonText(title, style: TextStyle(fontSize: 16.0, color: Colors.black))
      ],
    );
  }
}
