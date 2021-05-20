import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:carcare/model/reminders/db_reminders.dart';
import 'package:carcare/model/reminders/reminders_model.dart';

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

  Color mainColor = Colors.grey[900];
  Color subColor = Colors.grey[50];
  String bgImage = 'bg.png';
  Color redColor = Colors.red[900];

  String appBarTitle;
  Reminders reminders;
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  // int color;
  bool isEdited = false;

  NoteDetailState(this.reminders, this.appBarTitle);

  @override
  Widget build(BuildContext context) {
    titleController.text = reminders.title;
    descController.text = reminders.desc;
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
            backgroundColor: mainColor,
            leading: IconButton(
                icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                onPressed: () {
                  isEdited ? showDiscardDialog(context) : moveToLastScreen();
                }),
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.save,
                  color: Colors.white,
                ),
                onPressed: () {
                  titleController.text.length == 0
                      ? showEmptyTitleDialog(context)
                      : _save();
                },
              ),
              IconButton(
                icon: Icon(Icons.delete, color: Colors.white),
                onPressed: () {
                  showDeleteDialog(context);
                },
              )
            ],
          ),
          body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit
                  .cover, //zasłoni cały background, -> umiejscowienie image w bgc
            )),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextField(
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                    controller: titleController,
                    maxLength: 255,
                    onChanged: (value) {
                      updateTitle();
                    },
                    decoration: InputDecoration.collapsed(
                      hintText: 'Tytuł',
                      hintStyle: TextStyle(
                        color: subColor,
                        fontSize: 22.0,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: TextField(
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                      keyboardType: TextInputType.multiline,
                      maxLines: 10,
                      maxLength: 255,
                      controller: descController,
                      onChanged: (value) {
                        updateDescription();
                      },
                      decoration: InputDecoration.collapsed(
                        hintText: 'Opis',
                        hintStyle: TextStyle(
                          color: subColor,
                          fontSize: 18.0,
                        ),
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
            "Odrzuć zmiany!",
            style: TextStyle(
              color: redColor,
              fontWeight: FontWeight.bold,
              fontSize: 22.0,
            ),
          ),
          content: Text(
            "Czy chcesz odrzucić zmiany?",
            style: TextStyle(
              color: mainColor,
              fontSize: 18.0,
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text(
                "Nie",
                style: TextStyle(
                  color: redColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 22.0,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text(
                "Tak",
                style: TextStyle(
                  color: redColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 22.0,
                ),
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
            "Brak Tytułu!",
            style: TextStyle(
              color: redColor,
              fontSize: 18.0,
            ),
          ),
          content: Text(
            'Musisz dodać tytuł Przypomnienia!',
            style: TextStyle(
              color: redColor,
              fontSize: 18.0,
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text(
                "Ok",
                style: TextStyle(
                  color: redColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 22.0,
                ),
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
            "Usuń przypomnienie!",
            style: TextStyle(
              color: redColor,
              fontWeight: FontWeight.bold,
              fontSize: 22.0,
            ),
          ),
          content: Text(
            "Czy chcesz usunąć przypomnienie?",
            style: TextStyle(
              color: redColor,
              fontSize: 18.0,
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text(
                "Tak",
                style: TextStyle(
                  color: redColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 22.0,
                ),
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
