import 'package:CWCFlutter/bloc/food_bloc.dart';
import 'package:CWCFlutter/food_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Mechanics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<FoodBloc>(
      create: (context) => FoodBloc(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Car Care'),
          backgroundColor: Colors.blue[900],
          elevation: 0.0,
        ),
        body: FoodList(),
      ),
    );
  }
}

// class Mechanics extends StatelessWidget {
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
