import 'dart:async';

import 'package:flutter/material.dart';
import 'Navigation.dart';
import 'WateringSchedule.dart';
import 'utils.dart';
import 'package:table_calendar/table_calendar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScrenState();
}

class _HomeScrenState extends State<HomeScreen> {
  final List<String> tipTitles=[
    'Health and Safety: Best Time to Water Your Plants',
    'Indoor Tip: Light Intake',
    'Plants in Pots: Check your Containers!',
    'Plants in Pots: Soil Quality',
  ];
  
  final List<String> tips = [
    'Tip 1: Watering your plants is best to do while the sun is out, so that there is less excess hydration overnight. This protects your plants from funguses and bacteria that grow well in excessive dampness!',
    'Tip 2: Make sure you\'re aware of how much light your plant needs, as some plants need lots of sun and some prefer partial light. This is especially true for indoor plants, as light can be easily manipulated by where they\'re placed indoors.',
    'Tip 3: For indoor plants, containers do matter! Some plants will keep growing their roots and have trouble with growth if they are unable to spread their roots in a small pot. As such, it\'s inportant to research which plants need what size containers.',
    'Tip 4: Soil quality is important. Ensure that the soil you have is filled with nutrients for '
  ];
  
  int currentTipIndex= 0;
  late Timer timer;
  
  void initState(){
    super.initState();
  

  timer = Timer.periodic(Duration(seconds: 20), (Timer t){
    setState((){
      currentTipIndex = (currentTipIndex +1) % tips.length;
    });
  });
}
@override 
void dispose(){
  super.dispose();
  timer.cancel();
}
  
  @override
  Widget build(BuildContext context) =>Scaffold(
     drawer: const Navigation(),
     appBar: AppBar(
      backgroundColor: Colors.green,
      title: const Text('Plant Care'),
     ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Plants that need to be watered today',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            width: 400,
            height: 100,
            color: Colors.blueGrey,
            child: const Column(),

          ),
          
        ),
         Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            width: 400,
            height: 100,
            color: Colors.blueGrey,
            child: const Text('I made container but I think they need to be something else' ),
          ),
        ),
      const Text('Tips for Plant Care! New Tip Every 20 Seconds!'),
         Padding(
          padding: EdgeInsets.all(10),
          child: Container(
            width: 400,
            height: 200,
            color: Colors.blueGrey,
            child:  Text(
              tips[currentTipIndex],
              style: const TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
      ),
            )
          ),
          Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            width: 400,
            height: 150,
            color: Colors.blueGrey,
            child: const Text(
              '-TODO: \n -WATERING SCHEDULE -(possible calender package found) \n -Input Plants & View Plants (text controller?)  \n -LOGIN PAGE \n -Updating plant disease \n -adding more tips',
            ),
          ),
          ),
      ],

     ),
    );
}
