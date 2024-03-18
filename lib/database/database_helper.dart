import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'plant_model.dart';
import 'package:json_annotation/json_annotation.dart';


  class DatabaseHelper{
    static const int _version = 1;
    static const String _dbName = "Plants.db";


 
   Future<Database>  _getDB() async {
    return openDatabase (join(await getDatabasesPath(), _dbName),
    onCreate: (db, version) async => 
    await db.execute("CREATE TABLE Plants(plantId TEXT PRIMARY KEY, plantName TEXT NOT NULL, plantWateringTime INT NOT NULL, plantImage TEXT NOT NULL);"),
      version: _version,
    );
    }
  

 Future<int> insertPlant(Plant plant) async {
      final db= await _getDB();
             return await db.insert("Plants" , plant.toJson(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

   Future<int> updateNote(Plant plant) async{
    final db = await _getDB();
    return await db.update("Plants", plant.toJson(), where: 'plantId = ?', whereArgs: [plant.plantId], conflictAlgorithm: ConflictAlgorithm.replace);
  }

Future<int> deleteNote(Plant plant) async{
    final db = await _getDB();
    return await db.delete("Plants", plant.toJson(),  where: 'plantId = ?', whereArgs: [plant.plantId],);
  }


Future<List<Plant>?> getPlants() async {
  final db = await _getDB();
    final List<Map<String, dynamic>> maps = await db.query("Plants");
    if(maps.isEmpty){
      return null;
    }

    return List.generate(maps.length, (index) => Plant.fromJson(maps[index])); 
     
}
  }