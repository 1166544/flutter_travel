import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_travel/styles/StyleColors.dart';

final ThemeData kIOSTheme = ThemeData(
  primarySwatch: colorStyles['primary'],
  primaryColor: colorStyles['primary'],
  primaryColorBrightness: Brightness.light,
);

final ThemeData kDefaultTheme = ThemeData(
  primarySwatch: colorStyles['primary'],
  accentColor: colorStyles['primary'],
);

/// App bar that uses iOS styling on iOS
class PlatformAdaptiveAppBar extends AppBar {
  PlatformAdaptiveAppBar({
    Key key,
    TargetPlatform platform,
    List<Widget> actions,
    Widget title,
    Widget body,
    Widget bottom,
    Color backgroundColor,
    bool centerTitle,
    IconThemeData iconTheme,
    TextTheme textTheme
  })
      : super(
          key: key,
          elevation: platform == TargetPlatform.iOS ? 0.0 : 4.0,
          title: title,
          actions: actions,
          bottom: bottom,
          backgroundColor: backgroundColor,
          centerTitle: centerTitle ?? true,
          iconTheme: iconTheme,
          textTheme: textTheme
        );
}