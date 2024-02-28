import 'package:flutter/material.dart';
import 'Navigation.dart';
class TipScreen extends StatelessWidget {
  const TipScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Navigation(),
      appBar: AppBar(
        title: Text('Tip Screen'),
        backgroundColor: Colors.amber,
      ),
    );
  }
}