import 'package:filmder/screens/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData.light(),
    darkTheme: ThemeData.dark(),
    routes: {
      '/': (context) => Home(),
    },
  ));
}

//TODO: page design
//TODO: wc_form_validators
//TODO: choose fonts/ design 
//TODO: api config
//TODO: implement db of some kind
