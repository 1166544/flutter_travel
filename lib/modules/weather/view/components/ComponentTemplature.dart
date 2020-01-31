import 'dart:async';

import 'package:flutter/material.dart';

/// 温度动画
class ComponentTemplature extends StatefulWidget {
	final int templature;
	ComponentTemplature({Key key, this.templature}) : super(key: key);

	_ComponentTemplatureState createState() => _ComponentTemplatureState();
}

class _ComponentTemplatureState extends State<ComponentTemplature> with TickerProviderStateMixin {
	AnimationController controller;
  	Animation<Offset> animation;
	Timer timer;

	/// 倒计时
	startTime() {
		this.timer = new Timer(new Duration(seconds: 1), () {
			this.timer.cancel();
			this.controller.forward();	
		});
	}
	
	@override
	void initState() {
		super.initState();
		this.controller = AnimationController(duration: Duration(milliseconds: 3000), vsync: this);
		this.controller.addStatusListener((status) {
			// print(status);	
		});

    	Animation curve = new CurvedAnimation(parent: controller, curve: Curves.linearToEaseOut);
		this.animation = Tween(begin: Offset.zero, end: Offset(0.0, -0.875)).animate(curve);

		this.startTime();
	}

	@override
	void dispose() {
		super.dispose();
		this.timer.cancel();
		this.controller.dispose();
	}

	@override
	Widget build(BuildContext context) {
		List<Widget> renderList = [];
		for (var i = 0; i < widget.templature; i++) {
			renderList.add(
				Text(
					'${i.toString()}',
					style: TextStyle(
						fontSize: 100,
						fontWeight: FontWeight.w100,
						color: Colors.black,
					)
				)
			);
		}

		return ClipRect(
			child: Align(
				alignment: Alignment.topLeft,
				heightFactor: 0.1,
				child: SlideTransition(
					position: this.animation,
					child: Column(
						children: renderList,
					)
				)
			)
		);
	}
}
