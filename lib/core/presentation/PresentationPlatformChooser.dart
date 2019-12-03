import 'package:flutter/material.dart';

class PlatformChooser extends StatelessWidget {
  PlatformChooser({Key key, this.iosChild, this.defaultChild});
  final Widget iosChild;
  final Widget defaultChild;

  @override
  Widget build(BuildContext context) {
    if (Theme.of(context).platform == TargetPlatform.iOS) return iosChild;
    return defaultChild;
  }
}