import 'package:flutter/material.dart';
import '../theme/colors.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: hexColor,
        title: Center(child: Text('Filmder')),
      ),
      body: Text('this is home page'),
      backgroundColor: accentColor,
    );
  }
}
