// Bottom navigation bar that is Material on Android and Cupertino on iOS.
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlatformAdaptiveBottomBar extends StatelessWidget {
  PlatformAdaptiveBottomBar({Key key, this.activeColor, this.currentIndex, this.onTap, this.items})
      : super(key: key);
  final Color activeColor;
  final int currentIndex;
  final Function onTap;
  final List<BottomNavigationBarItem> items;

  @override
  Widget build(BuildContext context) {
    if (Theme.of(context).platform == TargetPlatform.iOS) {
      return CupertinoTabBar(
        activeColor: activeColor,
        currentIndex: currentIndex,
        onTap: onTap,
        items: items,
      );
    } else {
      return BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: onTap,
        items: items,
      );
    }
  }
}