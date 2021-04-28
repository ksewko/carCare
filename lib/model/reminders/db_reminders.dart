import 'dart:io';

import 'package:carcare/model/reminders/reminders_model.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:path_provider/path_provider.dart';

class DBReminders {
  static DBReminders _dbReminders; // Singleton DBReminders
  static Database _database; // Singleton Database

  String remindersTable = 'reminder_table';
  String colId = 'id';
  String colTitle = 'title';
  String colDesc = 'desc';
  String colDate = 'date';

  DBReminders._createInstance(); // Named constructor to create instance of DBReminders

  factory DBReminders() {
    if (_dbReminders == null) {
      _dbReminders = DBReminders
          ._createInstance(); // This is executed only once, singleton object
    }
    return _dbReminders;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    // Get the directory path for both Android and iOS to store database.
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'reminders.db';

    // Open/create the database at a given path
    var remindersDB = await openDatabase(path, version: 1, onCreate: _createDb);
    return remindersDB;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $remindersTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colTitle TEXT, '
        '$colDesc TEXT ,$colDate TEXT)');
  }

  Future<List<Map<String, dynamic>>> getNoteMapList() async {
    Database db = await this.database;

    var result = await db.query(remindersTable, orderBy: '$colDate ASC');
    return result;
  }

  // Insert Operation: Insert a object to database
  Future<int> insertReminder(Reminders reminders) async {
    Database db = await this.database;
    var result = await db.insert(remindersTable, reminders.toMap());
    return result;
  }

  // Update Operation: Update a object and save it to database
  Future<int> updateReminder(Reminders reminders) async {
    var db = await this.database;
    var result = await db.update(remindersTable, reminders.toMap(),
        where: '$colId = ?', whereArgs: [reminders.id]);
    return result;
  }

  // Delete Operation: Delete a object from database
  Future<int> deleteReminder(int id) async {
    var db = await this.database;
    int result =
        await db.rawDelete('DELETE FROM $remindersTable WHERE $colId = $id');
    return result;
  }

  // Get number of objects in database
  Future<int> getCount() async {
    Database db = await this.database;
    List<Map<String, dynamic>> x =
        await db.rawQuery('SELECT COUNT (*) from $remindersTable');
    int result = Sqflite.firstIntValue(x);
    return result;
  }

  Future<List<Reminders>> getNoteList() async {
    var remindersMapList = await getNoteMapList();
    int count = remindersMapList.length;

    List<Reminders> remindersList = List<Reminders>();

    for (int i = 0; i < count; i++) {
      remindersList.add(Reminders.fromMapObject(remindersMapList[i]));
    }

    return remindersList;
  }
}
