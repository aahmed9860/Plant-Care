import 'package:flutter/material.dart';
import 'package:plant_care/database/database_helper.dart';
import 'Navigation.dart';

class ViewPlants extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Navigation(),
      appBar: AppBar(
        title: Text('View Plants'),
      ),
      body: FutureBuilder<List<Plant>>(
        future: DatabaseHelper().getPlants(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            final plants = snapshot.data ?? [];
            return ListView.builder(
              itemCount: plants.length,
              itemBuilder: (context, index) {
                final plant = plants[index];
                return ListTile(
                  title: Text(plant.plantSpecies),
                  subtitle: Text('Watering Schedule: ${plant.plantWateringTime} days'),
                  leading: Image.asset(
                    plant.plantImage,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
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