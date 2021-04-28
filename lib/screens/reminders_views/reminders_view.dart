import 'dart:async';
import 'package:flutter/material.dart';
import 'package:carcare/model/reminders/db_reminders.dart';
import 'package:carcare/model/reminders/reminders_model.dart';
import 'package:carcare/screens/reminders_views/reminders_details.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:sqflite/sqflite.dart';

class RemindersMain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RemindersMainState();
  }
}

class RemindersMainState extends State<RemindersMain> {
  DBReminders dbReminders = DBReminders();
  List<Reminders> remindersList;
  int count = 0;
  int axisCount = 2;
  Color mainColor = Colors.grey[900];
  Color subColor = Colors.grey[50];
  Color reminderColor = Colors.red[500];
  String bgImage = 'bg.png';

  @override
  Widget build(BuildContext context) {
    if (remindersList == null) {
      remindersList = List<Reminders>();
      updateListView();
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Przypomnienia'),
        backgroundColor: mainColor,
      ),
      body: remindersList.length == 0
          ? Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/$bgImage'),
                fit: BoxFit
                    .cover, //zasłoni cały background, -> umiejscowienie image w bgc
              )),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text('Naciśnij Przycisk by dodać!'),
                ),
              ),
            )
          : Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/$bgImage'),
                fit: BoxFit
                    .cover, //zasłoni cały background, -> umiejscowienie image w bgc
              )),
              child: getRemindersList(),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navigateToDetail(Reminders('', ''), 'Dodaj przypomnienie');
        },
        tooltip: 'Add Note',
        shape: CircleBorder(side: BorderSide(color: Colors.black, width: 2.0)),
        child: Icon(Icons.add, color: Colors.black),
        backgroundColor: Colors.red[900],
      ),
    );
  }

  Widget getRemindersList() {
    return StaggeredGridView.countBuilder(
      physics: BouncingScrollPhysics(),
      crossAxisCount: 4,
      itemCount: count,
      itemBuilder: (BuildContext context, int index) => GestureDetector(
        onTap: () {
          navigateToDetail(this.remindersList[index], 'Edytuj przypomnienie');
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
                color: reminderColor,
                border: Border.all(width: 2, color: Colors.black),
                borderRadius: BorderRadius.circular(8.0)),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          this.remindersList[index].title,
                          style: TextStyle(
                            color: mainColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          this.remindersList[index].desc == null
                              ? ''
                              : this.remindersList[index].desc,
                          style: TextStyle(
                            color: mainColor,
                            fontSize: 18.0,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        this.remindersList[index].date,
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ])
              ],
            ),
          ),
        ),
      ),
      staggeredTileBuilder: (int index) => StaggeredTile.fit(axisCount),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }

  void navigateToDetail(Reminders note, String title) async {
    bool result = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => RemindersDetail(note, title)));

    if (result == true) {
      updateListView();
    }
  }

  void updateListView() {
    final Future<Database> dbFuture = dbReminders.initializeDatabase();
    dbFuture.then((database) {
      Future<List<Reminders>> noteListFuture = dbReminders.getNoteList();
      noteListFuture.then((remindersList) {
        setState(() {
          this.remindersList = remindersList;
          this.count = remindersList.length;
        });
      });
    });
  }
}
