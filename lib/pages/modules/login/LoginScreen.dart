import 'package:flutter/material.dart';
import 'package:flutter_travel/pages/modules/login/LoginFormContainer.dart';

class LoginScreen extends StatelessWidget {
    LoginScreen({Key key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: Container(
				decoration: BoxDecoration(
					color: Color(0xFFebeff8)
				),
                child: Padding(
                    padding: EdgeInsets.fromLTRB(0.0, MediaQuery.of(context).padding.top + 32.0, 0.0, 32.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                            this.getWelcomeWidget(context),
							this.getLogoWidget(context),
                            LoginForm(),
                        ],
                    )
                )
            )
        );
    }

	/// 欢迎部份
	Widget getWelcomeWidget(BuildContext context) {
		return Container(
			width: MediaQuery.of(context).size.width,
			padding: EdgeInsets.fromLTRB(40.0, 15.0, 30.0, 18.0),
			decoration: BoxDecoration(
				color: Colors.white
			),
			child: Column(
				crossAxisAlignment: CrossAxisAlignment.start,
				mainAxisAlignment: MainAxisAlignment.start,
				children: <Widget>[
					Container(
						width: 49.0,
						height: 39.0,
						decoration: BoxDecoration(
							image: DecorationImage(
								image: AssetImage('assets/cloud.png'),
								fit: BoxFit.cover
							)
						),
					),
					SizedBox(height: 26.0),
					Text(
						'Welcome,',
						style: TextStyle(
							color: Colors.black,
							fontWeight: FontWeight.bold,
							fontSize: 30.0
						),
					 ),
					 SizedBox(height: 7.0),
					 Text(
						'sign in to continue',
						style: TextStyle(
							color: Color(0xFF7a8099),
							fontWeight: FontWeight.bold,
							fontSize: 26.0
						),
					 )
				],
			),
		);
	}

	/// LOGO部份
	Widget getLogoWidget(BuildContext context) {
		return Container(
			width: MediaQuery.of(context).size.width,
			padding: EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 30.0),
			child: Center(
				child: Container(
					width: 132,
					height: 167,
					decoration: BoxDecoration(
						image: DecorationImage(
							image: AssetImage('assets/tran_logo.png'),
							fit: BoxFit.cover
						)
					),
				),
			),
		);
	}

}