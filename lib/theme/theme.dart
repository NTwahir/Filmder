import 'package:filmder/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final appBarTheme = AppBarTheme(
  centerTitle: false,
  elevation: 0,
  backgroundColor: Colors.white,
);

final tabBarTheme = TabBarTheme(
  indicatorSize: TabBarIndicatorSize.label,
  unselectedLabelColor: Colors.black54,
  indicator: BoxDecoration(
    borderRadius: BorderRadius.circular(50),
    color: hexColor,
  ),
);

final dividerTheme = DividerThemeData().copyWith(thickness: 1.0, indent: 75.0);

ThemeData lightTheme(BuildContext context) => ThemeData.light().copyWith(
      primaryColor: hexColor,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: appBarTheme,
      tabBarTheme: tabBarTheme,
      dividerTheme: dividerTheme.copyWith(color: IconLight),
      iconTheme: IconThemeData(color: IconLight),
      textTheme: GoogleFonts.comfortaaTextTheme(Theme.of(context).textTheme)
          .apply(displayColor: Colors.black),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );

ThemeData darkTheme(BuildContext context) => ThemeData.dark().copyWith(
    primaryColor: hexColor,
    scaffoldBackgroundColor: Colors.black,
    tabBarTheme: tabBarTheme.copyWith(unselectedLabelColor: Colors.white70),
    appBarTheme: appBarTheme.copyWith(backgroundColor: AppBarDark),
    dividerTheme: dividerTheme.copyWith(color: itemDark),
    iconTheme: IconThemeData(color: Colors.black),
    textTheme: GoogleFonts.ralewayTextTheme(Theme.of(context).textTheme)
        .apply(displayColor: Colors.white),
    visualDensity: VisualDensity.adaptivePlatformDensity);

bool isLightTheme(BuildContext context) {
  return MediaQuery.of(context).platformBrightness == Brightness.light;
}
