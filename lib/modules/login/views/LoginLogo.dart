import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_travel/redux/states/StateApp.dart';
import 'package:flutter_travel/services/ServiceEnviroment.dart';

class LoginLogo extends StatelessWidget {
	LoginLogo({Key key}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return Container(
			width: MediaQuery.of(context).size.width,
			padding: EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 30.0),
			child: Center(
				child: Column(
					children: <Widget>[
						Row(
							mainAxisAlignment: MainAxisAlignment.center,
							children: [
								Container(
									width: 132,
									height: 167,
									decoration: BoxDecoration(
										image: DecorationImage(
											image: AssetImage('assets/images/tran_logo.png'),
											fit: BoxFit.cover
										)
									),
								),
								SizedBox(width: 9),
								Text('X', style: TextStyle(color: Colors.grey, fontSize: 40, fontWeight: FontWeight.w100)),
								SizedBox(width: 16),
								Container(
									width: 120,
									height: 120,
									decoration: BoxDecoration(
										image: DecorationImage(
											image: NetworkImage(ServiceEnviroment.instance.getEnv().loginLogoUrl()),
											fit: BoxFit.cover,
										),
										borderRadius: BorderRadius.circular(100.0)
									),
								),
							]
						),
						Padding(
							padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
							child: this.getLoginStatus(),
						),
					],
				),
			),
		);
	}

	/// 登录状态提示
	Widget getLoginStatus() {
		return StoreConnector<AppState, dynamic>(
			converter: (store) {
				String errorText;

				if (store != null && store.state != null && store.state.auth != null && store.state.auth.error != null) {
					errorText = store.state.auth.error;
				}

				return errorText;
			},
			builder: (context, errorText) {

				String displayText = errorText != null ? errorText : '';

				return Text(
					displayText,
					style: TextStyle(
						color: Colors.red,
						fontSize: 15.0
					)
				);
			},
		);
	}
}