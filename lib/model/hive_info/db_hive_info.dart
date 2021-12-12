import 'package:flutter/foundation.dart';
import 'package:carcare/model/hive_info/hive_info_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

class DBHiveInfo with ChangeNotifier {
  // Transform DBManager to singleton class.
  DBHiveInfo._internal();
  static final DBHiveInfo _dbManager = DBHiveInfo._internal();
  factory DBHiveInfo() => _dbManager;

  // constant class properties
  final tblCarInfo = 'carinfo';
  final colId = 'id';
  final colBrand = 'brand';
  final colModel = 'model';
  final colYear = 'year';
  final colRegistration = 'registration';
  final colVin = 'vin';
  final colEngineCapacity = 'engineCapacity';
  final colPolicyNumber = 'policyNumber';

  Database db;

  Future<Database> initializeDB() async {
    if (db == null) {
      db = await openDatabase(join(await getDatabasesPath(), "carinfos.db"),
          version: 1, onCreate: (db, int version) {
        return db.execute(
            "CREATE TABLE $tblCarInfo($colId INTEGER PRIMARY KEY, $colBrand TEXT, $colModel TEXT,  $colYear INTEGER, $colRegistration TEXT, $colVin TEXT, $colEngineCapacity TEXT, $colPolicyNumber INTEGER)");
      });
    }
    return db;
  }

  // insert data into DB
  Future<int> addCarInfo(HiveInfoModel carinfo) async {
    await initializeDB();
    var newCarInfo = await db.insert(tblCarInfo, carinfo.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    notifyListeners();
    return newCarInfo;
  }

  // retrieve all carinfos
  Future<List<HiveInfoModel>> getCarInfo() async {
    await initializeDB();
    final List<Map<String, dynamic>> allCarInfo =
        await db.rawQuery("SELECT * FROM $tblCarInfo ORDER BY $colBrand ASC");
    return List.generate(allCarInfo.length, (i) {
      return HiveInfoModel.withId(
        allCarInfo[i][colId],
        allCarInfo[i][colBrand],
        allCarInfo[i][colModel],
        allCarInfo[i][colYear],
        allCarInfo[i][colRegistration],
        allCarInfo[i][colVin],
        allCarInfo[i][colEngineCapacity],
        allCarInfo[i][colPolicyNumber],
      );
    });
  }

  // update carinfo
  Future<int> updateCarInfo(HiveInfoModel carinfo) async {
    await initializeDB();
    notifyListeners();
    return await db.update(tblCarInfo, carinfo.toMap(),
        where: "$colId = ?", whereArgs: [carinfo.id]);
  }

  // delete carinfo
  Future<int> deleteCarInfo(int id) async {
    await initializeDB();
    notifyListeners();
    return await db.delete(tblCarInfo, where: "$colId = ?", whereArgs: [id]);
  }
}
