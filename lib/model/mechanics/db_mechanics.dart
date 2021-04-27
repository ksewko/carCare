import 'package:flutter/foundation.dart';
import 'package:carcare/model/mechanics/mechanics_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

class DBMechanics with ChangeNotifier {
  // Transform DBManager to singleton class.
  DBMechanics._internal();
  static final DBMechanics _dbManager = DBMechanics._internal();
  factory DBMechanics() => _dbManager;

  // constant class properties
  final tblMechanics = 'mechanics';
  final colId = 'id';
  final colName = 'name';
  final colDesc = 'description';
  final colAddress = 'address';
  final colPhoneNumber = 'phoneNumber';

  Database db;

  Future<Database> initializeDB() async {
    if (db == null) {
      db = await openDatabase(join(await getDatabasesPath(), "mechanics.db"),
          version: 1, onCreate: (db, int version) {
        return db.execute(
            "CREATE TABLE $tblMechanics($colId INTEGER PRIMARY KEY, $colName TEXT, $colDesc TEXT, $colAddress TEXT, $colPhoneNumber INTEGER)");
      });
    }
    return db;
  }

  // insert data into DB
  Future<int> addMechanics(MechanicsModel mechanics) async {
    await initializeDB();
    var newMechanics = await db.insert(tblMechanics, mechanics.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    notifyListeners();
    return newMechanics;
  }

  // retrieve all mechanics
  Future<List<MechanicsModel>> getMechanics() async {
    await initializeDB();
    final List<Map<String, dynamic>> allMechanics =
        await db.rawQuery("SELECT * FROM $tblMechanics ORDER BY $colName ASC");
    return List.generate(allMechanics.length, (i) {
      return MechanicsModel.withId(
        allMechanics[i][colId],
        allMechanics[i][colName],
        allMechanics[i][colAddress],
        allMechanics[i][colPhoneNumber],
        allMechanics[i][colDesc],
      );
    });
  }

  // update mechanics
  Future<int> updateMechanics(MechanicsModel mechanics) async {
    await initializeDB();
    notifyListeners();
    return await db.update(tblMechanics, mechanics.toMap(),
        where: "$colId = ?", whereArgs: [mechanics.id]);
  }

  // delete mechanics
  Future<int> deleteMechanics(int id) async {
    await initializeDB();
    notifyListeners();
    return await db.delete(tblMechanics, where: "$colId = ?", whereArgs: [id]);
  }
}
