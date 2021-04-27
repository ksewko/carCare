import 'package:flutter/foundation.dart';
import 'package:carcare/model/refuel/refuel_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

class DBRefuel with ChangeNotifier {
  // Transform DBManager to singleton class.
  DBRefuel._internal();
  static final DBRefuel _dbManager = DBRefuel._internal();
  factory DBRefuel() => _dbManager;

  // constant class properties
  final tblRefuel = 'refuel';
  final colId = 'id';
  final colType = 'type';
  final colDate = 'date';
  final colMeter = 'meter';
  final colFilled = 'filled';
  final colPrice = 'price';
  final colIsFull = 'isFull';

  Database db;

  Future<Database> initializeDB() async {
    if (db == null) {
      db = await openDatabase(join(await getDatabasesPath(), "refuel.db"),
          version: 1, onCreate: (db, int version) {
        return db.execute(
            "CREATE TABLE $tblRefuel($colId INTEGER PRIMARY KEY, $colType TEXT, $colDate TEXT, $colMeter TEXT, $colFilled TEXT, $colPrice TEXT, $colIsFull TEXT)");
      });
    }
    return db;
  }

  // insert data into DB
  Future<int> addRefuel(RefuelModel refuel) async {
    await initializeDB();
    var newRefuel = await db.insert(tblRefuel, refuel.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    notifyListeners();
    return newRefuel;
  }

  // retrieve all
  Future<List<RefuelModel>> getRefuel() async {
    await initializeDB();
    final List<Map<String, dynamic>> allRefuel =
        await db.rawQuery("SELECT * FROM $tblRefuel ORDER BY $colType ASC");
    return List.generate(allRefuel.length, (i) {
      return RefuelModel.withId(
        allRefuel[i][colId],
        allRefuel[i][colType],
        allRefuel[i][colDate],
        allRefuel[i][colMeter],
        allRefuel[i][colFilled],
        allRefuel[i][colPrice],
        allRefuel[i][colIsFull],
      );
    });
  }

  // update
  Future<int> updateRefuel(RefuelModel refuel) async {
    await initializeDB();
    notifyListeners();
    return await db.update(tblRefuel, refuel.toMap(),
        where: "$colId = ?", whereArgs: [refuel.id]);
  }

  // delete
  Future<int> deleteRefuel(int id) async {
    await initializeDB();
    notifyListeners();
    return await db.delete(tblRefuel, where: "$colId = ?", whereArgs: [id]);
  }
}
