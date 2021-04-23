import 'package:flutter/foundation.dart';
import 'package:movierental/model/movie.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

class DBManager with ChangeNotifier {
  // Transform DBManager to singleton class.
  DBManager._internal();
  static final DBManager _dbManager = DBManager._internal();
  factory DBManager() => _dbManager;

  // constant class properties
  final tblMovie = 'movie';
  final colId = 'id';
  final colTitle = 'title';
  final colDesc = 'description';
  final colActor = 'actor';
  final colReleasedYear = 'releasedYear';

  Database db;

  Future<Database> initializeDB() async {
    if (db == null) {
      db = await openDatabase(join(await getDatabasesPath(), "movie.db"),
          version: 1, onCreate: (db, int version) {
        return db.execute(
            "CREATE TABLE $tblMovie($colId INTEGER PRIMARY KEY, $colTitle TEXT, $colDesc TEXT, $colActor TEXT, $colReleasedYear INTEGER)");
      });
    }
    return db;
  }

  // insert data into DB
  Future<int> addMovie(Movie movie) async {
    await initializeDB();
    var newMovie = await db.insert(tblMovie, movie.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    notifyListeners();
    return newMovie;
  }

  // retrieve all movies
  Future<List<Movie>> getMovies() async {
    await initializeDB();
    final List<Map<String, dynamic>> allMovies =
        await db.rawQuery("SELECT * FROM $tblMovie ORDER BY $colTitle ASC");
    return List.generate(allMovies.length, (i) {
      return Movie.withId(
        allMovies[i][colId],
        allMovies[i][colTitle],
        allMovies[i][colActor],
        allMovies[i][colReleasedYear],
        allMovies[i][colDesc],
      );
    });
  }

  // update movie
  Future<int> updateMovie(Movie movie) async {
    await initializeDB();
    notifyListeners();
    return await db.update(tblMovie, movie.toMap(),
        where: "$colId = ?", whereArgs: [movie.id]);
  }

  // delete movie
  Future<int> deleteMovie(int id) async {
    await initializeDB();
    notifyListeners();
    return await db.delete(tblMovie, where: "$colId = ?", whereArgs: [id]);
  }
}
