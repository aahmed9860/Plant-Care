import 'package:flutter/material.dart';
import 'Navigation.dart';

class InputPlants extends StatefulWidget {
  const InputPlants({super.key});

  @override
  State<InputPlants> createState() => _InputPlantsState();
}

class _InputPlantsState extends State<InputPlants> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Navigation(),
      appBar: AppBar(
        title: Text('Input Plants'),
        backgroundColor: Colors.pink,
      ),
    );
  }
}