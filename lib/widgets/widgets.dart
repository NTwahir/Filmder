import 'package:filmder/theme/colors.dart';
import 'package:filmder/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget appBar(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(
        Icons.movie,
        size: 28,
        color: isLightTheme(context) ? Colors.black : Colors.white,
      ),
      RichText(
        text: const TextSpan(
          style: TextStyle(fontSize: 28),
          children: <TextSpan>[
            TextSpan(
                text: 'Film',
                style:
                    TextStyle(fontWeight: FontWeight.w600, color: Colors.grey)),
            TextSpan(
                text: 'Der',
                style: TextStyle(fontWeight: FontWeight.w600, color: hexColor)),
          ],
        ),
      ),
    ],
  );
}
