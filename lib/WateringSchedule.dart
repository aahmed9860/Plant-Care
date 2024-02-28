import 'package:flutter/material.dart';
import 'Navigation.dart';

class WateringSchedule extends StatefulWidget {
  const WateringSchedule({super.key});

  @override
  State<WateringSchedule> createState() => _WateringScheduleState();
}

class _WateringScheduleState extends State<WateringSchedule> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const Navigation(),
       appBar: AppBar(
        title: Text('Watering Schedule'),
        backgroundColor: Colors.blue,
      ),
    );
  }
}