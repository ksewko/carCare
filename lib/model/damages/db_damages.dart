import 'package:flutter/foundation.dart';
import 'package:movierental/model/damages/damages_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

class DBDamages with ChangeNotifier {
  // Transform DBManager to singleton class.
  DBDamages._internal();
  static final DBDamages _dbManager = DBDamages._internal();
  factory DBDamages() => _dbManager;

  // constant class properties
  final tblDamages = 'damages';
  final colId = 'id';
  final colName = 'name';
  final colDate = 'date';
  final colPlace = 'place';
  final colIsGuilty = 'isGuilty';
  final colInsurance = 'insurance';
  final colDesc = 'desc';

  Database db;

  Future<Database> initializeDB() async {
    if (db == null) {
      db = await openDatabase(join(await getDatabasesPath(), "damages.db"),
          version: 1, onCreate: (db, int version) {
        return db.execute(
            "CREATE TABLE $tblDamages($colId INTEGER PRIMARY KEY, $colName TEXT, $colDate TEXT, $colPlace TEXT, $colIsGuilty TEXT, $colInsurance TEXT, $colDesc TEXT)");
      });
    }
    return db;
  }

  // insert data into DB
  Future<int> addDamages(DamagesModel damages) async {
    await initializeDB();
    var newDamages = await db.insert(tblDamages, damages.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    notifyListeners();
    return newDamages;
  }

  // retrieve all
  Future<List<DamagesModel>> getDamages() async {
    await initializeDB();
    final List<Map<String, dynamic>> allDamages =
        await db.rawQuery("SELECT * FROM $tblDamages ORDER BY $colName ASC");
    return List.generate(allDamages.length, (i) {
      return DamagesModel.withId(
        allDamages[i][colId],
        allDamages[i][colName],
        allDamages[i][colDate],
        allDamages[i][colPlace],
        allDamages[i][colIsGuilty],
        allDamages[i][colInsurance],
        allDamages[i][colDesc],
      );
    });
  }

  // update
  Future<int> updateDamages(DamagesModel damages) async {
    await initializeDB();
    notifyListeners();
    return await db.update(tblDamages, damages.toMap(),
        where: "$colId = ?", whereArgs: [damages.id]);
  }

  // delete
  Future<int> deleteDamages(int id) async {
    await initializeDB();
    notifyListeners();
    return await db.delete(tblDamages, where: "$colId = ?", whereArgs: [id]);
  }
}
