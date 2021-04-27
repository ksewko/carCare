import 'package:flutter/material.dart';
import 'package:carcare/model/car_info/db_car_info.dart';
import 'package:carcare/model/damages/db_damages.dart';
import 'package:carcare/model/mechanics/db_mechanics.dart';
import 'package:carcare/model/refuel/db_refuel.dart';
import 'package:carcare/model/serwis/db_serwis.dart';
import 'package:carcare/model/tires/db_tires.dart';
import 'package:carcare/screens/car_info_views/car_info_view.dart';
import 'package:carcare/screens/car_views/car_main_view.dart';
import 'package:carcare/screens/damages_view/damages_view.dart';
import 'package:carcare/screens/help_view/assistance_view.dart';
import 'package:carcare/screens/help_view/form_view.dart';
import 'package:carcare/screens/help_view/help_view.dart';
import 'package:carcare/screens/mechanics_views/mechanics_view.dart';
import 'package:carcare/screens/home.dart';
import 'package:carcare/screens/refuel_views/refuel_view.dart';
import 'package:carcare/screens/reminders_views/reminders_view.dart';
import 'package:carcare/screens/serwis_views/sewis_view.dart';
import 'package:carcare/screens/tires_views/tires_view.dart';
import 'package:provider/provider.dart';
import 'package:carcare/screens/splash_screen.dart';
// import 'package:carcare/utils/theme.dart';

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
        // ChangeNotifierProvider(create: (context) => DBReminders()),
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
          '/help': (context) => HelpView(),
          '/assistance': (context) => AssistanceView(),
          '/form': (context) => FormView(),
          '/reminders': (context) => RemindersMain(),

          // '/location': (context) => ChooseLocation()
        },
      ),
    );
  }
}
