import 'package:flutter/material.dart';
import 'package:movierental/model/car/db_car_info.dart';
import 'package:movierental/model/damages/db_damages.dart';
import 'package:movierental/model/mechanics/db_mechanics.dart';
import 'package:movierental/model/refuel/db_refuel.dart';
import 'package:movierental/model/serwis/db_serwis.dart';
import 'package:movierental/model/tires/db_tires.dart';
import 'package:movierental/screens/car_info_views/car_info_view.dart';
import 'package:movierental/screens/car_views/car_main_view.dart';
import 'package:movierental/screens/damages_view/damages_view.dart';
import 'package:movierental/screens/mechanics_views/mechanics_view.dart';
import 'package:movierental/screens/home.dart';
import 'package:movierental/screens/refuel_views/refuel_view.dart';
import 'package:movierental/screens/serwis_views/sewis_view.dart';
import 'package:movierental/screens/tires_views/tires_view.dart';
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
        ChangeNotifierProvider(create: (context) => DBTires()),
        ChangeNotifierProvider(create: (context) => DBSerwis()),
        ChangeNotifierProvider(create: (context) => DBRefuel()),
        ChangeNotifierProvider(create: (context) => DBDamages()),
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
          '/tires': (context) => TiresMain(),
          '/service': (context) => SerwisMain(),
          '/refuel': (context) => RefuelMain(),
          '/damages': (context) => DamagesMain(),
          '/mechanics': (context) => MechanicsMain(),

          // '/location': (context) => ChooseLocation()
        },
      ),
    );
  }
}
