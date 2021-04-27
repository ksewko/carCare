// import 'package:flutter/material.dart';
// import 'package:movierental/model/reminders/reminders_model.dart';

// class RemindersSearch extends SearchDelegate<Reminders> {
//   final List<Reminders> reminders;
//   List<Reminders> filteredReminders = [];
//   RemindersSearch({this.reminders});

//   @override
//   ThemeData appBarTheme(BuildContext context) {
//     assert(context != null);
//     final ThemeData theme = Theme.of(context).copyWith(
//         hintColor: Colors.black,
//         primaryColor: Colors.white,
//         textTheme: TextTheme(
//           title: TextStyle(
//               color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
//         ));
//     assert(theme != null);
//     return theme;
//   }

//   @override
//   List<Widget> buildActions(BuildContext context) {
//     return [
//       IconButton(
//         icon: Icon(
//           Icons.clear,
//           color: Colors.black,
//         ),
//         onPressed: () {
//           query = '';
//         },
//       )
//     ];
//   }

//   @override
//   Widget buildLeading(BuildContext context) {
//     return IconButton(
//       icon: Icon(
//         Icons.arrow_back,
//         color: Colors.black,
//       ),
//       onPressed: () {
//         close(context, null);
//       },
//     );
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     if (query == '') {
//       return Container(
//         color: Colors.white,
//         child: Center(
//             child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             SizedBox(
//               width: 50,
//               height: 50,
//               child: Icon(
//                 Icons.search,
//                 size: 50,
//                 color: Colors.black,
//               ),
//             ),
//             Text(
//               'Czego szukasz?',
//               style: TextStyle(color: Colors.black),
//             )
//           ],
//         )),
//       );
//     } else {
//       filteredReminders = [];
//       getFilteredList(reminders);
//       if (filteredReminders.length == 0) {
//         return Container(
//           color: Colors.white,
//           child: Center(
//               child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               SizedBox(
//                 width: 50,
//                 height: 50,
//                 child: Icon(
//                   Icons.sentiment_dissatisfied,
//                   size: 50,
//                   color: Colors.black,
//                 ),
//               ),
//               Text(
//                 'Nie znaleziono',
//                 style: TextStyle(color: Colors.black),
//               )
//             ],
//           )),
//         );
//       } else {
//         return Container(
//           color: Colors.white,
//           child: ListView.builder(
//             itemCount:
//                 filteredReminders.length == null ? 0 : filteredReminders.length,
//             itemBuilder: (context, index) {
//               return ListTile(
//                 leading: Icon(
//                   Icons.note,
//                   color: Colors.black,
//                 ),
//                 title: Text(
//                   filteredReminders[index].title,
//                   style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 18.0,
//                       color: Colors.black),
//                 ),
//                 subtitle: Text(
//                   filteredReminders[index].desc,
//                   style: TextStyle(fontSize: 14.0, color: Colors.grey),
//                 ),
//                 onTap: () {
//                   close(context, filteredReminders[index]);
//                 },
//               );
//             },
//           ),
//         );
//       }
//     }
//   }

//   List<Reminders> getFilteredList(List<Reminders> reminder) {
//     for (int i = 0; i < reminder.length; i++) {
//       if (reminder[i].title.toLowerCase().contains(query) ||
//           reminder[i].desc.toLowerCase().contains(query)) {
//         filteredReminders.add(reminder[i]);
//       }
//     }
//     return filteredReminders;
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     if (query == '') {
//       return Container(
//         color: Colors.white,
//         child: Center(
//             child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             SizedBox(
//               width: 50,
//               height: 50,
//               child: Icon(
//                 Icons.search,
//                 size: 50,
//                 color: Colors.black,
//               ),
//             ),
//             Text(
//               'Czego szukasz?',
//               style: TextStyle(color: Colors.black),
//             )
//           ],
//         )),
//       );
//     } else {
//       filteredReminders = [];
//       getFilteredList(reminders);
//       if (filteredReminders.length == 0) {
//         return Container(
//           color: Colors.white,
//           child: Center(
//               child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               SizedBox(
//                 width: 50,
//                 height: 50,
//                 child: Icon(
//                   Icons.sentiment_dissatisfied,
//                   size: 50,
//                   color: Colors.black,
//                 ),
//               ),
//               Text(
//                 'Nie znaleziono',
//                 style: TextStyle(color: Colors.black),
//               )
//             ],
//           )),
//         );
//       } else {
//         return Container(
//           color: Colors.white,
//           child: ListView.builder(
//             itemCount:
//                 filteredReminders.length == null ? 0 : filteredReminders.length,
//             itemBuilder: (context, index) {
//               return ListTile(
//                 leading: Icon(
//                   Icons.note,
//                   color: Colors.black,
//                 ),
//                 title: Text(
//                   filteredReminders[index].title,
//                   style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 18.0,
//                       color: Colors.black),
//                 ),
//                 subtitle: Text(
//                   filteredReminders[index].desc,
//                   style: TextStyle(fontSize: 14.0, color: Colors.grey),
//                 ),
//                 onTap: () {
//                   close(context, filteredReminders[index]);
//                 },
//               );
//             },
//           ),
//         );
//       }
//     }
//   }
// }
