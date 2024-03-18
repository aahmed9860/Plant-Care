import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

  class DatabaseHelper{
    static final DatabaseHelper _instance= DatabaseHelper.internal();
    late Database _database;

    DatabaseHelper.internal();

    factory DatabaseHelper(){
      return _instance;
    }


 
Future<void> initDatabase() async {
    _database = await openDatabase(
      join(await getDatabasesPath(), 'plant_database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE plants(id INTEGER PRIMARY KEY, species TEXT, wateringTime INTEGER, image TEXT)',
        );
      },
      version: 1,
    );
  }

  Future<void> insertPlant(Plant plant) async {
      await _database.insert(
        'plants', plant.toMap(), conflictAlgorithm: ConflictAlgorithm.replace,
      );
  }

  Future<List<Plant>> getPlants() async {
 final List<Map<String, dynamic>> maps = await _database.query('plants');
    return List.generate(maps.length, (i) {
      return Plant(
        plantId: maps[i]['id'],
        plantSpecies: maps[i]['species'],
        plantWateringTime: maps[i]['wateringTime'],
        plantImage: maps[i]['image'],
      );
    });
  }
}
  
class Plant {
  String plantId;
  String plantSpecies;
  int plantWateringTime;
  String plantImage;

  Plant({required this.plantId, required this.plantSpecies, required this.plantWateringTime, required this.plantImage });

  Map<String, dynamic> toMap(){
    return{
      'id': plantId,
      'species': plantSpecies,
      'wateringTime' : plantWateringTime,
      'image' : plantImage,
    };
  }
}