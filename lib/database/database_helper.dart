import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

  class DatabaseHelper{
    static const databaseName = "PlantDatabase.db";
    static const databaseVersion = 1;

    static const table = 'plants';

    static const plantID = '_id';
    static const plantName = 'name';
    static const plantSpecies = 'species';
    static const plantWateringTime = 'watering_time';
    static const plantImage = 'image';

    DatabaseHelper.privateConstructor();
    static final DatabaseHelper instance = DatabaseHelper.privateConstructor();

    static Database? _database;

    Future<Database> get database async{
      if(_database != null ) return _database!;
      _database = await _initDatabase();
      return _database!;

    }
    _initDatabase() async{
      Directory documentsDirectory = await getApplicationDocumentsDirectory();
      String path = join(documentsDirectory.path, databaseName);
      return await openDatabase(path,
      version: databaseVersion, onCreate: _onCreate);
    }
    Future _onCreate(Database db, int version) async{
      await db.execute('''
        CREATE TABLE $table(
          $plantID INTEGER PRIMARY KEY
          $plantName TEXT NOT NULL,
          $plantSpecies TEXT NOT NULL,
          $plantWateringTime TEXT NOT NULL,
          $plantImage TEXT
        )
      ''');
    }
    Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(table, row);
  }

  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await instance.database;
    return await db.query(table);
  }
  }