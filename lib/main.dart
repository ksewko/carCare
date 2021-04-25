import 'package:flutter/material.dart';
import 'package:movierental/model/car/db_car_info.dart';
import 'package:movierental/model/mechanics/db_mechanics.dart';
import 'package:movierental/screens/car_info_views/car_info_view.dart';
import 'package:movierental/screens/car_views/car_main_view.dart';
import 'package:movierental/screens/mechanics_views/mechanics_view.dart';
import 'package:movierental/screens/home.dart';
import 'package:provider/provider.dart';
import 'package:movierental/screens/splash_screen.dart';
// import 'package:movierental/utils/theme.dart';

void main() {
  runApp(MovieRental());
}

class MovieRental extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DBCarInfo()),
        ChangeNotifierProvider(create: (context) => DBMechanics()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'CarCare',
        // theme: MyTheme().buildTheme(),
        home: SplashScreen(),
        routes: {
          // '/': (context) => Loading(),
          '/car': (context) => CarView(),
          '/carinfo': (context) => CarInfoMain(),
          '/mechanics': (context) => MechanicsMain(),

          // '/location': (context) => ChooseLocation()
        },
      ),
    );
    // return ChangeNotifierProvider(
    //   // create: (_) => DBMechanics(),
    //   create: (_) => DBCarInfo(),
    //   child: MaterialApp(
    //     debugShowCheckedModeBanner: false,
    //     title: 'Movie_Rental_App',
    //     // theme: MyTheme().buildTheme(),
    //     home: SplashScreen(),
    //     routes: {
    //       // '/': (context) => Loading(),
    //       '/car': (context) => CarView(),
    //       '/carinfo': (context) => CarInfoMain(),
    //       '/mechanics': (context) => MechanicsMain(),

    //       // '/location': (context) => ChooseLocation()
    //     },
    //   ),
    // );
  }
}
