import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Button that is Material on Android and Cupertino on iOS
/// On Android an icon button; on iOS, text is used
class PlatformAdaptiveButton extends StatelessWidget {
  PlatformAdaptiveButton({Key key, this.child, this.icon, this.onPressed})
      : super(key: key);
  final Widget child;
  final Widget icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    if (Theme.of(context).platform == TargetPlatform.iOS) {
      return CupertinoButton(
        child: child,
        onPressed: onPressed,
      );
    } else {
      return IconButton(
        icon: icon,
        onPressed: onPressed,
      );
    }
  }
}