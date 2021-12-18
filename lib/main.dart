import 'package:carcare/model/families/db_family.dart';
import 'package:carcare/model/parking/db_parking_provider.dart';
import 'package:carcare/model/photos/db_photos_provider.dart';
import 'package:carcare/screens/bee_info_views/bee_info_view.dart';
import 'package:carcare/screens/families_views/familiy_view.dart';
import 'package:carcare/screens/hive_views/hive_main_view.dart';
import 'package:carcare/screens/notes_views/notes_view.dart';
import 'package:carcare/screens/parking_view/add_parking_view.dart';
import 'package:carcare/screens/parking_view/parking_view.dart';
import 'package:carcare/screens/photos_views/add_photos_view.dart';
import 'package:carcare/screens/photos_views/photos_view.dart';
import 'package:flutter/material.dart';
import 'package:carcare/model/refuel/db_refuel.dart';
import 'package:carcare/model/serwis/db_serwis.dart';
import 'package:carcare/screens/refuel_views/refuel_view.dart';
import 'package:carcare/screens/serwis_views/sewis_view.dart';
import 'package:provider/provider.dart';
import 'package:carcare/screens/splash_screen.dart';

import 'model/bee_info/db_bee_info.dart';

void main() {
  runApp(MovieRental());
}

class MovieRental extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DBBeeInfo()),
        ChangeNotifierProvider(create: (context) => DBFamily()),
        ChangeNotifierProvider(create: (context) => DBSerwis()),
        ChangeNotifierProvider(create: (context) => DBRefuel()),
        ChangeNotifierProvider(create: (context) => DBParkingProvider()),
        ChangeNotifierProvider(create: (context) => DBPhotosProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'To bee happy',
        // theme: MyTheme().buildTheme(),
        home: SplashScreen(),
        routes: {
          // '/': (context) => Loading(),
          '/hive': (context) => HiveView(),
          '/beeinfo': (context) => BeeInfoMain(),
          '/families': (context) => FamiliesMain(),
          '/service': (context) => SerwisMain(),
          '/honey': (context) => RefuelMain(),
          '/notes': (context) => NotesMain(),
          '/location': (context) => ParkingView(),
          '/add-parking': (context) => AddParking(),
          '/photos': (context) => PhotosView(),
          '/add-photos': (context) => AddPhotos(),
          // '/location': (context) => ChooseLocation()
        },
      ),
    );
  }
}
