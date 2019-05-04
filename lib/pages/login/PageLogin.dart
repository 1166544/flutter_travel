import 'package:flutter/material.dart';

class PageLogin extends StatefulWidget {
  PageLogin({Key key}) : super(key: key);

  _PageLoginState createState() => _PageLoginState();
}

/// 登录页面，无APPBAR
class _PageLoginState extends State<PageLogin> {
// var usernameController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
	return Material(
		child: Container(
			decoration: BoxDecoration(
				color: Colors.white,
				shape: BoxShape.rectangle,
			),
			width: MediaQuery.of(context).size.width,
			height: MediaQuery.of(context).size.height,
			child: Stack(
				children: <Widget>[
					this.buildBackground(),
					this.buildLoginPanel()
				],
			),
		),
	);
  }

  /// 背景布局
  Widget buildBackground() {
	  double fullWidth = MediaQuery.of(context).size.width;
	  double leftWidth = 100;
	  double rightWidth = 7;
	  double middleWidth = fullWidth - leftWidth - rightWidth;
	  return Row(
		  children: <Widget>[
			  // 左边框
			  this.buildBackgroundByTemplate(Color(0xFFdae3ec), leftWidth),
			  // 中间框
			  this.buildBackgroundByTemplate(Colors.white, middleWidth),
			  // 右边框
			  this.buildBackgroundByTemplate(Color(0xFF0061f8), rightWidth),
		  ],
	  );
  }

  /// 构建背景
  Widget buildBackgroundByTemplate(Color backgroundColor, double widthValue) {
	  return Container(
		  width: widthValue,
		  height: MediaQuery.of(context).size.height,
		  decoration: BoxDecoration(
			  color: backgroundColor
		  ),
	  );
  }

  /// 构建登录框
  Widget buildLoginPanel() {
	  return Padding(
		  padding: EdgeInsets.fromLTRB(40.0, 0.0, 0.0, 0.0),
		  child: Column(
			mainAxisAlignment: MainAxisAlignment.center,
			crossAxisAlignment: CrossAxisAlignment.start,
			children: <Widget>[
				this.buildLoginTitle(),
				SizedBox(height: 50.0),
				this.buildLoginInput(),
				SizedBox(height: 40.0),
				this.buildLoginButton()
			],
		)
	  );
  }

  Widget buildLoginTitle() {
	  return Column(
		  crossAxisAlignment: CrossAxisAlignment.start,
		  children: <Widget>[
			Text(
				  'Welcome to'.toUpperCase(),
					style: TextStyle(
						fontFamily: 'Montserrat',
						fontSize: 30.0,
						fontWeight: FontWeight.bold,
						color: Colors.black,
					)
			 ),
			Text(
				  'UN   ICN_PART',
					style: TextStyle(
						fontSize: 25.0,
						fontWeight: FontWeight.normal,
						color: Colors.black.withOpacity(0.5),
					)
			 )
		  ],
	  );
  }

  Widget buildLoginInput() {
	  return Column(
		  children: <Widget>[
			  Container(
				  margin: EdgeInsets.fromLTRB(0, 0, 7, 0),
				  decoration: BoxDecoration(
					  border: BorderDirectional(bottom: BorderSide(color: Color(0xFFb0c0d0), width: 1.0, style: BorderStyle.solid))
				  ),
				  child: Row(
					children: <Widget>[
						Container(
							width: 26,
							height: 37,
							decoration: BoxDecoration(
								image: DecorationImage(
									image: AssetImage('assets/login_btn.png'),
									fit: BoxFit.cover
								),
								shape: BoxShape.rectangle
							),
						),
						SizedBox(width: 10.0),
						Text('Account')
					],
				),
			  ),
			  SizedBox(height: 15.0),
			  Container(
				  margin: EdgeInsets.fromLTRB(0, 0, 7, 0),
				  decoration: BoxDecoration(
					  border: BorderDirectional(bottom: BorderSide(color: Color(0xFFb0c0d0), width: 1.0, style: BorderStyle.solid))
				  ),
				  child: Row(
					children: <Widget>[
						Container(
							width: 26,
							height: 37,
							decoration: BoxDecoration(
								image: DecorationImage(
									image: AssetImage('assets/password_btn.png'),
									fit: BoxFit.cover
								),
								shape: BoxShape.rectangle
							),
						),
						SizedBox(width: 10.0),
						Text('Password')
					],
				)
			  )
		  ],
	  );
  }

  Widget buildLoginButton() {
	  return Column(
		  children: <Widget>[
			  InkWell(
				  child: this.buildLoginTopButton(),
				  onTap: () {},
			  ),
			  InkWell(
				  child: this.buildLoginBtottomButton(),
				  onTap: () {},
			  ),
			  InkWell(
				  child: this.buildForginButton(),
			  )
		  ],
	  );
  }

  /// 顶部登录按钮
  Widget buildLoginTopButton() {
	  double buttonWidth = MediaQuery.of(context).size.width - 40;
	  return Column(
		  children: <Widget>[
			  Container(
				  margin: EdgeInsets.fromLTRB(59.0, 0, 7.0, 0),
				  width: buttonWidth,
				  height: 8,
				  decoration: BoxDecoration(
					  color: Color(0xFF0061f8),
					  shape: BoxShape.rectangle,
					  border: BorderDirectional(bottom: BorderSide(color: Color(0xFF0061f8), width: 0.0, style: BorderStyle.solid))
				  ),
				  child: Container(
					  decoration: BoxDecoration(
						  color: Colors.white,
						//   borderRadius: BorderRadius.only(bottomRight: Radius.circular(10.0)),
					  	  border: BorderDirectional(bottom: BorderSide(color: Colors.white, width: 0.0, style: BorderStyle.solid))
					  ),
				  ),
			  ),
			  Container(
				  margin: EdgeInsets.fromLTRB(0.0, 0, 7.0, 0),
				  width: buttonWidth,
				  height: 48,
				  decoration: BoxDecoration(
					  color: Color(0xFF0061f8),
					  shape: BoxShape.rectangle,
					//   borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0), bottomLeft: Radius.circular(10.0))
				  ),
				  child: Center(
					  child: this.buildButtonText('Log in', Colors.white),
				  ),
			  ),
			  Container(
				  margin: EdgeInsets.fromLTRB(59.0, 0, 7.0, 0),
				  width: buttonWidth,
				  height: 8,
				  decoration: BoxDecoration(
					  color: Color(0xFF0061f8),
					  shape: BoxShape.rectangle,
					  border: BorderDirectional(top: BorderSide(color: Color(0xFF0061f8), width: 0.0, style: BorderStyle.solid))
				  ),
				  child: Container(
					  decoration: BoxDecoration(
						  color: Colors.white,
						//   borderRadius: BorderRadius.only(topRight: Radius.circular(10.0)),
					  	  border: BorderDirectional(top: BorderSide(color: Colors.white, width: 0.0, style: BorderStyle.solid))
					  ),
				  ),
			  )
		  ],
	  );
  }

  Widget buildLoginBtottomButton() {
	  return Container(
		  padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
		  child: this.buildButtonText('Sign up', Colors.black),
	  );
  }

  Widget buildForginButton() {
	  return Container(
		  padding: EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 0.0),
		  child: this.buildButtonText('forget password', Colors.black.withOpacity(0.3)),
	  );
  }

  Widget buildButtonText(String labelStr, Color colorValue) {
	  return Text(labelStr, style: TextStyle(
			fontSize: 15.0,
			fontWeight: FontWeight.normal,
			color: colorValue
		));
  }
}
