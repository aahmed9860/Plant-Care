import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import '../Navigation.dart';
import 'DiseaseDetails.dart';
class PlantDiseases extends StatelessWidget {
  PlantDiseases({super.key});

final List<String> diseases= [
  "Blight",
  "Powdery Mildew",
  "Downy Mildew",
  "Black Spot",
  "Canker",
  "Fusarium Wilt",
  "Apple Scab",
  "Gray Mold",
  "Root Rot",
  "Blossom End Rot",
  "Chlorosis",
  "Damping Off",
];
final List <String> symptoms =[
  "Symptoms of Blight",
  "Symptoms of Powdery Mildew",
  "Symptoms of Downy Mildew",
  "Symptoms of Black Spot",
  "Symptoms of Canker",
  "Symptoms of Fusarium Wilt",
  "Symptoms of Apple Scab",
  "Symptoms of Gray Mold",
  "Symptoms of Root Rot",
  "Symptoms of Blossom End Rot",
  "Symptoms of Chlorosis",
  "Symptoms of Damping Off",
];
final List <String> cures =[
  "Cures of Blight",
  "Cures of Powdery Mildew",
  "Cures of Downy Mildew",
  "Cures of Black Spot",
  "Cures of Canker",
  "Cures of Fusarium Wilt",
  "Cures of Apple Scab",
  "Cures of Gray Mold",
  "Cures of Root Rot",
  "Cures of Blossom End Rot",
  "Cures of Chlorosis",
  "Cures of Damping Off",
];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Navigation(),
      appBar: AppBar(
        title:Text('Plant Diseases'),
        backgroundColor: Colors.purple,
      
      ),
      body: ListView.builder(
       itemCount: diseases.length,
       itemBuilder:(context,index){
          return ListTile(
              title: Text(diseases[index]),
            onTap:(){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DiseaseDetails(diseaseName: diseases[index], diseaseSymptoms: symptoms[index], diseaseCure: cures[index]),
                ),
              );
            },
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.amberAccent, width: 1.5),
              borderRadius: BorderRadius.circular(10),
              
            ),
          );
       },

      ),
    );
  }
}




 
