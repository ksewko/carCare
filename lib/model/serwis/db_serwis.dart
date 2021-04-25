import 'package:flutter/foundation.dart';
import 'package:movierental/model/serwis/serwis_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

class DBSerwis with ChangeNotifier {
  // Transform DBManager to singleton class.
  DBSerwis._internal();
  static final DBSerwis _dbManager = DBSerwis._internal();
  factory DBSerwis() => _dbManager;

  // constant class properties
  final tblSerwis = 'serwis';
  final colId = 'id';
  final colName = 'name';
  final colDate = 'date';
  final colPrice = 'price';
  final colDesc = 'description';

  Database db;

  Future<Database> initializeDB() async {
    if (db == null) {
      db = await openDatabase(join(await getDatabasesPath(), "service.db"),
          version: 1, onCreate: (db, int version) {
        return db.execute(
            "CREATE TABLE $tblSerwis($colId INTEGER PRIMARY KEY, $colName TEXT, $colDate TEXT, $colPrice TEXT, $colDesc TEXT)");
      });
    }
    return db;
  }

  // insert data into DB
  Future<int> addSerwis(SerwisModel serwis) async {
    await initializeDB();
    var newSerwis = await db.insert(tblSerwis, serwis.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    notifyListeners();
    return newSerwis;
  }

  // retrieve all
  Future<List<SerwisModel>> getSerwis() async {
    await initializeDB();
    final List<Map<String, dynamic>> allSerwis =
        await db.rawQuery("SELECT * FROM $tblSerwis ORDER BY $colName ASC");
    return List.generate(allSerwis.length, (i) {
      return SerwisModel.withId(
        allSerwis[i][colId],
        allSerwis[i][colName],
        allSerwis[i][colDate],
        allSerwis[i][colPrice],
        allSerwis[i][colDesc],
      );
    });
  }

  // update
  Future<int> updateSerwis(SerwisModel serwis) async {
    await initializeDB();
    notifyListeners();
    return await db.update(tblSerwis, serwis.toMap(),
        where: "$colId = ?", whereArgs: [serwis.id]);
  }

  // delete
  Future<int> deleteSerwis(int id) async {
    await initializeDB();
    notifyListeners();
    return await db.delete(tblSerwis, where: "$colId = ?", whereArgs: [id]);
  }
}
