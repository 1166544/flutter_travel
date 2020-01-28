import 'package:flutter/material.dart';
import 'package:flutter_travel/modules/weather/view/components/ComponentEemptyWidget.dart';

/// 分隔符
class ComponentValueTile extends StatelessWidget {
  final String label;
  final String value;
  final IconData iconData;

  ComponentValueTile(this.label, this.value, {this.iconData});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          this.label,
          style: TextStyle(
              color: Colors.black,
        )),
        SizedBox(
          height: 5,
        ),
        this.iconData != null
            ? Icon(
                iconData,
                color: Colors.black,
                size: 20,
              )
            : ComponentEemptyWidget(),
        SizedBox(
          height: 10,
        ),
        Text(
          this.value,
          style:
              TextStyle(color: Colors.black),
        ),
      ],
    );
  }
}
