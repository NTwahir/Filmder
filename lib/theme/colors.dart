import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const subColor = Color(0xFFE040FB);
const hexColor = const Color(0xFF7B1FA2);
const accentColor = const Color(0xFF424242);
const AppBarDark = Color(0xFF111111);
const IconLight = Color(0xFF999999);
const itemDark = Color(0xFF262629);

final kTitleTextStyle = GoogleFonts.comfortaa(
    color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold);

final kHintTextStyle = GoogleFonts.comfortaa(
  color: Colors.white54,
);

final kLabelStyle = GoogleFonts.comfortaa(
  color: Colors.white,
  fontWeight: FontWeight.bold,
);

final kBoxDecorationStyle = BoxDecoration(
  color: Color(0xFFAB47BC),
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);
