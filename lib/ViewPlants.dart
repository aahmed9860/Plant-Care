import 'package:flutter/material.dart';
import 'Navigation.dart';
class ViewPlants extends StatefulWidget {
  const ViewPlants({super.key});

  @override
  State<ViewPlants> createState() => _ViewPlantsState();
}

class _ViewPlantsState extends State<ViewPlants> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Navigation(),
      appBar: AppBar(
        title: Text('View Plants'),
        backgroundColor: Colors.red,
      )
    );
  }
}