import 'dart:async';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  DatabaseHelper._privateConstructor();

  Database? db;

  static const String _databaseName = 'vubtility.db';
  static const int _databaseVersion = 1;


  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  Future<Database> initializeDB() async {
    final Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final String path = join(documentsDirectory.path, _databaseName);
    return openDatabase(
        path,
        version: _databaseVersion,
        onCreate: _onCreate,
        onUpgrade: _onUpgrade
    );
  }

  Future<Database> getDatabase() async {
    if (db != null) {
      return db!;
    }
    return initializeDB();
  }


  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    final Batch batch = db.batch();
    if (oldVersion < 2) {
      // put sql statements here, i.e. create tables or alter tables...
    }
    await batch.commit();
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE x (
       
      )
    ''');
  }
}