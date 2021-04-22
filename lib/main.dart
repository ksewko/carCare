import 'package:CWCFlutter/screns/home.dart';
import 'package:CWCFlutter/screns/mechanics.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

void main() => runApp(MaterialApp(routes: {
      // '/': (context) => Loading(),
      '/': (context) => Home(),
      '/mechanics': (context) => Mechanics(),
      // '/location': (context) => ChooseLocation()
    }));

// import 'package:CWCFlutter/food_list.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import 'bloc/food_bloc.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider<FoodBloc>(
//       create: (context) => FoodBloc(),
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'Sqflite Tutorial',
//         theme: ThemeData(
//           primarySwatch: Colors.red,
//         ),
//         home: FoodList(),
//       ),
//     );
//   }
// }
