import 'package:carcare/model/families/db_family.dart';
import 'package:carcare/model/honey/db_honey.dart';
import 'package:carcare/model/inspection/db_inspection.dart';
import 'package:carcare/model/location/db_location_provider.dart';
import 'package:carcare/model/photos/db_photos_provider.dart';
import 'package:carcare/screens/bee_info_views/bee_info_view.dart';
import 'package:carcare/screens/families_views/familiy_view.dart';
import 'package:carcare/screens/hive_views/hive_main_view.dart';
import 'package:carcare/screens/honey_views/honey_view.dart';
import 'package:carcare/screens/inspection_views/inspection_view.dart';
import 'package:carcare/screens/location_view/add_location_view.dart';
import 'package:carcare/screens/location_view/location_view.dart';
import 'package:carcare/screens/notes_views/notes_view.dart';
import 'package:carcare/screens/photos_views/add_photos_view.dart';
import 'package:carcare/screens/photos_views/photos_view.dart';
import 'package:flutter/material.dart';
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
        ChangeNotifierProvider(create: (context) => DBInspection()),
        ChangeNotifierProvider(create: (context) => DBHoney()),
        ChangeNotifierProvider(create: (context) => DBLocationProvider()),
        ChangeNotifierProvider(create: (context) => DBPhotosProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'To bee happy',
        // theme: MyTheme().buildTheme(),
        home: SplashScreen(),
        routes: {
          '/hive': (context) => HiveView(),
          '/beeinfo': (context) => BeeInfoMain(),
          '/families': (context) => FamiliesMain(),
          '/service': (context) => InspectionMain(),
          '/honey': (context) => HoneyMain(),
          '/notes': (context) => NotesMain(),
          '/location': (context) => LocationView(),
          '/add-location': (context) => AddLocation(),
          '/photos': (context) => PhotosView(),
          '/add-photos': (context) => AddPhotos(),
        },
      ),
    );
  }
}
