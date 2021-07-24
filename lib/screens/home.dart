import 'package:filmder/screens/sign_in.dart';
import 'package:filmder/services/auth.dart';
import 'package:flutter/material.dart';
import '../theme/colors.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  AuthService authService = new AuthService();
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      body: getBody(context),
      backgroundColor: accentColor,
      bottomSheet: getFooter(context),
    );
  }

  Widget getFooter(context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 120,
      decoration: BoxDecoration(color: hexColor),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(5, (index) {
            return Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 5,
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Icon(
                Icons.refresh,
                color: Colors.grey,
              ),
            );
          }),
        ),
      ),
    );
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

  PreferredSizeWidget getAppBar() {
    // Icons of appbar
    var icons = [
      pageIndex == 0 ? Icons.movie : Icons.movie_outlined,
      pageIndex == 1 ? Icons.favorite : Icons.favorite_border_outlined,
      pageIndex == 2 ? Icons.calendar_today : Icons.calendar_today_outlined,
      pageIndex == 3 ? Icons.person : Icons.person_outlined,
    ];
    return AppBar(
      backgroundColor: hexColor,
      title: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(icons.length, (index) {
            return IconButton(
              onPressed: () {
                authService.signOut();
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => SignIn()));
                setState(() {
                  pageIndex = index;
                });
              },
              icon: Icon(icons[index], size: 30),
            );
          }),
        ),
      ),
    );
  }
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
