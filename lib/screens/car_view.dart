// import 'package:flutter/material.dart';
// import 'package:movierental/model/db_manager.dart';
// import 'package:movierental/model/mechanics_model.dart';
// import 'package:movierental/screens/add_movie.dart';
// import 'package:movierental/screens/movie_info.dart';
// import 'package:provider/provider.dart';

// class CarView extends StatefulWidget {
//   @override
//   _CarViewState createState() => _CarViewState();
// }

// class _CarViewState extends State<CarView> {
//   List<MechanicsModel> movies;

//   @override
//   Widget build(BuildContext context) {
//     final getDB = Provider.of<DBManager>(context);

//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text('Lista Pojazdów'),
//         backgroundColor: Colors.blue[900],
//       ),
//       body: SafeArea(
//         child: Container(
//           color: Colors.blue[300],
//           child: FutureBuilder(
//             future: getDB.getMovies(),
//             builder: (context, snapshot) {
//               if (snapshot.hasData) {
//                 movies = snapshot.data;
//                 return ListView.builder(
//                   itemCount: movies.length,
//                   itemBuilder: (context, index) {
//                     return Card(
//                       // color: Theme.of(context).primaryColorLight,
//                       color: Colors.grey[300],
//                       elevation: 6.0,
//                       shape: StadiumBorder(),
//                       child: ListTile(
//                         leading: Icon(
//                           Icons.settings,
//                           color: Colors.blue[900],
//                         ),
//                         title: Text(
//                           movies[index].name,
//                           style: TextStyle(
//                             color: Colors.blue[900],
//                             fontSize: 18.0,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         subtitle: Text(
//                           (movies[index].address),
//                           style: TextStyle(
//                             color: Colors.blue[700],
//                             fontSize: 14.0,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         trailing: Text(
//                           (movies[index].phoneNumber.toString()),
//                           style: TextStyle(
//                             color: Colors.blue[900],
//                             fontSize: 18.0,
//                           ),
//                         ),
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => MovieInfo(movies[index])),
//                           );
//                         },
//                       ),
//                     );
//                   },
//                 );
//               }
//               return Center(
//                 child: CircularProgressIndicator(),
//               );
//             },
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.add),
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => AddMovie()),
//           );
//         },
//       ),
//     );
//   }
// }
