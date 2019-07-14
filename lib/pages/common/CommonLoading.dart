import 'package:flutter/material.dart';

class CommonLoading extends StatelessWidget {
  const CommonLoading({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
	return Container(
	  child: Column(
			mainAxisAlignment: MainAxisAlignment.center,
			crossAxisAlignment: CrossAxisAlignment.center,
			children: [
				Container(
					width: MediaQuery.of(context).size.width,
					child: Text(
						'loading...',
						textAlign: TextAlign.center,
					),
				)
			],
		),
	);
  }
}
