import 'package:flutter/material.dart';
import 'package:plant_care/Navigation.dart';

class TipDetails extends StatelessWidget {
  final String tipTitles;
  final String tips;

TipDetails({required this.tipTitles, required this.tips});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Navigation(),
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text(tipTitles),

      ),
      body: Padding( 
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text( //listing ingredients
              "Symptoms:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
             Text(tips,
            style: const TextStyle(fontSize: 18) ), //received from HomeScreen
            SizedBox(height: 20),
            const Text(
              "Cures:", //listing instructions
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height:20),
            ElevatedButton(
              onPressed: (){
                Navigator.pop(context);
              },
              child: const Text("Return to Tip List?"),
            )
          ],
          
        ),
        ),
    );
  }
}