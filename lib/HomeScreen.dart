import 'dart:async';

import 'package:flutter/material.dart';
import 'package:path/path.dart';
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
  final List<String> tips = [
    'Watering your plants is best to do while the sun is out, so that there is less excess hydration overnight. This protects your plants from funguses and bacteria that grow well in excessive dampness!',
    'Make sure you\'re aware of how much light your plant needs, as some plants need lots of sun and some prefer partial light. This is especially true for indoor plants, as light can be easily manipulated by where they\'re placed indoors.',
    'For indoor plants, containers do matter! Some plants will keep growing their roots and have trouble with growth if they are unable to spread their roots in a small pot. As such, it\'s inportant to research which plants need what size containers.',
    'Soil quality is important. Ensure that the soil you have is filled with nutrients for ',
    'Only water your plants when the top two inches of soil feel dry. You can check this with your finger, if your finger is dry after putting it in soil, water your plant. If not, don\'t water',
    'Plants need consistent living conditions. If growing indoors, it\'s vital to have a consistent temperature.',
    'While it may seem like a plant would suffer more from no water, plants survive better and stay healthier from underwatering than overwatering. Overwatering hurts your plant and can lead to increased chance of diseases.',
    'Pruning can help promote plant growth, so if you see wilted or withering leaves/branches, it might be best to cut them back to promote future growth.',
    'A lot of kitchen trash can be used for compost such as coffee grounds, egg shells or banana peels. These can supply your plants with additional nutrients and give dual purpose to food waste.',
    'Plants that gather dust can have a difficult time photosynthesizing due to obstruction from light. For indoor plants, ensure that you take the time to dust the leaves occasionally.',
    'Look out for weeds growing near your plants. When weeding, ensure you grab from the base to get the roots. Also keep an eye on bugs and funguses for disease control.',
  ];


  int currentTipIndex = 0;
  late Timer timer;
  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 8), (Timer t) {
      setState(() {
        currentTipIndex = (currentTipIndex + 1) % tips.length;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }


  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: const Navigation(),
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text('Welcome to Plant Care!'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                width: 400,
                height: 150,
                color: Colors.blueGrey,
                child: const Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'To get started, navigate to the \'Input New Plants\' page to add your plant information and allow you to structure your own watering schedule! ',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            const Align(
              alignment: Alignment.center,
              child: Text(
                'Plants to Water Today',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                height: 200,
                width: 400,
                color: Colors.blueGrey,
                  child: SingleChildScrollView(
                  
                      ),
                    ),

              ),
            
            const Align(
              alignment: Alignment.center,
              child: Text(
                'Tips for Healthy Plant Care!',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                width: 400,
                height: 200,
                color: Colors.blueGrey,
                child: Text(
                  tips[currentTipIndex],
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,),
                  textAlign: TextAlign.center,
                  
                ),
              ),
            ),
          ],
        ),
      );
}
