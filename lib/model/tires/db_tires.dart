import 'package:flutter/foundation.dart';
import 'package:carcare/model/tires/tires_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

class DBTires with ChangeNotifier {
  // Transform DBManager to singleton class.
  DBTires._internal();
  static final DBTires _dbManager = DBTires._internal();
  factory DBTires() => _dbManager;

  // constant class properties
  final tblTires = 'tires';
  final colId = 'id';
  final colRims = 'rims';
  final colTireSize = 'tireSize';
  final colFrontPressure = 'frontPressure';
  final colBackPressure = 'backPressure';
  final colIsSummer = 'isSummer';

  Database db;

  Future<Database> initializeDB() async {
    if (db == null) {
      db = await openDatabase(join(await getDatabasesPath(), "tires.db"),
          version: 1, onCreate: (db, int version) {
        return db.execute(
            "CREATE TABLE $tblTires($colId INTEGER PRIMARY KEY, $colRims TEXT, $colTireSize TEXT, $colFrontPressure TEXT, $colBackPressure TEXT, $colIsSummer TEXT)");
      });
    }
    return db;
  }

  // insert data into DB
  Future<int> addTires(TiresModel tires) async {
    await initializeDB();
    var newTires = await db.insert(tblTires, tires.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    notifyListeners();
    return newTires;
  }

  // retrieve all
  Future<List<TiresModel>> getTires() async {
    await initializeDB();
    final List<Map<String, dynamic>> allTires =
        await db.rawQuery("SELECT * FROM $tblTires ORDER BY $colRims ASC");
    return List.generate(allTires.length, (i) {
      return TiresModel.withId(
        allTires[i][colId],
        allTires[i][colRims],
        allTires[i][colTireSize],
        allTires[i][colFrontPressure],
        allTires[i][colBackPressure],
        allTires[i][colIsSummer],
      );
    });
  }

  // update
  Future<int> updateTires(TiresModel tires) async {
    await initializeDB();
    notifyListeners();
    return await db.update(tblTires, tires.toMap(),
        where: "$colId = ?", whereArgs: [tires.id]);
  }

  // delete
  Future<int> deleteTires(int id) async {
    await initializeDB();
    notifyListeners();
    return await db.delete(tblTires, where: "$colId = ?", whereArgs: [id]);
  }
}
