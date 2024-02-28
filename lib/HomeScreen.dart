import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'Navigation.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) =>Scaffold(
     drawer: const Navigation(),
     appBar: AppBar(
      backgroundColor: Colors.green,
      title: Text('Plant Care'),
     ),
      body: Column(
      children: [
    
        Padding(
          padding: EdgeInsets.all(10),
          child: Container(
            width: 400,
            height: 100,
            color: Colors.blueGrey,
            child: Text('This is where I think watering schedule should go'),
          ),
        ),
         Padding(
          padding: EdgeInsets.all(10),
          child: Container(
            width: 400,
            height: 100,
            color: Colors.blueGrey,
            child: Text('I made container but I think they need to be something else' ),
          ),
        ),
         Padding(
          padding: EdgeInsets.all(10),
          child: Container(
            width: 400,
            height: 100,
            color: Colors.blueGrey,
          ),
        ),
          Padding(
          padding: EdgeInsets.all(10),
          child: Container(
            width: 400,
            height: 250,
            color: Colors.blueGrey,
            child: const Text(
              '-Tips of the Day \n -TODO: \n -WATERING SCHEDULE \n -(possible calender package found) \n -Tips: & getting them to display on the homescreen \n -Input Plants & View Plants (text controller?) \n -Plant Disease Buttons Could look Better \n -Navigation Button Colors were for fun, should remove?, \n -Having Watering Schedule Display on Home Screen \n -LOGIN PAGE',
            ),
          ),
        ),
        
      ],

     ),
    );
}