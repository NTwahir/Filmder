import 'package:filmder/screens/sign_in.dart';
import 'package:filmder/screens/home.dart';
import 'package:filmder/screens/sign_up.dart';
import 'package:filmder/theme/colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(),
    darkTheme: ThemeData.dark(),
    routes: {
      '/': (context) => SignIn(),
      '/second': (context) => SignUp(),
    },
  ));
}

//TODO: page design
//TODO: wc_form_validators
//TODO: choose fonts/ design 
//TODO: api config
//TODO: implement db of some kind
