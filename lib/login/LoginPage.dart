import 'package:flutter/material.dart';
import 'package:plant_care/Navigation.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Navigation(),
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text('Login Screen'),
      )
    );
  }
}