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
      body: getBody(context),
      backgroundColor: accentColor,
    );
  }
}

Widget getBody(context) {
  var size = MediaQuery.of(context).size;
  return Padding(
    padding: const EdgeInsets.only(bottom: 120),
    child: Container(
      height: size.height,
      child: MovieCard(),
    ),
  );
}

class MovieCard extends StatefulWidget {
  @override
  _MovieCardState createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      semanticContainer: true,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Image.network(
          'https://m.media-amazon.com/images/G/01/imdb/images/social/imdb_logo._CB410901634_.png'),
    );
  }
}
