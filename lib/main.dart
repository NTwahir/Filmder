import 'package:filmder/screens/login_screen.dart';
import 'package:filmder/screens/sign_in.dart';
import 'package:filmder/screens/home.dart';
import 'package:filmder/screens/sign_up.dart';
import 'package:filmder/screens/welcome.dart';
import 'package:filmder/services/auth.dart';
import 'package:filmder/theme/colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(MaterialApp(
    theme: ThemeData(
      primaryColor: hexColor,
      scaffoldBackgroundColor: Colors.white,
    ),
    darkTheme: ThemeData.dark(),
    routes: {
      '/': (context) => LoginScreen(),
      '/second': (context) => SignUp(),
    },
  ));
}

//TODO: page design
//TODO: wc_form_validators
//TODO: choose fonts/ design 
//TODO: api config
//TODO: implement db of some kind
