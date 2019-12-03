import 'package:flutter/material.dart';
import 'package:flutter_travel/pages/modules/login/LoginFormContainer.dart';
import 'package:flutter_travel/styles/StyleColors.dart';

class LoginScreen extends StatelessWidget {
    LoginScreen({Key key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: Container(
                child: Padding(
                    padding: EdgeInsets.fromLTRB(32.0, MediaQuery.of(context).padding.top + 32.0, 32.0, 32.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                            Expanded(
                                child: Center(
                                    child: FlutterLogo(
                                        colors: colorStyles['primary'],
                                        size: 200.0,
                                    ),
                                ),
                            ),
                            LoginForm()
                        ],
                    )
                )
            )
        );
    }

}