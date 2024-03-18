import 'package:flutter/material.dart';
import 'package:plant_care/Navigation.dart';

class DiseaseDetails extends StatelessWidget {
  final String diseaseName;
  final String diseaseSymptoms;
  final String diseaseCure;
  final String diseasePictures;
DiseaseDetails({required this.diseaseName, required this.diseaseSymptoms, required this.diseaseCure, required this.diseasePictures});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Navigation(),
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(diseaseName),

      ),
      body: SingleChildScrollView( 
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text( //listing ingredients
              "Symptoms:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
             Text(diseaseSymptoms,
            style: const TextStyle(fontSize: 18) ), //received from HomeScreen
            SizedBox(height: 20),
            const Text(
              "Cures:", //listing instructions
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(diseaseCure,
            style: const TextStyle(fontSize: 18)), //received from HomeScreen
            const SizedBox(height:20),
             Center(
              child : Image.asset(diseasePictures),
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.pop(context);
              },
              child: const Text("Return to Disease List?"),
            )
          ],
          
        ),
        ),
    );
  }
}