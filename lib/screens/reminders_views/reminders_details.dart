import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:carcare/model/reminders/db_reminders.dart';
import 'package:carcare/model/reminders/reminders_model.dart';
import 'package:carcare/utils/widgets.dart';

class RemindersDetail extends StatefulWidget {
  final String appBarTitle;
  final Reminders reminders;

  RemindersDetail(this.reminders, this.appBarTitle);

  @override
  State<StatefulWidget> createState() {
    return NoteDetailState(this.reminders, this.appBarTitle);
  }
}

class NoteDetailState extends State<RemindersDetail> {
  DBReminders dbReminders = DBReminders();

  String appBarTitle;
  Reminders reminders;
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  int color;
  bool isEdited = false;

  NoteDetailState(this.reminders, this.appBarTitle);

  @override
  Widget build(BuildContext context) {
    titleController.text = reminders.title;
    descController.text = reminders.desc;
    color = reminders.color;
    return WillPopScope(
        onWillPop: () {
          isEdited ? showDiscardDialog(context) : moveToLastScreen();
        },
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: Text(
              appBarTitle,
            ),
            backgroundColor: colors[color],
            leading: IconButton(
                icon: Icon(Icons.arrow_back_ios, color: Colors.black),
                onPressed: () {
                  isEdited ? showDiscardDialog(context) : moveToLastScreen();
                }),
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.save,
                  color: Colors.black,
                ),
                onPressed: () {
                  titleController.text.length == 0
                      ? showEmptyTitleDialog(context)
                      : _save();
                },
              ),
              IconButton(
                icon: Icon(Icons.delete, color: Colors.black),
                onPressed: () {
                  showDeleteDialog(context);
                },
              )
            ],
          ),
          body: Container(
            color: colors[color],
            child: Column(
              children: <Widget>[
                PriorityPicker(
                  selectedIndex: 3 - reminders.priority,
                  onTap: (index) {
                    isEdited = true;
                    reminders.priority = 3 - index;
                  },
                ),
                ColorPicker(
                  selectedIndex: reminders.color,
                  onTap: (index) {
                    setState(() {
                      color = index;
                    });
                    isEdited = true;
                    reminders.color = index;
                  },
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextField(
                    controller: titleController,
                    maxLength: 255,
                    onChanged: (value) {
                      updateTitle();
                    },
                    decoration: InputDecoration.collapsed(
                      hintText: 'Tytuł',
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: TextField(
                      keyboardType: TextInputType.multiline,
                      maxLines: 10,
                      maxLength: 255,
                      controller: descController,
                      onChanged: (value) {
                        updateDescription();
                      },
                      decoration: InputDecoration.collapsed(
                        hintText: 'Opis',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  void showDiscardDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          title: Text(
            "Odrzucić zmiany?",
          ),
          content: Text("Jesteś pewien, że chcesz odrzucić zmiany?",
              ),
          actions: <Widget>[
            FlatButton(
              child: Text("Nie",
                  style: TextStyle(color: Colors.purple),
                  ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text("Tak",
                  style: TextStyle(color: Colors.purple),
                  ),
              onPressed: () {
                Navigator.of(context).pop();
                moveToLastScreen();
              },
            ),
          ],
        );
      },
    );
  }

  void showEmptyTitleDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          title: Text(
            "Tytuł jest pusty",
            
          ),
          content: Text('Tytuł przypomnienia nie może pozostać pusty',
              ),
          actions: <Widget>[
            FlatButton(
              child: Text("Ok",
                  style: TextStyle(color: Colors.purple),
                  ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          title: Text(
            "Usunąć przypomnienie?",
          ),
          content: Text("Jesteś pewien, że chcesz usunąć przypomnienie?",
              ),
          actions: <Widget>[
            FlatButton(
              child: Text("Nie",
                  style: TextStyle(color: Colors.purple),
                  ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text("Tak",
                  style: TextStyle(color: Colors.purple),
                  ),
              onPressed: () {
                Navigator.of(context).pop();
                _delete();
              },
            ),
          ],
        );
      },
    );
  }

  void moveToLastScreen() {
    Navigator.pop(context, true);
  }

  void updateTitle() {
    isEdited = true;
    reminders.title = titleController.text;
  }

  void updateDescription() {
    isEdited = true;
    reminders.desc = descController.text;
  }

  // Save data to database
  void _save() async {
    moveToLastScreen();

    reminders.date = DateFormat.yMMMd().format(DateTime.now());

    if (reminders.id != null) {
      await dbReminders.updateReminder(reminders);
    } else {
      await dbReminders.insertReminder(reminders);
    }
  }

  void _delete() async {
    await dbReminders.deleteReminder(reminders.id);
    moveToLastScreen();
  }
}
