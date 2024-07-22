import 'package:flutter/material.dart';
/* 
ThemeData lightMode = ThemeData(
    colorScheme: ColorScheme.light(
        primary: Color(0xFFFF7900),
        background: Colors.white,
        secondary: Colors.orange.shade200,
        inversePrimary: Colors.black,
        tertiary: Colors.white)); */

ThemeData lightMode = ThemeData(
    colorScheme: ColorScheme.light(
        primary: Colors.deepPurple,
        background: Colors.white,
        secondary: Colors.orange.shade200,
        inversePrimary: Colors.black,
        surface: Colors.grey.shade300,
        tertiary: Colors.white,
        inverseSurface: Colors.black),
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.deepPurple,
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 20)));
