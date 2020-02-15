import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_travel/modules/common/CommonImageNetwork.dart';
import 'package:flutter_travel/modules/common/CommonText.dart';
import 'package:flutter_travel/redux/states/StateApp.dart';
import 'package:flutter_travel/core/manager/ManagerEnviroment.dart';

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
									width: 80,
									height: 100,
									decoration: BoxDecoration(
										image: DecorationImage(
											image: AssetImage('assets/images/tran_logo.png'),
											fit: BoxFit.fill
										)
									),
								),
								SizedBox(width: 9),
								CommonText('X', style: TextStyle(color: Colors.grey, fontSize: 20, fontWeight: FontWeight.w100)),
								SizedBox(width: 16),
								Container(
									width: 80,
									height: 80,
									decoration: BoxDecoration(
										image: DecorationImage(
											image: CommentImageNetwork.imageNetwork(ManagerEnviroment.instance.getEnv().loginLogoUrl()),
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

				return CommonText(
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