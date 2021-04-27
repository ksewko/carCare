import 'dart:async';
import 'package:flutter/material.dart';
import 'package:carcare/model/reminders/db_reminders.dart';
import 'package:carcare/model/reminders/reminders_model.dart';
import 'package:carcare/screens/reminders_views/reminders_details.dart';
import 'package:carcare/screens/reminders_views/reminders_search.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:carcare/utils/widgets.dart';
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
        backgroundColor: Colors.blue[900],
      ),
      body: remindersList.length == 0
          ? Container(
              color: Colors.white,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text('Naciśnij Przycisk by dodać!'),
                ),
              ),
            )
          : Container(
              color: Colors.white,
              child: getRemindersList(),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navigateToDetail(Reminders('', '', 3, 0), 'Dodaj przypomnienie');
        },
        tooltip: 'Add Note',
        shape: CircleBorder(side: BorderSide(color: Colors.black, width: 2.0)),
        child: Icon(Icons.add, color: Colors.black),
        backgroundColor: Colors.white,
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
                color: colors[this.remindersList[index].color],
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
                        ),
                      ),
                    ),
                    Text(
                      getPriorityText(this.remindersList[index].priority),
                      style: TextStyle(
                          color: getPriorityColor(
                              this.remindersList[index].priority)),
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

  // Returns the priority color
  Color getPriorityColor(int priority) {
    switch (priority) {
      case 1:
        return Colors.red;
        break;
      case 2:
        return Colors.yellow;
        break;
      case 3:
        return Colors.green;
        break;

      default:
        return Colors.yellow;
    }
  }

  // Returns the priority icon
  String getPriorityText(int priority) {
    switch (priority) {
      case 1:
        return '!!!';
        break;
      case 2:
        return '!!';
        break;
      case 3:
        return '!';
        break;

      default:
        return '!';
    }
  }

  // void _delete(BuildContext context, Note note) async {
  //   int result = await databaseHelper.deleteNote(note.id);
  //   if (result != 0) {
  //     _showSnackBar(context, 'Note Deleted Successfully');
  //     updateListView();
  //   }
  // }

  // void _showSnackBar(BuildContext context, String message) {
  //   final snackBar = SnackBar(content: Text(message));
  //   Scaffold.of(context).showSnackBar(snackBar);
  // }

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
