import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
    colorScheme: ColorScheme.light(
        primary: Colors.deepPurple,
        background: Color(0xFF1E1E1E),
        secondary: Colors.orange.shade200,
        inversePrimary: Colors.white,
        surface: Colors.grey.shade300,
        tertiary: Colors.white,
        inverseSurface: Colors.black),
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.deepPurple,
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 20)));
