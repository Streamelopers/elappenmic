import 'package:sqflite/sqflite.dart';
import 'dart:core';
import 'package:path/path.dart';
import 'package:src/services/models.dart';

class MyDatabase {
  static Future<Database>? _db;

  static Future<Database> connection() async {
    if (_db != null) {
      return _db!;
    }

    var databasePath = await getDatabasesPath();
    _db = openDatabase(
      join(await getDatabasesPath(), 'elappenmic.db'),
      onCreate: (db, version) {
        return db.execute(
            'CREATE TABLE youtube_videos(id INTEGER PRIMARY KEY, key TEXT, title TEXT, description TEXT, published_at DATETIME, thumbnail TEXT, thumbnail_2x TEXT, thumbnail_3x TEXT); ' +
                'CREATE TABLE settings(id INTEGER PRIMARY KEY, key TEXT, value TEXT);');
      },
      version: 1,
    );
    return _db!;
  }
}
