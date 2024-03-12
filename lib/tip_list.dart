import 'package:flutter/material.dart';
import 'dart:async';

class DailyTips extends StatefulWidget {
  const DailyTips({super.key});

  @override
  State<DailyTips> createState() => _DailyTipsState();
}

class _DailyTipsState extends State<DailyTips> {
  final List<String> tipTitles=[
    'Health and Safety: Best Time to Water Your Plants',
    'Indoor Tip: Light Intake',
    'Plants in Pots: Check your Containers!',
    'Plants in Pots: Soil Quality',
  ];
  
  final List<String> tips = [
    'Tip 1: Watering your plants is best to do while the sun is out, so that there is less excess hydration overnight. This protects your plants from funguses and bacteria that grow well in excessive dampness!',
    'Tip 2: Make sure you\'re aware of how much light your plant needs, as some plants need lots of sun and some prefer partial light. This is especially true for indoor plants, as light can be easily manipulated by where they\'re placed indoors.',
    'Tip 3: For indoor plants, containers do matter! Some plants will keep growing their roots and have trouble with growth if they are unable to spread their roots in a small pot. As such, it\'s inportant to research which plants need what size containers.'
    'Tip 4: Soil quality is important. Ensure that the soil you have is filled with nutrients for '
  ];
  
  int currentTipIndex= 0;
  late Timer timer;
  
  void initState(){
    super.initState();
  

  timer = Timer.periodic(Duration(seconds: 30), (Timer t){
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
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}