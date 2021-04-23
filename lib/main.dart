import 'package:flutter/material.dart';
import 'package:movierental/screens/car_view.dart';
import 'package:movierental/screens/mechanics_view.dart';
import 'package:movierental/screens/home.dart';
import 'package:provider/provider.dart';
import 'package:movierental/model/db_mechanics.dart';
import 'package:movierental/screens/splash_screen.dart';
// import 'package:movierental/utils/theme.dart';

void main() {
  runApp(MovieRental());
}

class MovieRental extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DBMechanics(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Movie_Rental_App',
        // theme: MyTheme().buildTheme(),
        home: SplashScreen(),
        routes: {
          // '/': (context) => Loading(),
          // '/cars': (context) => CarView(),
          '/mechanics': (context) => Mechanics(),
          // '/location': (context) => ChooseLocation()
        },
      ),
    );
  }
}
