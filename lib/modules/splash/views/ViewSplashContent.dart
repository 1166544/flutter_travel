import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_travel/core/api/ApiEnum.dart';
import 'package:flutter_travel/core/bloc/BlocProvider.dart';
import 'package:flutter_travel/modules/common/CommonTravelItem.dart';
import 'package:flutter_travel/modules/splash/blocs/BlocSplashList.dart';
import 'package:flutter_travel/modules/splash/models/ModelsBing.dart';
import 'package:flutter_travel/modules/splash/models/ModelsBingItem.dart';
import 'package:flutter_travel/routers/Routers.dart';
import 'package:flutter_travel/core/manager/ManagerEnviroment.dart';

/// 闪屏页内容
class ViewSplashContent extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<ViewSplashContent> with CommonTravelItem, SingleTickerProviderStateMixin {

	BlocSplashList blocGalleryList;
	int maxTickTime = 10;
	int currentCountDown = 10;
	Timer timer;
	bool isFirstLoaded = false;
	AnimationController controller;
	Animation animation;

	/// 倒计时
	startTime() async {
		this.timer = new Timer.periodic(new Duration(seconds: 1), navigationPage);
		return this.timer;
	}

	/// 倒计时处理
	void navigationPage(dynamic timer) {
		if (timer.tick >= this.maxTickTime) {
			this.navigateToHome();
		} else {
			setState(() {
				this.currentCountDown = maxTickTime - timer.tick;
			});
		}
	}

	/// 跳转至首页
	void navigateToHome() {
		Navigator.of(context).pushReplacementNamed(Routers.mainPage);
	}

	@override
	void initState() {
		super.initState();
		this.controller = AnimationController(
			vsync: this,
			duration: Duration(seconds: 1)
		);
		this.animation = Tween(begin: 0.0, end: 1.0).animate(this.controller);
		startTime();
	}

	@override
	void dispose() {
		this.controller.dispose();
		this.timer.cancel();
		super.dispose();
		this.blocGalleryList.dispose();
	}

	@override
	Widget build(BuildContext context) {

		if (!this.isFirstLoaded) {
			this.blocGalleryList = BlocProvider.of<BlocSplashList>(context);
			this.blocGalleryList.init({});
			this.isFirstLoaded = true;
		}

		return this.getStreamBuilder();
	}

	/// 流式布局结构
	Widget getStreamBuilder() {
		return StreamBuilder<ModelsBing>(
			stream: this.blocGalleryList.outStream,
			builder: (context, snapshot) {
				if (snapshot.hasData) {
					this.controller.forward();
					return FadeTransition(
						opacity: this.animation, 
						child: this.buildLayout(snapshot)
					);
				} else {
					return this.buildEmptyLayout(context);
				}
			},
		);
	}

	Widget buildLayout(dynamic snapshot) {
		ModelsBingItem data = snapshot.data.images[0];
		String url = '${ManagerEnviroment.instance.getEnv().getServerUrl(API_ENUM.BING)}${data.url}';

		return Container(
			width: MediaQuery.of(this.context).size.width,
			height: MediaQuery.of(this.context).size.height,
			child: Stack(
				fit: StackFit.expand,
				children: <Widget>[
					Image.network(url, fit: BoxFit.cover),
					Column(
						children: <Widget>[
							GestureDetector(
								child: Container(
									padding: EdgeInsets.fromLTRB(0, 50.0, 30.0, 0),
									child: Row(
										mainAxisAlignment: MainAxisAlignment.end,
										children: <Widget>[
											Text(this.currentCountDown.toString(), style: TextStyle(color: Color(0xFFdedede), fontSize: 16.0)),
											Text('S 跳过', style: TextStyle(color: Color(0xFFdedede), fontSize: 16.0))
										],
									),
								),
								onTap: this.navigateToHome,
							),
							Spacer(),
							Container(
								decoration: BoxDecoration(
									color: Colors.black.withOpacity(0.3),
									shape: BoxShape.rectangle
								),
								padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0),
								width: MediaQuery.of(this.context).size.width,
								height: 180.0,
								child: Text(data.copyright, style: TextStyle(color: Colors.white, fontSize: 14.0)),
							)
						],
					)
				],
			),
		);
	}
}