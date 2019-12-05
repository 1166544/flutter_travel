import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_travel/core/navigation/NavigationTabCore.dart';
import 'package:flutter_travel/redux/states/StateApp.dart';
import 'package:redux/redux.dart';

class LoginPage extends StatefulWidget {
	final Store<AppState> store;

	LoginPage({Key key, this.store}) : super(key: key);

	_LoginPageState createState() => _LoginPageState(this.store);
}

/// 登录页面，无APPBAR
class _LoginPageState extends State<LoginPage> {
	final Store<AppState> store;
	_LoginPageState(Store<AppState> store) : store = store;

	TextEditingController userNameController = TextEditingController();
	//   TextEditingController passwordController = TextEditingController();

	@override
	Widget build(BuildContext context) {
		return StoreProvider<AppState>(
			store: this.store,
			child: this.getLoginEntrance(context)
		);
  	}

	/// 登录页面入口
	Widget getLoginEntrance(BuildContext context) {
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
			  this.buildBackgroundByTemplate(Colors.lightBlue, rightWidth),
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

  /// 登录标题
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
			this.getUpdatedLabel()
		  ],
	  );
  }

	/// 动态绑定数据源使用
	Widget getUpdatedLabel() {
		return StoreConnector<AppState, dynamic>(
			converter: (store) => store.state.auth,
			builder: (context, count) {
				return Text(
					'UN   ICN_PART ${count.toString()}',
					style: TextStyle(
						fontSize: 25.0,
						fontWeight: FontWeight.normal,
						color: Colors.black.withOpacity(0.5),
					)
				);
			}
		);
	}

  /// 登录输入
  Widget buildLoginInput() {
	  return Column(
		  children: <Widget>[
			  this.buildUserNameInput(),
			  SizedBox(height: 15.0),
			  this.buildPasswordInput()
		  ],
	  );
  }

  /// 用户名输入
  Widget buildUserNameInput() {
	  return Container(
		  padding: EdgeInsets.fromLTRB(0.0, 0.0, 7.0, 0.0),
		  child: TextField(
			controller: this.userNameController,
			textAlign: TextAlign.left,
			style: TextStyle(fontSize: 12.0, color: Colors.black),
			decoration: InputDecoration(
				fillColor: Colors.white.withOpacity(0.0),
				filled: true,
				labelText: 'Account',
				prefixIcon: Image.asset('assets/login_btn.png', width: 1.0, height: 1.0),
				suffixText: 'Enter user name',
			),
			onChanged: (text) {
				print('change $text');
			},
			onSubmitted: (text) {
				print('submit $text');
			}
		),
	  );
  }

  /// 密码框
  Widget buildPasswordInput() {
	  return Padding(
		  padding: EdgeInsets.fromLTRB(0.0, 0.0, 7.0, 0.0),
		  child: TextField(
			controller: this.userNameController,
			textAlign: TextAlign.left,
			style: TextStyle(fontSize: 12.0, color: Colors.black),
			obscureText: true,
			decoration: InputDecoration(
				fillColor: Colors.white.withOpacity(0.0),
				filled: true,
				labelText: 'Password',
				prefixIcon: Image.asset('assets/password_btn.png', width: 2.0, height: 2.0),
				suffixText: 'Enter password',
			),
			onChanged: (text) {
				print('change $text');
			},
			onSubmitted: (text) {
				print('submit $text');
			}
		),
	  );
  }

  /// 登录按钮
  Widget buildLoginButton() {
	  return Column(
		  children: <Widget>[
			  InkWell(
				  child: this.buildLoginTopButton(),
				  onTap: () {
					  // 跳转至主页面
					  Navigator.push(context, MaterialPageRoute(
						  builder: (context) {
							  return NavigationTabCore();
						  }
					  ));
				  },
			  ),
			  InkWell(
				  child: this.buildLoginBtottomButton(),
				  onTap: () {},
			  ),
			  InkWell(
				  child: this.buildForgotButton(),
			  )
		  ],
	  );
  }

  /// 顶部登录按钮
  Widget buildLoginTopButton() {
	  double buttonWidth = MediaQuery.of(context).size.width - 40;
	  return Column(
		  children: <Widget>[
        		// 饰修性背景
			  Container(
				  margin: EdgeInsets.fromLTRB(59.0, 0, 7.0, 0),
				  width: buttonWidth,
				  height: 8,
				  decoration: BoxDecoration(
					  color: Colors.lightBlue,
					  shape: BoxShape.rectangle,
					  border: BorderDirectional(bottom: BorderSide(color: Colors.lightBlue, width: 0.0, style: BorderStyle.solid))
				  ),
				  //  圆角背景
				  child: Container(
					  decoration: BoxDecoration(
						  color: Colors.white,
						  borderRadius: BorderRadius.only(bottomRight: Radius.circular(10.0)),
					  	  border: BorderDirectional(bottom: BorderSide(color: Colors.white, width: 0.0, style: BorderStyle.solid))
					  ),
				  ),
			  ),
			  // 登录提示文字
			  Container(
				  margin: EdgeInsets.fromLTRB(0.0, 0, 7.0, 0),
				  width: buttonWidth,
				  height: 48,
				  decoration: BoxDecoration(
					  color: Colors.lightBlue,
					  shape: BoxShape.rectangle,
					  borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0), bottomLeft: Radius.circular(10.0))
				  ),
				  child: Center(
					  child: this.buildButtonText('Log in', Colors.white),
				  ),
			  ),
        	  // 圆角背景
			  Container(
				  margin: EdgeInsets.fromLTRB(59.0, 0, 7.0, 0),
				  width: buttonWidth,
				  height: 8,
				  decoration: BoxDecoration(
					  color: Colors.lightBlue,
					  shape: BoxShape.rectangle,
					  border: BorderDirectional(top: BorderSide(color: Colors.lightBlue, width: 0.0, style: BorderStyle.solid))
				  ),
          		// 容器内容
				  child: Container(
					  decoration: BoxDecoration(
						  color: Colors.white,
						  borderRadius: BorderRadius.only(topRight: Radius.circular(10.0)),
					  	  border: BorderDirectional(top: BorderSide(color: Colors.white, width: 0.0, style: BorderStyle.solid))
					  ),
				  ),
			  )
		  ],
	  );
  }

  /// 登录底部按钮
  Widget buildLoginBtottomButton() {
	  return Container(
		  padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
		  child: this.buildButtonText('Sign up', Colors.black),
	  );
  }

  /// 忘记密码按钮
  Widget buildForgotButton() {
	  return Container(
		  padding: EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 0.0),
		  child: this.buildButtonText('Forget password?', Colors.black.withOpacity(0.3)),
	  );
  }

  /// 按钮文字
  Widget buildButtonText(String labelStr, Color colorValue) {
	  return Text(labelStr, style: TextStyle(
			fontSize: 15.0,
			fontWeight: FontWeight.normal,
			color: colorValue
		));
  }
}
