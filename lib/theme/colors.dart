import 'package:flutter/material.dart';

Map themeColor(context) {
  bool isLightTheme =
      MediaQuery.of(context).platformBrightness == Brightness.light;

  return {
    'mainColor': isLightTheme ? Color(0xFF80DEEA) : Color(0xFF00ACC1),
    'subColor': isLightTheme ? Color(0xFFFFFFFF) : Color(0xFF424242),
  };
}
