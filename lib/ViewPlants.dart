import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'Navigation.dart';

class ViewPlants extends StatefulWidget {
  const ViewPlants({Key? key}) : super(key: key);

  @override
  State<ViewPlants> createState() => _ViewPlantsState();
}

class _ViewPlantsState extends State<ViewPlants> {
  late Future<List<Map<String, dynamic>>> _plantsFuture;

  @override
  void initState() {
    super.initState();
    _plantsFuture = _loadPlants();
  }

  Future<List<Map<String, dynamic>>> _loadPlants() async {
    final Database db = await _getDatabase();
    return db.query('plants');
  }

  Future<Database> _getDatabase() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'PlantDatabase.db');
    return openDatabase(path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Navigation(),
      appBar: AppBar(
        title: Text('View Plants'),
        backgroundColor: Colors.red,
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _plantsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Text('No plants found.'),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final plant = snapshot.data![index];
                return Card(
                  child: Column(
                    children: [
                     
                      Image.file(
                        File(plant['plantImage']),
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 200,
                      ),
                      ListTile(
                        title: Text(plant['plantName']),
                        subtitle: Text(plant['plantSpecies']),
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}