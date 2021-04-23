import 'package:flutter/material.dart';

class MyTheme {
  ThemeData buildTheme() {
    return ThemeData(
      scaffoldBackgroundColor: Colors.blue.shade100,
      primarySwatch: Colors.blue,
      primaryColorLight: Colors.blue.shade50,
    );
  }
}
