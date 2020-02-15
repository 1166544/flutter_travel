import 'package:flutter/material.dart';
import 'package:flutter_travel/modules/common/CommonText.dart';
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
        CommonText(
          this.label,
          style: TextStyle(
              color: Colors.black.withOpacity(0.3),
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
          height: 2,
        ),
        CommonText(
          this.value,
          style:
              TextStyle(color: Colors.black),
        ),
      ],
    );
  }
}
