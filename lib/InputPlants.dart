import 'package:flutter/material.dart';
import 'Navigation.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';


class InputPlants extends StatefulWidget {
  const InputPlants({super.key});

  @override
  State<InputPlants> createState() => _InputPlantsState();
}

class _InputPlantsState extends State<InputPlants> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _speciesController = TextEditingController();
  final _wateringScheduleController = TextEditingController();
  File? _image;

  Future pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

    @override
  void dispose() {
    _nameController.dispose();
    _speciesController.dispose();
    _wateringScheduleController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Navigation(),
      appBar: AppBar(
        title: const Text('Input Plants'),
        backgroundColor: Colors.pink,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Plant Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the plant name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _speciesController,
                decoration: const InputDecoration(labelText: 'Species'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the species';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _wateringScheduleController,
                decoration: const InputDecoration(labelText: 'Watering Schedule (hours)'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please how often the plant needs to be watered in the format dd:hh:ss';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              _image != null ? Image.file(_image!) : Text('No image selected.'),
              ElevatedButton(
                onPressed: pickImage,
                child: const Text('Pick an Image'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Here, you would usually send the data to a database or a state management solution
                    // For now, just pop the screen
                    Navigator.pop(context);
                  }
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
    ),
    );
  }
}