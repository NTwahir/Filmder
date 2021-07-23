import 'package:flutter/material.dart';
import '../theme/colors.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    Color mainColor = themeColor(context)['mainColor'];
    Color subColor = themeColor(context)['subColor'];
    return Scaffold(
      appBar: getAppBar(mainColor: mainColor, subColor: subColor),
      body: getBody(context),
      backgroundColor: mainColor,
      bottomSheet: getFooter(context, mainColor: mainColor, subColor: subColor),
    );
  }

  Widget getFooter(context, {mainColor, subColor}) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 100,
      decoration: BoxDecoration(color: mainColor),
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
                color: subColor,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFF4DD0E1),
                    spreadRadius: 2,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Icon(
                Icons.refresh,
                color: Colors.white,
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

  PreferredSizeWidget getAppBar({mainColor, subColor}) {
    // Icons of appbar
    var icons = [
      pageIndex == 0 ? Icons.movie : Icons.movie_outlined,
      pageIndex == 1 ? Icons.favorite : Icons.favorite_border_outlined,
      pageIndex == 2 ? Icons.calendar_today : Icons.calendar_today_outlined,
      pageIndex == 3 ? Icons.person : Icons.person_outlined,
    ];
    return AppBar(
      elevation: 0,
      backgroundColor: mainColor,
      title: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(icons.length, (index) {
            return IconButton(
              onPressed: () {
                setState(() {
                  pageIndex = index;
                });
              },
              icon: Icon(icons[index], size: 30, color: subColor),
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
    var size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        width: size.width * 0.75,
        height: size.height * 0.75,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Stack(
            children: [
              Container(
                width: size.width,
                height: size.height,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://m.media-amazon.com/images/G/01/imdb/images/social/imdb_logo._CB410901634_.png'),
                      fit: BoxFit.cover),
                ),
              )
            ],
          ),
        ),
      ),
    );
    // Card(
    //   semanticContainer: true,
    //   elevation: 5,
    //   shape: RoundedRectangleBorder(
    //     borderRadius: BorderRadius.circular(15),
    //   ),
    //   clipBehavior: Clip.antiAliasWithSaveLayer,
    //   child: Image.network(
    //       'https://m.media-amazon.com/images/G/01/imdb/images/social/imdb_logo._CB410901634_.png'),
    // );
  }
}
