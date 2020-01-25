import 'package:flutter/material.dart';
import 'package:flutter_travel/modules/login/views/LoginFormContainer.dart';
import 'package:flutter_travel/modules/login/views/LoginLogo.dart';
import 'package:flutter_travel/modules/login/views/LoginWelcome.dart';

/// 登录页
class LoginPage extends StatelessWidget {
    LoginPage({Key key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: Container(
				decoration: BoxDecoration(
					color: Color(0xFFebeff8)
				),
                child: Padding(
                    padding: EdgeInsets.fromLTRB(0.0, MediaQuery.of(context).padding.top + 32.0, 0.0, 32.0),
                    child: ListView(
                        children: <Widget>[
                            LoginWelcome(),
							LoginLogo(),
                            LoginForm(),
                        ],
                    )
                )
            )
        );
    }

}