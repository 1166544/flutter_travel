import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class CommonLoading extends StatelessWidget {
	const CommonLoading({Key key}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return Center(
			child: Container(
				width: 150,
				height: 150,
				child: FlareActor(
						"assets/animations/flare_loading.flr", 
						alignment:Alignment.center, 
						fit:BoxFit.contain, 
						animation:"Alarm"
					),
			)
		);
	}
}
