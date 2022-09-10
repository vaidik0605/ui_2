import 'package:flutter/material.dart';

class Themes {
  final lightTheme = ThemeData.light().copyWith(
    textTheme: const TextTheme(
      bodyText2: TextStyle(
        color: Colors.black,
      ),
    ),
  );
  final darkTheme = ThemeData.dark().copyWith(
    textTheme: const TextTheme(
      bodyText2: TextStyle(
        color: Colors.white,
      ),
    ),
  );
}
