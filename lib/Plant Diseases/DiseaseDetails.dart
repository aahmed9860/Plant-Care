import 'package:flutter/material.dart';
import 'package:plant_care/Navigation.dart';

class DiseaseDetails extends StatelessWidget {
  final String diseaseName;
  final String diseaseSymptoms;
  final String diseaseCure;
DiseaseDetails({required this.diseaseName, required this.diseaseSymptoms, required this.diseaseCure});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Navigation(),
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(diseaseName),

      ),
      body: Padding( 
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text( //listing ingredients
              "Symptoms:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(diseaseSymptoms), //received from HomeScreen
            SizedBox(height: 20),
            const Text(
              "Cures:", //listing instructions
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(diseaseCure), //received from HomeScreen
            SizedBox(height:20),
          ],
        ),
        ),
    );
  }
}