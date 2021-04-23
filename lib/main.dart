import 'package:flutter/material.dart';
import 'package:movierental/screens/homeOld.dart';
import 'package:movierental/screens/mechanics.dart';
import 'package:movierental/screens/home.dart';
import 'package:provider/provider.dart';
import 'package:movierental/model/db_manager.dart';
import 'package:movierental/screens/splash_screen.dart';
import 'package:movierental/utils/theme.dart';

void main() {
  runApp(MovieRental());
}

class MovieRental extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DBManager(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Movie_Rental_App',
        theme: MyTheme().buildTheme(),
        home: SplashScreen(),
        routes: {
          // '/': (context) => Loading(),
          '/mechanics': (context) => Mechanics(),
          // '/location': (context) => ChooseLocation()
        },
      ),
    );
  }
}
