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
      body: Panel(),
      backgroundColor: accentColor,
    );
  }
}

class Panel extends StatefulWidget {
  @override
  _PanelState createState() => _PanelState();
}

class _PanelState extends State<Panel> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.network(
              'https://m.media-amazon.com/images/G/01/imdb/images/social/imdb_logo._CB410901634_.png'),
          Text('movie name')
        ],
      ),
    );
  }
}
